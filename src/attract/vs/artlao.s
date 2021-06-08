#include <regdef.h>

	.option	pic0

	.set noreorder
	.data

/*
;******************************************************************************
; File: artverse.s
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Verse Art Textures
;******************************************************************************
*/

/* LAO */
	.align 2
	.globl lao_pieces
lao_pieces:
	.half	0x5c,0x35+15,0x128,0x35+15
	.word VKLFLESH1A,0
	.word VKLFLESH1B,0
	.word VKLFLESH1C,0
	.word VKLFLESH1D,0
	.word VKLFLESH1E,0
	.word VKLGREY1A,0
	.word VKLGREY1B,0
	.word VKLGREY1C,0
	.word VKLGREY1D,0
	.word VKLGREY1E,0
	.word VKLGREY1F,0
	.word VKLGREY1G,0
	.word VKLPANTS1A,VKLBLU_P
	.word VKLPANTS1B,VKLBLU_P
	.word	0
	
VKLFLESH1A:
	.word KLFLESH1A
	.word 0
VKLFLESH1B:
	.word KLFLESH1B
	.word 0
VKLFLESH1C:
	.word KLFLESH1C
	.word 0
VKLFLESH1D:
	.word KLFLESH1D
	.word 0
VKLFLESH1E:
	.word KLFLESH1E
	.word 0
VKLGREY1A:
	.word KLGREY1A
	.word 0
VKLGREY1B:
	.word KLGREY1B
	.word 0
VKLGREY1C:
	.word KLGREY1C
	.word 0
VKLGREY1D:
	.word KLGREY1D
	.word 0
VKLGREY1E:
	.word KLGREY1E
	.word 0
VKLGREY1F:
	.word KLGREY1F
	.word 0
VKLGREY1G:
	.word KLGREY1G
	.word 0
VKLPANTS1A:
	.word KLPANTS1A
	.word 0
VKLPANTS1B:
	.word KLPANTS1B
	.word 0



KLFLESH1A:
	.word 0x00000000
	.half 46, 66, 84, -26
	.word	VKLSKIN_P
KLFLESH1B:
	.word 0x00000500
	.half 87, 10, 42, -72
	.word	VKLSKIN_P
KLFLESH1C:
	.word 0x0000068C
        .half 134, 51, 32, -25
	.word	VKLSKIN_P
KLFLESH1D:
	.word 0x00001368
	.half 116, 39, -19, -25
	.word	VKLSKIN_P
KLFLESH1E:
	.word 0x00001A34
	.half 70, 33, -58, -72
	.word	VKLSKIN_P
KLGREY1A:
	.word 0x00001CD0
	.half 20, 26, 70, -27
	.word	VKLGRAY_P
KLGREY1B:
	.word 0x00001DE4
        .half 137, 47, 43, -6
	.word	VKLGRAY_P
KLGREY1C:
	.word 0x00002418
	.half 34, 22, -61, -94
	.word	VKLGRAY_P
KLGREY1D:
	.word 0x0000253C
	.half 31, 27, 0, -151
	.word	VKLGRAY_P
KLGREY1E:
	.word 0x00002610
	.half 83, 59, -4, -1
	.word	VKLGRAY_P
KLGREY1F:
	.word 0x00002B38
	.half 28, 18, -4, -114
	.word	VKLGRAY_P
KLGREY1G:
	.word 0x00002BEC
        .half 40, 46, 52, -142
	.word	VKLGRAY_P
KLPANTS1A:
	.word 0x00002F04
        .half 18, 9, 38, -164
	.word	VKLTAN_P
KLPANTS1B:
	.word 0x00002F6C
        .half 25, 32, 7, -157
	.word	VKLTAN_P


	.align 2
	.globl lao_dict
lao_dict:
#include "lao.dct"

