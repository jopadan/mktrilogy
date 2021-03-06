#define DAVE

#include <string.h>
#include "u64main.h"
#include "inflate.h"
#include "romcopy.h"

/*
   Inflate deflated (PKZIP's method 8 compressed) data.  The compression
   method searches for as much of the current string of bytes (up to a
   length of 258) in the previous 32K bytes.  If it doesn't find any
   matches (of at least length 3), it codes the next byte.  Otherwise, it
   codes the length of the matched string and its distance backwards from
   the current position.  There is a single Huffman code that codes both
   single bytes (called "literals") and match lengths.  A second Huffman
   code codes the distance information, which follows a length code.  Each
   length or distance code actually represents a base value and a number
   of "extra" (sometimes zero) bits to get to add to the base value.  At
   the end of each deflated block is a special end-of-block (EOB) literal/
   length code.  The decoding process is basically: get a literal/length
   code; if EOB then done; if a literal, emit the decoded byte; if a
   length then get the distance and emit the referred-to bytes from the
   sliding window of previously emitted data.

   There are (currently) three kinds of inflate blocks: stored, fixed, and
   dynamic.  The compressor outputs a chunk of data at a time and decides
   which method to use on a chunk-by-chunk basis.  A chunk might typically
   be 32K to 64K, uncompressed.  If the chunk is uncompressible, then the
   "stored" method is used.  In this case, the bytes are simply stored as
   is, eight bits per byte, with none of the above coding.  The bytes are
   preceded by a count, since there is no longer an EOB code.

   If the data is compressible, then either the fixed or dynamic methods
   are used.  In the dynamic method, the compressed data is preceded by
   an encoding of the literal/length and distance Huffman codes that are
   to be used to decode this block.  The representation is itself Huffman
   coded, and so is preceded by a description of that code.  These code
   descriptions take up a little space, and so for small blocks, there is
   a predefined set of codes, called the fixed codes.  The fixed method is
   used if the block ends up smaller that way (usually for quite small
   chunks); otherwise the dynamic method is used.  In the latter case, the
   codes are customized to the probabilities in the current block and so
   can code it much better than the pre-determined fixed codes can.
 
   The Huffman codes themselves are decoded using a mutli-level table
   lookup, in order to maximize the speed of decoding plus the speed of
   building the decoding tables.  See the comments below that precede the
   LBITS and DBITS tuning parameters.
 */


/*
   Notes beyond the 1.93a appnote.txt:

   1. Distance pointers never point before the beginning of the output
      stream.
   2. Distance pointers can point back across blocks, up to 32k away.
   3. There is an implied maximum of 7 bits for the bit length table and
      15 bits for the actual data.
   4. If only one code exists, then it is encoded using one bit.  (Zero
      would be more efficient, but perhaps a little confusing.)  If two
      codes exist, they are coded using one bit each (0 and 1).
   5. There is no way of sending zero distance codes--a dummy must be
      sent if there are none.  (History: a pre 2.0 version of PKZIP would
      store blocks with no distance codes, but this was discovered to be
      too harsh a criterion.)  Valid only for 1.93a.  2.04c does allow
      zero distance codes, which is sent as one code of zero bits in
      length.
   6. There are up to 286 literal/length codes.  Code 256 represents the
      end-of-block.  Note however that the static length tree defines
      288 codes just to fill out the Huffman codes.  Codes 286 and 287
      cannot be used though, since there is no length base or extra bits
      defined for them.  Similarily, there are up to 30 distance codes.
      However, static trees define 32 codes (all 5 bits) to fill out the
      Huffman codes, but the last two had better not show up in the data.
   7. Unzip can check dynamic Huffman blocks for complete code sets.
      The exception is that a single code would not be complete (see #4).
   8. The five bits following the block type is really the number of
      literal codes sent minus 257.
   9. Length codes 8,16,16 are interpreted as 13 length codes of 8 bits
      (1+6+6).  Therefore, to output three times the length, you output
      three codes (1+1+1), whereas to output four times the same length,
      you only need two codes (1+3).  Hmm.
  10. In the tree reconstruction algorithm, Code = Code + Increment
      only if BitLength(i) is not zero.  (Pretty obvious.)
  11. Correction: 4 Bits: # of Bit Length codes - 4     (4 - 19)
  12. Note: length code 284 can represent 227-258, but length code 285
      really is 258.  The last length deserves its own, short code
      since it gets used a lot in very redundant files.  The length
      258 is special since 258 - 3 (the min match length) is 255.
  13. The literal/length and distance code bit lengths are read as a
      single stream of lengths.  It is possible (and advantageous) for
      a repeat code (16, 17, or 18) to go across the boundary between
      the two sets of lengths.
 */


#define PKZIP_BUG_WORKAROUND	/* PKZIP 1.93a problem--live with it */

#ifndef NULL
#define NULL ((void *)0)
#endif

#define LONG_MAX		0xFFFFFFFFL

#define BLOCK_STORED	0
#define BLOCK_FIXED		1
#define BLOCK_DYNAMIC	2

#define WSIZE			0x8000		/* window size */

#define DMASIZE			(0x8000 * 2L)		/* DMA SIZE */

#define NEXTBYTE		((in_memory || (comp_data_cnt-- > 0)) ? (*comp_data++) : (fill_comp_data()))

#define FLUSH(n)		window += n

/*
   Macros for inflate bit peeking and grabbing.
   The usage is:
   
        NEEDBITS(j);
        x = b & mask[j];
        DUMPBITS(j);

   where NEEDBITS makes sure that b has at least j bits in it, and
   DUMPBITS removes the bits from b.  The macros use the variable k
   for the number of bits in b.  Normally, b and k are register
   variables for speed, and are initialized at the begining of a
   routine that uses these macros from a global bit buffer and count.

   In order to not ask for more bits than there are in the compressed
   stream, the Huffman tables are constructed to only ask for just
   enough bits to make up the end-of-block code (value 256).  Then no
   bytes need to be "returned" to the buffer at the end of the last
   block.  See the huft_build() routine.
 */


#define NEEDBITS(n)		while (bit_count < (n)) {							\
							 bit_buffer |= ((ulong)NEXTBYTE) << bit_count;	\
							 bit_count += 8;								\
						 }



#define DUMPBITS(n)		do {						\
							 bit_buffer >>= (n);	\
							 bit_count -= (n);		\
						} while (0);

/*
   Huffman code decoding is performed using a multi-level table lookup.
   The fastest way to decode is to simply build a lookup table whose
   size is determined by the longest code.  However, the time it takes
   to build this table can also be a factor if the data being decoded
   is not very long.  The most common codes are necessarily the
   shortest codes, so those codes dominate the decoding time, and hence
   the speed.  The idea is you can have a shorter table that decodes the
   shorter, more probable codes, and then point to subsidiary tables for
   the longer codes.  The time it costs to decode the longer codes is
   then traded against the time it takes to make longer tables.

   This results of this trade are in the constants LBITS and DBITS
   below.  LBITS is the number of bits the first level table for literal/
   length codes can decode in one step, and DBITS is the same thing for
   the distance codes.  Subsequent tables are also less than or equal to
   those sizes.  These values may be adjusted either when all of the
   codes are shorter than that, in which case the longest code length in
   bits is used, or when the shortest code is *longer* than the requested
   table size, in which case the length of the shortest code in bits is
   used.

   There are two different values for the two tables, since they code a
   different number of possibilities each.  The literal/length table
   codes 286 possible values, or in a flat code, a little over eight
   bits.  The distance table codes 30 possible values, or a little less
   than five bits, flat.  The optimum values for speed end up being
   about one bit more than those, so LBITS is 8+1 and DBITS is 5+1.
   The optimum values may differ though from machine to machine, and
   possibly even between compilers.  Your mileage may vary.
 */

#define LBITS	9			/* bits in base literal/length lookup table */
#define DBITS	6			/* bits in base distance lookup table */

#define BMAX 16				/* maximum bit length of any code (16 for explode) */
#define N_MAX 288			/* maximum number of codes in any set */

/*
   huffman code lookup table entry
   0..13 valid extra bits
   15 end of block marker
   16 u.num is a literal
   17..31 pointer to next table, u.next + extra - 16 bits
   99 error case
*/
typedef struct _huff_entry {
	uchar extra;					/* number of extra bits or operation */
	uchar bits;						/* number of bits in this code or subcode */
	union {
		ushort num;					/* literal, length base, or distance base */
		struct _huff_entry *next;	/* pointer to next level of table */
	} u;
} huff_entry;


/* static prototypes */
static int huft_build(uint *b, uint n, uint s, ushort *d, ushort *e, huff_entry **t, int *m);
static void huft_free(huff_entry *tree);
static int inflate_codes(huff_entry *lit_tree, huff_entry *dist_tree, int num_bits_lit, int num_bits_dist);
static int inflate_stored(void);
static int inflate_fixed(void);
static void fixed_free(void);
static int inflate_dynamic(void);
static int init_memory(uchar *memory_pool, ulong pool_size, int in_memory);
static void *memory_alloc(ulong num_bytes);
static uchar fill_comp_data(void);
#ifdef DAVE
static int inflate_sub(uchar **dst, uchar *memory_pool, ulong pool_size);
#else
static int inflate_sub(uchar *dst, uchar *memory_pool, ulong pool_size);
#endif

static uchar *comp_data;			/* the compressed data byte input stream */
static uchar *uncomp_data;			/* the uncompressed data byte output stream */

static uchar *cart_addr;			/* the address in the cart to DMA from next */
static uchar *comp_data_buffer;		/* buffer for spooling data from the cart */
static long comp_data_cnt;			/* the number of bytes in the comp_data_buffer, used only when spooling from cart */
static int in_memory;				/* is the comp_data entirely in memory or on cart */
static int first_time;				/* need to flush the data cache before the first DMA */
static ulong uncomp_data_cnt;		/* the number of bytes to inflate */

static uchar *window;				/* sliding window for output and redundant string copy */
static uint global_window_index;	/* index into window */
static uchar *huff_pool_base;		/* start of psuedo dynamic pool */
static uchar *huff_pool_ptr;		/* current high water mark of psuedo dynamic pool */

/* globals for literal tables, used by inflate_fixed */
static huff_entry *fixed_tree_lit = NULL;
static huff_entry *fixed_tree_dist = NULL;
static int fixed_bits_lit;
static int fixed_bits_dist;

/* global bit buffers */
static ulong global_bit_buffer;
static uint global_bit_count;

/* Tables for deflate from PKZIP's appnote.txt. */
static uint border[] = {    /* Order of the bit length code lengths */
        16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15};
static ushort cplens[] = {         /* Copy lengths for literal codes 257..285 */
        3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 17, 19, 23, 27, 31,
        35, 43, 51, 59, 67, 83, 99, 115, 131, 163, 195, 227, 258, 0, 0};
        /* note: see note #12 above about the 258 in this list. */
static ushort cplext[] = {         /* Extra bits for literal codes 257..285 */
        0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2,
        3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0, 99, 99}; /* 99==invalid */
static ushort cpdist[] = {         /* Copy offsets for distance codes 0..29 */
        1, 2, 3, 4, 5, 7, 9, 13, 17, 25, 33, 49, 65, 97, 129, 193,
        257, 385, 513, 769, 1025, 1537, 2049, 3073, 4097, 6145,
        8193, 12289, 16385, 24577};
static ushort cpdext[] = {         /* Extra bits for distance codes */
        0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6,
        7, 7, 8, 8, 9, 9, 10, 10, 11, 11,
        12, 12, 13, 13};

/* And'ing with mask[n] masks the lower n bits */
static ushort mask[] = {
    0x0000,
    0x0001, 0x0003, 0x0007, 0x000F, 0x001F, 0x003F, 0x007F, 0x00FF,
    0x01FF, 0x03FF, 0x07FF, 0x0FFF, 0x1FFF, 0x3FFF, 0x7FFF, 0xFFFF
};


/* static functions */
/*
unsigned *b;            code lengths in bits (all assumed <= BMAX)
unsigned n;             number of codes (assumed <= N_MAX)
unsigned s;             number of simple-valued codes (0..s-1)
ushort *d;                 list of base values for non-simple codes
ushort *e;                 list of extra bits for non-simple codes
huff_entry **t;        result: starting table
int *m;                 maximum lookup bits, returns actual
*/
/*
   Given a list of code lengths and a maximum table size, make a set of
   tables to decode that set of codes.  Return zero on success, one if
   the given code set is incomplete (the tables are still built in this
   case), two if the input is invalid (all zero length codes or an
   oversubscribed set of lengths), and three if not enough memory.
   The code with value 256 is special, and the tables are constructed
   so that no bits beyond that code are fetched when that code is
   decoded.
*/
static int huft_build(uint *b, uint n, uint s, ushort *d, ushort *e, huff_entry **t, int *m)
{
	uint a;                   /* counter for codes of length k */
	static uint c[BMAX+1];           /* bit length count table */
	uint el;                  /* length of EOB code (value 256) */
	uint f;                   /* i repeats in table every f entries */
	int g;                        /* maximum code length */
	int h;                        /* table level */
	uint i;          /* counter, current code */
	uint j;          /* counter */
	int k;               /* number of bits in current code */
	static int lx[BMAX+1];               /* memory for l[-1..BMAX-1] */
	int *l = lx + 1;                /* stack of bits per table */
	uint *p;         /* pointer into c[], b[], or v[] */
	huff_entry *q;      /* points to current table */
	huff_entry r;                /* table entry for structure assignment */
	static huff_entry *u[BMAX];         /* table stack */
	static uint v[N_MAX];     /* values in order of bit length */
	int w;               /* bits before this table == (l * h) */
	static uint x[BMAX+1];           /* bit offsets, then code stack */
	uint *xp;                 /* pointer into x */
	int y;                        /* number of dummy codes added */
	uint z;                   /* number of entries in current table */
	
	/* Generate counts for each bit length */
	el = n > 256 ? b[256] : BMAX; /* set length of EOB code, if any */

	/* clear out the bit length count table */
	for (i = 0; i < BMAX + 1; i++)
		c[i] = 0;
	
	p = b;
	i = n;
	do {
		c[*p]++;				/* assume all entries <= BMAX */
		p++;
	} while (--i);
	if (c[0] == n) {			/* null input--all zero length codes */
		*t = NULL;
		*m = 0;
		return INFLATE_NO_ERR;
	}
	
	/* Find minimum and maximum length, bound *m by those */
	for (j = 1; j <= BMAX; j++)
		if (c[j] != 0)
			break;
	k = j;                        /* minimum code length */
	if ((uint)*m < j)
		*m = j;
	
	for (i = BMAX; i; i--)
		if (c[i] != 0)
			break;
	g = i;                        /* maximum code length */
	if ((uint)*m > i)
		*m = i;
	
	/* Adjust last length count to fill out codes, if needed */
	for (y = 1 << j; j < i; j++, y <<= 1) {
		y -= c[j];
		if (y < 0)
			return INFLATE_TOO_MANY_CODES;                 /* bad input: more codes than bits */
	}
	y -= c[i];
	if (y < 0)
		return INFLATE_TOO_MANY_CODES;
	c[i] += y;
	
	/* Generate starting offsets into the value table for each length */
	j = 0;
	x[1] = 0;
	p = c + 1;
	xp = x + 2;
	while (--i) {                 /* note that i == g from above */
		j += *p++;
		*xp++ = j;
	}
	
	/* Make a table of values in order of bit lengths */
	p = b;
	i = 0;
	do {
		j = *p++;
		if (j != 0)
			v[x[j]++] = i;
	} while (++i < n);
	
	/* Generate the Huffman codes and for each, make the table entries */
	i = 0;
	x[0] = 0;                 /* first Huffman code is zero */
	p = v;                        /* grab values in bit order */
	h = -1;                       /* no tables yet--level -1 */
	l[-1] = 0;                /* no bits decoded yet */
	w = 0;                /* no bits decoded yet */
	u[0] = NULL;   /* just to keep compilers happy */
	q = NULL;      /* ditto */
	z = 0;                        /* ditto */
	
	/* go through the bit lengths (k already is bits in shortest code) */
	for (; k <= g; k++) {
		a = c[k];
		while (a--) {
			/* here i is the Huffman code of length k bits for value *p */
			/* make tables up to required level */
			while (k > w + l[h]) {
				w += l[h++];            /* add bits already decoded */
				
				/* compute minimum size table less than or equal to *m bits */
				z = g - w;
				z = z > (uint)*m ? *m : z;        /* upper limit */

				j = k - w;
				f = 1 << j;
				if (f > a + 1) {     /* try a k-w bit table */
					/* too few codes for k-w bit table */
					f -= a + 1;           /* deduct codes from patterns left */
					xp = c + k;
					while (++j < z) {       /* try smaller tables up to z bits */
						f <<= 1;
						if (f <= *++xp)
							break;            /* enough codes to use up j bits */
						f -= *xp;           /* else deduct codes from patterns */
					}
				}
				if ((uint)w + j > el && (uint)w < el)
					j = el - w;           /* make EOB code end at table */
				z = 1 << j;             /* table entries for j-bit table */
				l[h] = j;               /* set table size in stack */
				
				/* allocate and link in new table */
				if ((q = (huff_entry *)memory_alloc((z + 1) * sizeof(huff_entry))) == NULL) {
					if (h)
						huft_free(u[0]);
					return INFLATE_MEM_ALLOC_ERR;             /* not enough memory */
				}
				*t = q + 1;             /* link to list for huft_free() */
				t = &(q->u.next);
				*t = NULL;
				u[h] = ++q;             /* table starts after link */
				
				/* connect to last table, if there is one */
				if (h) {
					x[h] = i;             /* save pattern for backing up */
					r.bits = (uchar)l[h - 1];    /* bits to dump before this table */
					r.extra = (uchar)(16 + j);  /* bits in this table */
					r.u.next = q;            /* pointer to this table */
					j = (i & ((1 << w) - 1)) >> (w - l[h - 1]);
					u[h - 1][j] = r;        /* connect to last table */
				}
			}
			
			/* set up table entry in r */
			r.bits = (uchar)(k - w);
			if (p >= v + n)
				r.extra = 99;               /* out of values--invalid code */
			else if (*p < s) {
				r.extra = (uchar)(*p < 256 ? 16 : 15);    /* 256 is end-of-block code */
				r.u.num = *p++;           /* simple code is just the value */
			} else {
				r.extra = (uchar)e[*p - s];   /* non-simple--look up in lists */
				r.u.num = d[*p++ - s];
			}
			
			/* fill code-like entries with r */
			f = 1 << (k - w);
			for (j = i >> w; j < z; j += f)
				q[j] = r;
			
			/* backwards increment the k-bit code i */
			for (j = 1 << (k - 1); i & j; j >>= 1)
				i ^= j;
			i ^= j;
			
			/* backup over finished tables */
			while ((i & ((1 << w) - 1)) != x[h])
				w -= l[--h];            /* don't need to update q */
		}
	}
	
	/* return actual size of base table */
	*m = l[0];
	
	return y != 0 && g != 1 ? INFLATE_INCOMPLETE_TABLE_ERR : INFLATE_NO_ERR;
}  /* huft_build */


/*
   free the tables created in huft_build(), which makes a linked
   list of the tables with the links in a dummy first entry of
   each table.
*/
static void huft_free(huff_entry *tree)
{
#if 0
	huff_entry *node, *next;
	
	/* go through linked list, freeing from the malloced (tree[-1]) address */
	for (node = tree; node != NULL; node = next) {
		next = (--node)->u.next;
		free(node);
	}
#endif
}  /* huft_free */


/*
   inflate the codes in a deflated block, returns an error status
*/
static int inflate_codes(huff_entry *lit_tree, huff_entry *dist_tree, int num_bits_lit, int num_bits_dist)
{
	uint extra;
	uint length, index;
	huff_entry *entry;
	uint mask_lit, mask_dist;
	uint window_index;
	ulong bit_buffer;
	uint bit_count;
	uchar *old_window;
	
	/* copy globals to local */
	bit_buffer = global_bit_buffer;
	bit_count = global_bit_count;
	window_index = global_window_index;
	
	/* precompute bit masks */
	mask_lit = mask[num_bits_lit];
	mask_dist = mask[num_bits_dist];
	
	/* inflate the coded data */
	while (1) {
		NEEDBITS((uint)num_bits_lit);
		entry = lit_tree + ((uint)bit_buffer & mask_lit);
		extra = entry->extra;
		if (extra > 16)				/* pointer to next table */
			do {
				if (extra == 99)	/* error in data stream */
					return INFLATE_LOOKUP_ERR;
				DUMPBITS(entry->bits);
				extra -= 16;
				NEEDBITS(extra);
				entry = entry->u.next + ((uint)bit_buffer & mask[extra]);
				extra = entry->extra;
			} while (extra > 16);
		DUMPBITS(entry->bits);
		if (extra == 16) {			/* u.num is literal data */
			*uncomp_data++ = (uchar)entry->u.num;
			if (++window_index == WSIZE) {
				FLUSH(window_index);
				window_index = 0;
			}
			if (--uncomp_data_cnt == 0)
				break;
		} else {
			if (extra == 15)		/* end of block code */
				break;
			
			/* get length of block to copy */
			NEEDBITS(extra);
			length = entry->u.num + ((uint)bit_buffer & mask[extra]);
			DUMPBITS(extra);
			
			/* decode distance of block to copy */
			NEEDBITS((uint)num_bits_dist);
			entry = dist_tree + ((uint)bit_buffer & mask_dist);
			extra = entry->extra;
			if (extra > 16)
				do {
					if (extra == 99)
						return INFLATE_LOOKUP_ERR;
					DUMPBITS(entry->bits);
					extra -= 16;
					NEEDBITS(extra);
					entry = entry->u.next + ((uint)bit_buffer & mask[extra]);
					extra = entry->extra;
				} while (extra > 16);
			DUMPBITS(entry->bits);
			NEEDBITS(extra);
			index = window_index - entry->u.num - ((uint)bit_buffer & mask[extra]);
			DUMPBITS(extra);
			
			/* copy the block from the previous spot in the window */
			do {
				index &= WSIZE - 1;
				extra = WSIZE - (index > window_index ? index : window_index);
				if (extra > length)
					extra = length;
				length -= extra;
							
				/* check for partial output limit */
				if (uncomp_data_cnt < extra) {
					extra = uncomp_data_cnt;
					length = 0;
				}
				uncomp_data_cnt -= extra;
				
				if (index >= window_index) {	/* the data is in the previous window */
					window_index += extra;
					old_window = window - WSIZE;
					do {
						*uncomp_data++ = old_window[index++];
					} while (--extra);
				} else {
					window_index += extra;
					do {
						*uncomp_data++ = window[index++];
					} while (--extra);
				}
				if (window_index == WSIZE) {
					FLUSH(window_index);
					window_index = 0;
				}
			} while (length);
		}
	}
	
	/* restore the globals */
	global_window_index = window_index;
	global_bit_buffer = bit_buffer;
	global_bit_count = bit_count;
	
	/* done */
	return uncomp_data_cnt == 0 ? INFLATE_PARTIAL_DONE : INFLATE_NO_ERR;
}  /* inflate_codes */


/*
   inflate a stored block
*/
static int inflate_stored(void)
{
	uint n, window_index, bit_count;
	ulong bit_buffer;
	
	/* copy globals to local */
	bit_buffer = global_bit_buffer;
	bit_count = global_bit_count;
	window_index = global_window_index;
	
	/* align data stream to next byte boundary */
	n = bit_count & 7;
	DUMPBITS(n);
	
	/* get the stored block length */
	NEEDBITS(16);
	n = (uint)bit_buffer & 0xFFFF;
	DUMPBITS(16);

	/* get the stored block complement length */
	NEEDBITS(16);
	if (n != (uint)((~bit_buffer) & 0xFFFF))
		return INFLATE_BAD_STORED_SIZE_ERR;
	DUMPBITS(16);
	
	/* check for partial output limit */
	if (uncomp_data_cnt < n)
		n = uncomp_data_cnt;
	uncomp_data_cnt -= n;
	
	/* read and output the compressed data */
	while (n--) {
		NEEDBITS(8);
		*uncomp_data++ = (uchar)bit_buffer;
		if (++window_index == WSIZE) {
			FLUSH(window_index);
			window_index = 0;
		}
		DUMPBITS(8);
	}
	
	/* restore the globals */
	global_window_index = window_index;
	global_bit_buffer = bit_buffer;
	global_bit_count = bit_count;
	return uncomp_data_cnt == 0 ? INFLATE_PARTIAL_DONE : INFLATE_NO_ERR;
}  /* inflate_stored */


/*
   inflated a fixed block
*/
static int inflate_fixed(void)
{
	int i;
	static uint bit_length[288];
	
	/* if the fixed tree do not exist, build them */
	if (fixed_tree_lit == NULL) {
		/* literal table */
		for (i = 0; i < 144; i++)
			bit_length[i] = 8;
		for (; i < 256; i++)
			bit_length[i] = 9;
		for (; i < 280; i++)
			bit_length[i] = 7;
		for (; i < 288; i++)			/* make a complete, but wrong code set */
			bit_length[i] = 8;
		fixed_bits_lit = 7;
		i = huft_build(bit_length, 288, 257, cplens, cplext, &fixed_tree_lit, &fixed_bits_lit);
		if (i != INFLATE_NO_ERR) {
			fixed_tree_lit = NULL;
			return i;
		}
		
		/* distance table */
		for (i = 0; i < 30; i++)		/* make an incomplete code set */
			bit_length[i] = 5;
		fixed_bits_dist = 5;
		i = huft_build(bit_length, 30, 0, cpdist, cpdext, &fixed_tree_dist, &fixed_bits_dist);
		if (i != INFLATE_NO_ERR && i != INFLATE_INCOMPLETE_TABLE_ERR) {
			huft_free(fixed_tree_lit);
			fixed_tree_lit = NULL;
			fixed_tree_dist = NULL;
			return i;
		}
	}
	
	/* decompress until an end of block code */
	return inflate_codes(fixed_tree_lit, fixed_tree_dist, fixed_bits_lit, fixed_bits_dist);
}  /* inflate_fixed */


/*
   free the trees build by inflate_fixed()
*/
static void fixed_free(void)
{
	if (fixed_tree_lit != NULL) {
		/* free the fixed literal table */
		huft_free(fixed_tree_lit);
		fixed_tree_lit = NULL;

		/* free the fixed distance table */
		huft_free(fixed_tree_dist);
		fixed_tree_dist = NULL;
	}
}  /* fixed_free */


/*
   inflate a dynamic block
*/
static int inflate_dynamic(void)
{
	int i;
	uint j;
	uint l;           /* last length */
	uint m;           /* mask for bit lengths table */
	uint n;           /* number of lengths to get */
	huff_entry *tree_lit;
	huff_entry *tree_dist;
	int num_bits_lit;
	int num_bits_dist;
	uint num_bit_code;
	uint num_lit_code;
	uint num_dist_code;
#ifdef PKZIP_BUG_WORKAROUND
	static uint ll[288+32]; /* literal/length and distance code lengths */
#else
	static uint ll[286+30]; /* literal/length and distance code lengths */
#endif
	ulong bit_buffer;
	uint bit_count;
	
	/* copy globals to local */
	bit_buffer = global_bit_buffer;
	bit_count = global_bit_count;
	
	/* read in table lengths */
	NEEDBITS(5);
	num_lit_code = 257 + ((uint)bit_buffer & 0x1F);		/* appnote incorrectly says 256 */
	DUMPBITS(5);
	NEEDBITS(5);
	num_dist_code = 1 + ((uint)bit_buffer & 0x1F);
	DUMPBITS(5);
	NEEDBITS(4);
	num_bit_code = 4 + ((uint)bit_buffer & 0xF);		/* appnote incorrectly says 3 */
	DUMPBITS(4);
#ifdef PKZIP_BUG_WORKAROUND
	if (num_lit_code > 288 || num_dist_code > 32)
#else
	if (num_lit_code > 286 || num_dist_code > 30)
#endif
		return INFLATE_BAD_LENGTH_ERR;
	
	/* read in bit length code lengths */
	for (j = 0; j < num_bit_code; j++) {
		NEEDBITS(3);
		ll[border[j]] = (uint)bit_buffer & 7;
		DUMPBITS(3);
	}
	for (; j < 19; j++)
		ll[border[j]] = 0;
	
	/* build decoding table for trees, single level, 7 bit lookup */
	num_bits_lit = 7;
	i = huft_build(ll, 19, 19, NULL, NULL, &tree_lit, &num_bits_lit);
	if (i != INFLATE_NO_ERR) {
		if (i == INFLATE_INCOMPLETE_TABLE_ERR)
			huft_free(tree_lit);
		return i;
	}
	
	/* read in literal and distance code lengths */
	n = num_lit_code + num_dist_code;
	m = mask[num_bits_lit];
	l = 0;
	i = 0;
	while ((uint)i < n) {
		NEEDBITS((uint)num_bits_lit);
		j = (tree_dist = tree_lit + ((uint)bit_buffer & m))->bits;
		DUMPBITS(j);
		j = tree_dist->u.num;
		if (j < 16) {					/* length of code in bits (0..15) */
			l = j;						/* save last length */
			ll[i++] = j;
		} else if (j == 16) {			/* repeat last length 3 to 6 times */
			NEEDBITS(2);
			j = 3 + ((uint)bit_buffer & 3);
			DUMPBITS(2);
			if ((uint)i + j > n)
				return INFLATE_DYNAMIC_TABLE_ERR;
			while (j--)
				ll[i++] = l;
		} else if (j == 17) {			/* 3 to 10 zero length codes */
			NEEDBITS(3);
			j = 3 + ((uint)bit_buffer & 7);
			DUMPBITS(3);
			if ((uint)i + j > n)
				return INFLATE_DYNAMIC_TABLE_ERR;
			while (j--)
				ll[i++] = 0;
			l = 0;
		} else {						/* j == 18: 11 to 138 zero length codes */
			NEEDBITS(7);
			j = 11 + ((uint)bit_buffer & 0x7F);
			DUMPBITS(7);
			if ((uint)i + j > n)
				return INFLATE_DYNAMIC_TABLE_ERR;
			while (j--)
				ll[i++] = 0;
			l = 0;
		}
	}
	
	/* free decoding table for trees */
	huft_free(tree_lit);
	
	/* restore the globals */
	global_bit_buffer = bit_buffer;
	global_bit_count = bit_count;
	
	/* build the decoding tables for literal/length codes */
	num_bits_lit = LBITS;
	i = huft_build(ll, num_lit_code, 257, cplens, cplext, &tree_lit, &num_bits_lit);
	if (i != INFLATE_NO_ERR) {
		if (i == INFLATE_INCOMPLETE_TABLE_ERR) {
			huft_free(tree_lit);
		}
		return i;
	}
	
#ifdef PKZIP_BUG_WORKAROUND
	/* build the decoding tables for distance codes */
	num_bits_dist = DBITS;
	i = huft_build(ll + num_lit_code, num_dist_code, 0, cpdist, cpdext, &tree_dist, &num_bits_dist);
	if (i != INFLATE_NO_ERR) {
		if (i == INFLATE_INCOMPLETE_TABLE_ERR) {
			i = INFLATE_NO_ERR;
		}
	}
#else
	/* build the decoding tables for distance codes */
	num_bits_dist = DBITS;
	i = huft_build(ll + num_lit_code, num_dist_code, 0, cpdist, cpdext, &tree_dist, &num_bits_dist);
	if (i != INFLATE_NO_ERR) {
		if (i == INFLATE_INCOMPLETE_TABLE_ERR) {
			huft_free(tree_dist);
	    }
	    huft_free(tree_lit);
	    return i;
	}
#endif
	
	/* decompress until an end-of-block code */
	i = inflate_codes(tree_lit, tree_dist, num_bits_lit, num_bits_dist);
	
	/* free the decoding tables */
	huft_free(tree_lit);
	huft_free(tree_dist);
	
	/* reset the pool to baseline */
	huff_pool_ptr = huff_pool_base;
	
	return i;
}  /* inflate_dynamic */

static int init_memory(uchar *memory_pool, ulong pool_size, int in_memory)
{
	/* set up the window and dynamic memory space */
	if (memory_pool == NULL || pool_size < ((in_memory ? 0 : DMASIZE) + 3000 * sizeof(huff_entry)))
		return INFLATE_MEM_ALLOC_ERR;
	
	window = uncomp_data;

	if (in_memory) {
		/* align to a 8 byte boundary */
		huff_pool_base = (uchar *)(((ulong)memory_pool + 7) & ~7);
		huff_pool_ptr = huff_pool_base;
	} else {
		/* align to a 8 byte boundary */
		comp_data_buffer = (uchar *)(((ulong)memory_pool + 7) & ~7);
		comp_data_cnt = 0;			/* need to load up comp_data_buffer */
		
		first_time = 1;				/* let the DMA know it needs to flush the cache */
		
		/* align to a 8 byte boundary */
		huff_pool_base = (uchar *)(((ulong)comp_data_buffer + DMASIZE + 7) & ~7);
		huff_pool_ptr = huff_pool_base;
	}
	return INFLATE_NO_ERR;
}  /* init_memory */

static void *memory_alloc(ulong num_bytes)
{
	uchar *ptr;
#if 0
	return malloc(num_bytes);
#else
	ptr = huff_pool_ptr;
	huff_pool_ptr = (uchar *)((ulong)(ptr + num_bytes + 7) & ~7);
	return ptr;
#endif
}  /* memory_alloc */


static uchar fill_comp_data(void)
{
#ifdef DAVE
	romcopy_sync(cart_addr, (void *)comp_data_buffer, DMASIZE, first_time ? RCFLAG_FLUSHDATA : 0);
	first_time = 0;
#else
	ulong i;

	for (i = 0; i < DMASIZE; i++)
		comp_data_buffer[i] = cart_addr[i];
#endif
	cart_addr += DMASIZE;
	comp_data = comp_data_buffer;
	comp_data_cnt = DMASIZE - 1;				/* we use one when we return */
	return *comp_data++;
}  /* fill_comp_data */


#ifdef DAVE
static int inflate_sub(uchar **dst, uchar *memory_pool, ulong pool_size)
#else
static int inflate_sub(uchar *dst, uchar *memory_pool, ulong pool_size)
#endif
{
	int last_block, block_type, ret;
	ulong bit_buffer;
	uint bit_count;
	
	/* set up the output buffer */
#ifdef DAVE
	uncomp_data = *dst;
#else
	uncomp_data = dst;
#endif

	ret = init_memory(memory_pool, pool_size, in_memory);
	if (ret != INFLATE_NO_ERR)
		return ret;

	/* init the window pointer to the start of the buffer */
	global_window_index = 0;
	
	/* initialize bit buffer and bit counter */
	global_bit_count = 0;
	global_bit_buffer = 0;
	
	/* decompress until the last block is expanded */
	for (;;) {
		/* copy globals to local */
		bit_buffer = global_bit_buffer;
		bit_count = global_bit_count;
		
		/* read in last block bit */
		NEEDBITS(1);
		last_block = (int)bit_buffer & 1;
		DUMPBITS(1);
		
		/* read in block type */
		NEEDBITS(2);
		block_type = (int)bit_buffer & 3;
		DUMPBITS(2);
		
		/* restore the globals */
		global_bit_buffer = bit_buffer;
		global_bit_count = bit_count;
		
		/* decode the block */
		if (block_type == BLOCK_DYNAMIC)
			ret = inflate_dynamic();
		else if (block_type == BLOCK_STORED)
			ret = inflate_stored();
		else if (block_type == BLOCK_FIXED)
			ret = inflate_fixed();
		else
			ret = INFLATE_INVALID_BLOCK_ERR;
		
		/* check if done or an error */
		if (last_block || ret != INFLATE_NO_ERR)
			break;
	}
	
	/* flush out window */
	FLUSH(global_window_index);
	
	/* free up the inflate_fixed data structures */
	fixed_free();
	
	/* return success */
#ifdef DAVE
	*dst = uncomp_data;
#endif
	if (ret == INFLATE_PARTIAL_DONE)
		ret = INFLATE_NO_ERR;
	return ret;
}  /* inflate_sub */


/*
   inflate a compressed data chunk, the compressed data is entirely in memory
*/
#ifdef DAVE
int inflate(uchar *mem_src, uchar **dst, uchar *memory_pool, ulong pool_size)
#else
int inflate(uchar *mem_src, uchar *dst, uchar *memory_pool, ulong pool_size)
#endif
{
	uncomp_data_cnt = LONG_MAX;				/* inflate all bytes */
	
	/* set up the input buffer */
	comp_data = mem_src + sizeof(long);
	in_memory = 1;
	return inflate_sub(dst, memory_pool, pool_size);
}  /* inflate */

/*
   inflate a compressed data chunk, the compressed data is on the cartridge
*/
#ifdef DAVE
int inflate_cart(uchar *cart_src, uchar **dst, uchar *memory_pool, ulong pool_size)
#else
int inflate_cart(uchar *cart_src, uchar *dst, uchar *memory_pool, ulong pool_size)
#endif
{
	uncomp_data_cnt = LONG_MAX;				/* inflate all bytes */
	
	/* set up the input buffer */
	cart_addr = cart_src;
	in_memory = 0;
	return inflate_sub(dst, memory_pool, pool_size);
}  /* inflate_cart */

/*
   inflate a compressed data chunk, the compressed data is on the cartridge, the number of bytes inflated is limited to inflate_count
*/
#ifdef DAVE
int inflate_cart_partial(uchar *cart_src, uchar **dst, ulong inflate_count, uchar *memory_pool, ulong pool_size)
#else
int inflate_cart_partial(uchar *cart_src, uchar *dst, ulong inflate_count, uchar *memory_pool, ulong pool_size)
#endif
{
	uncomp_data_cnt = inflate_count;		/* inflate only this amount */
	
	if (inflate_count > 0) {
		/* set up the input buffer */
		cart_addr = cart_src;
		in_memory = 0;
		return inflate_sub(dst, memory_pool, pool_size);
	} else
		return INFLATE_NO_ERR;
}  /* inflate_cart_partial */
