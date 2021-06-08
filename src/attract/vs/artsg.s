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

/* SG */
	.align 2
	.globl sg_pieces
sg_pieces:
	.half	0x5c,0x33+18,0x128,0x33+18
	.word VSHFLESH1A,0
	.word VSHFLESH1B,0
	.word VSHFLESH1C,0
	.word VSHFLESH1D,0
	.word VSHFLESH1E,0
	.word VSHFLESH1F,0
	.word VSHFLESH1G,0
	.word VSHFLESH1H,0
	.word VSHFLESH1I,0
	.word VSHGREY1A,0
	.word VSHGREY1B,0
	.word VSHGREY1C,0
	.word VSHGREY1D,0
	.word VSHGREY1E,0
	.word VSHGREY1F,0
	.word VSHGREY1G,0
	.word VSHRED1A,VSHBLU_P
	.word VSHRED1B,VSHBLU_P
	.word VSHRED1C,VSHBLU_P
	.word VSHRED1D,VSHBLU_P
	.word 0
	
VSHFLESH1A:
	.word SHFLESH1A
	.word 0
VSHFLESH1B:
	.word SHFLESH1B
	.word 0
VSHFLESH1C:
	.word SHFLESH1C
	.word 0
VSHFLESH1D:
	.word SHFLESH1D
	.word 0
VSHFLESH1E:
	.word SHFLESH1E
	.word 0
VSHFLESH1F:
	.word SHFLESH1F
	.word 0
VSHFLESH1G:
	.word SHFLESH1G
	.word 0
VSHFLESH1H:
	.word SHFLESH1H
	.word 0
VSHFLESH1I:
	.word SHFLESH1I
	.word 0
VSHGREY1A:
	.word SHGREY1A
	.word 0
VSHGREY1B:
	.word SHGREY1B
	.word 0
VSHGREY1C:
	.word SHGREY1C
	.word 0
VSHGREY1D:
	.word SHGREY1D
	.word 0
VSHGREY1E:
	.word SHGREY1E
	.word 0
VSHGREY1F:
	.word SHGREY1F
	.word 0
VSHGREY1G:
	.word SHGREY1G
	.word 0
VSHRED1A:
	.word SHRED1A
	.word 0
VSHRED1B:
	.word SHRED1B
	.word 0
VSHRED1C:
	.word SHRED1C
	.word 0
VSHRED1D:
	.word SHRED1D
	.word 0
	
	
	
SHFLESH1A:
	.word 0x00000000
	.half 37, 19, 64, -8
	.word	VSHESKIN_
SHFLESH1B:
	.word 0x00000160
	.half 60, 31, 82, -64
	.word	VSHESKIN_
SHFLESH1C:
	.word 0x00000490
        .half 27, 17, 21, -156
	.word	VSHESKIN_
SHFLESH1D:
	.word 0x000005AC
	.half 61, 28, -55, -93
	.word	VSHESKIN_
SHFLESH1E:
	.word 0x00000998
	.half 64, 56, 51, -15
	.word	VSHESKIN_
SHFLESH1F:
	.word 0x00001068
	.half 104, 61, 71, -79
	.word	VSHESKIN_
SHFLESH1G:
	.word 0x00001A34
        .half 64, 15, 11, -81
	.word	VSHESKIN_
SHFLESH1H:
	.word 0x00001C90
	.half 84, 24, -39, -94
	.word	VSHESKIN_
SHFLESH1I:
	.word 0x0000208C
	.half 156, 45, -4, -17
	.word	VSHESKIN_
SHGREY1A:
	.word 0x00003008
	.half 20, 18, 54, -10
	.word	VSHEGRY_P
SHGREY1B:
	.word 0x000030BC
	.half 20, 21, 82, -72
	.word	VSHEGRY_P
SHGREY1C:
	.word 0x0000319C
        .half 14, 10, 36, -59
	.word	VSHEGRY_P
SHGREY1D:
	.word 0x000031F0
	.half 53, 54, 11, -2
	.word	VSHEGRY_P
SHGREY1E:
	.word 0x000035C4
        .half 27, 14, -68, -120
	.word	VSHEGRY_P
SHGREY1F:
	.word 0x000036B0
	.half 17, 18, -31, -161
	.word	VSHEGRY_P
SHGREY1G:
	.word 0x00003764
	.half 23, 38, 48, -134
	.word	VSHEGRY_P
SHRED1A:
	.word 0x0000385C
        .half 32, 18, 32, -151
	.word	VSHRED_P
SHRED1B:
	.word 0x000039D8
        .half 61, 26, -6, -76
	.word	VSHRED_P
SHRED1C:
	.word 0x00003B64
	.half 21, 22, 16, -135
	.word	VSHRED_P
SHRED1D:
	.word 0x00003BDC
	.half 94, 44, 30, -52
	.word	VSHRED_P

	.align 2
	.globl sg_dict
sg_dict:
#include "sheeva.dct"

