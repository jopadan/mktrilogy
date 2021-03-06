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

/* SZ */
	.align 2
	.globl sz_pieces
sz_pieces:
	.half	0x5d,0x30+29,0x135,0x30+29
	.word VSZBLUE1A,VSZGRN_P
	.word VSZBLUE1B,VSZGRN_P
	.word VSZBLUE1C,VSZGRN_P
	.word VSZBLUE1D,VSZGRN_P
	.word VSZFLESH1A,0
	.word VSZFLESH1B,0
	.word VSZFLESH1C,0
	.word VSZFLESH1D,0
	.word VSZFLESH1E,0
	.word VSZFLESH1F,0
	.word VSZFLESH1G,0
	.word VSZFLESH1H,0
	.word VSZGREY1A,0
	.word VSZGREY1B,0
	.word VSZGREY1C,0
	.word VSZGREY1D,0
	.word VSZGREY1E,0
	.word VSZGREY1F,0
	.word VSZGREY1G,0
	.word 0
	
VSZBLUE1A:
	.word SZBLUE1A
	.word 0
VSZBLUE1B:
	.word SZBLUE1B
	.word 0
VSZBLUE1C:
	.word SZBLUE1C
	.word 0
VSZBLUE1D:
	.word SZBLUE1D
	.word 0
VSZFLESH1A:
	.word SZFLESH1A
	.word 0
VSZFLESH1B:
	.word SZFLESH1B
	.word 0
VSZFLESH1C:
	.word SZFLESH1C
	.word 0
VSZFLESH1D:
	.word SZFLESH1D
	.word 0
VSZFLESH1E:
	.word SZFLESH1E
	.word 0
VSZFLESH1F:
	.word SZFLESH1F
	.word 0
VSZFLESH1G:
	.word SZFLESH1G
	.word 0
VSZFLESH1H:
	.word SZFLESH1H
	.word 0
VSZGREY1A:
	.word SZGREY1A
	.word 0
VSZGREY1B:
	.word SZGREY1B
	.word 0
VSZGREY1C:
	.word SZGREY1C
	.word 0
VSZGREY1D:
	.word SZGREY1D
	.word 0
VSZGREY1E:
	.word SZGREY1E
	.word 0
VSZGREY1F:
	.word SZGREY1F
	.word 0
VSZGREY1G:
	.word SZGREY1G
	.word 0
	
	
SZBLUE1A:
	.word 0x00000000
	.half 22, 30, 60, -155
	.word	VSZBLU_P
SZBLUE1B:
	.word 0x000001BC
	.half 104, 50, 52, -45
	.word	VSZBLU_P
SZBLUE1C:
	.word 0x0000076C
	.half 40, 8, 2, -47
	.word	VSZBLU_P
SZBLUE1D:
	.word 0x00000838
	.half 65, 36, 2, -80
	.word	VSZBLU_P
SZFLESH1A:
	.word 0x00000B6C
	.half 21, 31, 36, -9
	.word	RPFLESH_P
SZFLESH1B:
	.word 0x00000CE4
	.half 28, 28, 34, -120
	.word	RPFLESH_P
SZFLESH1C:
	.word 0x00000E40
	.half 116, 75, 88, -12
	.word	RPFLESH_P
SZFLESH1D:
	.word 0x000019C8
	.half 13, 2, 13, -45
	.word	RPFLESH_P
SZFLESH1E:
	.word 0x000019F4
	.half 32, 15, -62, -121
	.word	RPFLESH_P
SZFLESH1F:
	.word 0x00001B5C
	.half 87, 33, 11, -38
	.word	RPFLESH_P
SZFLESH1G:
	.word 0x000020BC
	.half 78, 45, -13, -99
	.word	RPFLESH_P
SZFLESH1H:
	.word 0x00002698
	.half 54, 29, -21, -29
	.word	RPFLESH_P
SZGREY1A:
	.word 0x00002A9C
	.half 34, 51, 83, -11
	.word	RPGRAY_P
SZGREY1B:
	.word 0x00002BF8
	.half 60, 38, 94, -117
	.word	RPGRAY_P
SZGREY1C:
	.word 0x00002FD0
	.half 131, 54, 56, -47
	.word	RPGRAY_P
SZGREY1D:
	.word 0x00003598
        .half 51, 46, -4, -13
	.word	RPGRAY_P
SZGREY1E:
	.word 0x0000382C
	.half 20, 6, 2, -67
	.word	RPGRAY_P
SZGREY1F:
	.word 0x0000386C
	.half 61, 36, 2, -83
	.word	RPGRAY_P
SZGREY1G:
	.word 0x00003990
        .half 36, 46, -24, -141
	.word	RPGRAY_P

	.align 2
	.globl sz_dict
sz_dict:
#include "sz.dct"

