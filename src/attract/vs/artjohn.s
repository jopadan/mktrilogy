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
	.globl jc_pieces
jc_pieces:
	.half	-8,0x30+29,0x135+0x5d+8,0x30+29
	.word VJCFLESH5,0
	.word VJCFLESH6,0
	.word VJCFLESH7,0
	.word VJCFLESH8,0
	.word VJCFLESH9,0
	.word VJCRED1,JCRED_P
	.word VJCRED2,JCRED_P
	.word VJCRED3,JCRED_P
	.word VJCRED4,JCRED_P
	.word 0
	
VJCFLESH5:
	.word JCFLESH5
	.word 0
VJCFLESH6:
	.word JCFLESH6
	.word 0
VJCFLESH7:
	.word JCFLESH7
	.word 0
VJCFLESH8:
	.word JCFLESH8
	.word 0
VJCFLESH9:
	.word JCFLESH9
	.word 0
	
VJCRED1:
	.word JCRED1A
	.word 0
VJCRED2:
	.word JCRED2A
	.word 0
VJCRED3:
	.word JCRED3A
	.word 0
VJCRED4:
	.word JCRED4A
	.word 0

JCRED1A:
	.word 0x00000000
	.half 23, 34, -101, -27
	.word	JCBLUE_P
JCRED2A:
	.word 0x000000E0
	.half 57, 40, 0, -67
	.word	JCBLUE_P
JCRED3A:
	.word 0x00000524
	.half 79, 37, -139, -89
	.word	JCBLUE_P
JCRED4A:
	.word 0x00000860
	.half 20, 77, -25, -148
	.word	JCBLUE_P
	

JCFLESH5:
	.word 0x00000AD0
	.half 30, 34, -4, -50
	.word	JCFLESH_P
JCFLESH6:
	.word 0x00000CA4
	.half 70, 104, -38, -39
	.word	JCFLESH_P
JCFLESH7:
	.word 0x00001DC8
	.half 54, 83, -33, -108
	.word	JCFLESH_P
JCFLESH8:
	.word 0x00002730
	.half 60, 50, -115, -108
	.word	JCFLESH_P
JCFLESH9:
	.word 0x00002CC0
	.half 42, 51, -87, 0
	.word	JCFLESH_P

	.align 2
	.globl jc_dict
jc_dict:
#include "jcvs.dct"


