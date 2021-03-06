#include <regdef.h>

	.option	pic0

	.set noreorder

/*
;******************************************************************************
; File: artbaby.s
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III babyality Art Textures
;******************************************************************************
*/

/*
;******************************************************************************
;	Spinning Finish Her Graphics  (finher.adt)
;******************************************************************************
*/
	.align 2
	.globl	a_finher_out
a_finher_out:
	.word FINHER1
	.word FINHER3
	.word FINHER5
	.word FINHER7
	.word FINHER9
	.word FINHER11
	.word FINHER13
	.word FINHER15
	.word FINHER17
	.word 0
	.globl FINHER1
FINHER1:
	.word FINHER1_IMG
	.half 36, 227, 0, -61
	.word MKFIGHT_P
FINHER3:
	.word FINHER3_IMG
	.half 123, 193, -11, -14
FINHER5:
	.word FINHER5_IMG
	.half 154, 132, -41, 0
FINHER7:
	.word FINHER7_IMG
	.half 154, 81, -67, 0
FINHER9:
	.word FINHER9_IMG
	.half 127, 85, -65, -13
FINHER11:
	.word FINHER11_IMG
	.half 89, 77, -69, -32
FINHER13:
	.word FINHER13_IMG
	.half 48, 60, -77, -52
FINHER15:
	.word FINHER15_IMG
	.half 30, 37, -89, -61
FINHER17:
	.word FINHER17_IMG
	.half 8, 6, -104, -72
	
	.align 2
#include "finher.att"
	
	.align 2
	.globl finher_dict
finher_dict:	
#include "finher.dct"

