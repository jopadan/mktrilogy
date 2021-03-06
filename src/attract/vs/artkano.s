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

/*	KANO 	*/
	.align 2
	.globl kano_pieces
kano_pieces:
	.half	0x5e,0x4e,0x12d,0x4e
	.word VBGKANO1A,0
	.word VBGKANO1B,0
	.word VBGKANO1C,0
	.word VBGKANO1D,0
	.word VBGKANO2A,BGKNBLU_P
	.word VBGKANO2B,BGKNBLU_P
	.word VBGKANO2C,BGKNBLU_P
	.word VBGKANO2D,BGKNBLU_P
	.word VBGKANO2E,BGKNBLU_P
	.word VBGKANO3A,0
	.word VBGKANO3B,0
	.word VBGKANO3C,0
	.word VBGKANO3D,0
	.word VBGKANO4A,0
	.word	0
	
VBGKANO1A:
	.word BGKANO1A
	.word 0
VBGKANO1B:
	.word BGKANO1B
	.word 0
VBGKANO1C:
	.word BGKANO1C
	.word 0
VBGKANO1D:
	.word BGKANO1D
	.word 0
VBGKANO2A:
	.word BGKANO2A
	.word 0
VBGKANO2B:
	.word BGKANO2B
	.word 0
VBGKANO2C:
	.word BGKANO2C
	.word 0
VBGKANO2D:
	.word BGKANO2D
	.word 0
VBGKANO2E:
	.word BGKANO2E
	.word 0
VBGKANO3A:
	.word BGKANO3A
	.word 0
VBGKANO3B:
	.word BGKANO3B
	.word 0
VBGKANO3C:
	.word BGKANO3C
	.word 0
VBGKANO3D:
	.word BGKANO3D
	.word 0
VBGKANO4A:
	.word BGKANO4A
	.word 0
	
	
BGKANO1A:
	.word 0x00000000
	.half 67, 45, 66, -35
	.word	BGKANO1_P
BGKANO1B:
	.word 0x000005B4
	.half 82, 43, -2, -7
	.word	BGKANO1_P
BGKANO1C:
	.word 0x00000CB8
    .half 60, 12, -45, -10
	.word	BGKANO1_P
BGKANO1D:
	.word 0x00000DD0
	.half 65, 38, -31, -93
	.word	BGKANO1_P
BGKANO2A:
	.word 0x000010B0
	.half 44, 28, 70, -55
	.word	BGKANO2_P
BGKANO2B:
	.word 0x00001288
	.half 67, 22, 24, -30
	.word	BGKANO2_P
BGKANO2C:
	.word 0x00001564
	.half 9, 2, -1, -79
	.word	BGKANO2_P
BGKANO2D:
	.word 0x00001584
	.half 37, 16, 68, -137
	.word	BGKANO2_P
BGKANO2E:
	.word 0x000016A8
        .half 93, 78, 4, -81
	.word	BGKANO2_P
BGKANO3A:
	.word 0x00001B54
        .half 36, 25, 68, -58
	.word	BGKANO3_P
BGKANO3B:
	.word 0x00001C40
        .half 137, 77, 65, -37
	.word	BGKANO3_P
BGKANO3C:
	.word 0x00002818
	.half 36, 28, -44, -114
	.word	BGKANO3_P
BGKANO3D:
	.word 0x000028B0
	.half 117, 46, -12, -23
	.word	BGKANO3_P
BGKANO4A:
	.word 0x00002D44
        .half 72, 63, 10, -40
	.word	BGKANO4_P
	
	.align 2
	.globl kano_dict
kano_dict:
#include "kano.dct"


