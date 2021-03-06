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

/* LIU KANG */
	.align 2
	.globl lk_pieces
lk_pieces:	
	.half	0x60,0x35+31,0x12c,0x35+31
	.word VLKFLESH1A,0
	.word VLKFLESH1B,0
	.word VLKFLESH1C,0
	.word VLKFLESH1D,0
	.word VLKFLESH1E,0
	.word VLKGREY1A,0
	.word VLKGREY1B,0
	.word VLKGREY1C,0
	.word VLKGREY1D,0
	.word VLKGREY1E,0
	.word VLKRED1A,VLKYEL_P
	.word VLKRED1B,VLKYEL_P
	.word VLKRED1C,VLKYEL_P
	.word 0
	
VLKFLESH1A:
	.word LKFLESH1A
	.word 0
VLKFLESH1B:
	.word LKFLESH1B
	.word 0
VLKFLESH1C:
	.word LKFLESH1C
	.word 0
VLKFLESH1D:
	.word LKFLESH1D
	.word 0
VLKFLESH1E:
	.word LKFLESH1E
	.word 0
VLKGREY1A:
	.word LKGREY1A
	.word 0
VLKGREY1B:
	.word LKGREY1B
	.word 0
VLKGREY1C:
	.word LKGREY1C
	.word 0
VLKGREY1D:
	.word LKGREY1D
	.word 0
VLKGREY1E:
	.word LKGREY1E
	.word 0
VLKRED1A:
	.word LKRED1A
	.word 0
VLKRED1B:
	.word LKRED1B
	.word 0
VLKRED1C:
	.word LKRED1C
	.word 0
	
	
	
LKFLESH1A:
	.word 0x00000000
	.half 73, 28, 73, -66
	.word	VLKSKIN_P
LKFLESH1B:
	.word 0x00000390
	.half 98, 35, 45, -57
	.word	VLKSKIN_P
LKFLESH1C:
	.word 0x00000BCC
	.half 26, 15, -65, -79
	.word	VLKSKIN_P
LKFLESH1D:
	.word 0x00000CF0
	.half 78, 38, -28, -76
	.word	VLKSKIN_P
LKFLESH1E:
	.word 0x000011E4
	.half 124, 38, 10, -28
	.word	VLKSKIN_P
LKGREY1A:
	.word 0x00001D9C
	.half 80, 28, 18, 0
	.word	VLKGRAY_P
LKGREY1B:
	.word 0x00002054
        .half 67, 18, -10, 0
	.word	VLKGRAY_P
LKGREY1C:
	.word 0x00002188
	.half 36, 22, -54, -98
	.word	VLKGRAY_P
LKGREY1D:
	.word 0x000022E8
	.half 48, 51, 56, -121
	.word	VLKGRAY_P
LKGREY1E:
	.word 0x000025C8
        .half 18, 11, 5, -151
	.word	VLKGRAY_P
LKRED1A:
	.word 0x0000263C
	.half 56, 53, 24, -19
	.word	VLKRED_P
LKRED1B:
	.word 0x0000288C
        .half 27, 17, 58, -142
	.word	VLKRED_P
LKRED1C:
	.word 0x00002984
        .half 23, 51, 39, -146
	.word	VLKRED_P

	.align 2
	.globl lk_dict
lk_dict:	
#include "lk.dct"

