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

/* INDIAN */
	.align 2
	.globl ind_pieces
ind_pieces:
	.half	0x63,0x25+19+10,0x125,0x25+19+10
	.word VINGRY1A,0
	.word VINGRY1B,0
	.word VINGRY1C,0
	.word VINGRY1D,0
	.word VINGRY1E,0
	.word VINBLU1A,VINTAN_P
	.word VINBLU1B,VINTAN_P
	.word VINBLU1C,VINTAN_P
	.word VINBLU1D,VINTAN_P
	.word VINSKIN1A,0
	.word VINSKIN1B,0
	.word VINSKIN1C,0
	.word VINSKIN1D,0
	.word VINSKIN1E,0
	.word VINSKIN1F,0
	.word VINSKIN1G,0
	.word	0
	
VINGRY1A:
	.word INGRY1A
	.word 0
VINGRY1B:
	.word INGRY1B
	.word 0
VINGRY1C:
	.word INGRY1C
	.word 0
VINGRY1D:
	.word INGRY1D
	.word 0
VINGRY1E:
	.word INGRY1E
	.word 0
VINBLU1A:
	.word INBLU1A
	.word 0
VINBLU1B:
	.word INBLU1B
	.word 0
VINBLU1C:
	.word INBLU1C
	.word 0
VINBLU1D:
	.word INBLU1D
	.word 0
VINSKIN1A:
	.word INSKIN1A
	.word 0
VINSKIN1B:
	.word INSKIN1B
	.word 0
VINSKIN1C:
	.word INSKIN1C
	.word 0
VINSKIN1D:
	.word INSKIN1D
	.word 0
VINSKIN1E:
	.word INSKIN1E
	.word 0
VINSKIN1F:
	.word INSKIN1F
	.word 0
VINSKIN1G:
	.word INSKIN1G
	.word 0


INGRY1A:
	.word 0x00000000
        .half 24, 21, -62, -122
	.word	VINGRY_P
INGRY1B:
	.word 0x00000108
        .half 81, 23, 71, -102
	.word	VINGRY_P
INGRY1C:
	.word 0x00000378
        .half 95, 41, 48, -48
	.word	VINGRY_P
INGRY1D:
	.word 0x000009D8
	.half 105, 19, -25, -16
	.word	VINGRY_P
INGRY1E:
	.word 0x00000C14
	.half 159, 64, 38, -15
	.word	VINGRY_P
INBLU1A:
	.word 0x0000151C
	.half 23, 21, 64, -76
	.word	VINBLU_P
INBLU1B:
	.word 0x000015EC
        .half 68, 38, -3, -33
	.word	VINBLU_P
INBLU1C:
	.word 0x00001840
	.half 26, 22, -19, -120
	.word	VINBLU_P
INBLU1D:
	.word 0x0000190C
        .half 13, 64, 56, -170
	.word	VINBLU_P
INSKIN1A:
	.word 0x00001AF8
	.half 77, 34, 88, -69
	.word	VINSKN_P
INSKIN1B:
	.word 0x00001F6C
	.half 116, 33, 58, -60
	.word	VINSKN_P
INSKIN1C:
	.word 0x000024E8
	.half 41, 28, -12, -42
	.word	VINSKN_P
INSKIN1D:
	.word 0x000027CC
	.half 31, 18, -67, -98
	.word	VINSKN_P
INSKIN1E:
	.word 0x00002958
	.half 24, 14, -25, -99
	.word	VINSKN_P
INSKIN1F:
	.word 0x00002A30
	.half 48, 54, -19, -126
	.word	VINSKN_P
INSKIN1G:
	.word 0x00002F04
	.half 89, 44, 26, -69
	.word	VINSKN_P

	.align 2
	.globl ind_dict
ind_dict:
#include "ind.dct"

