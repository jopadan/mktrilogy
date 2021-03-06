#include <regdef.h>
#include "mkchar.inc"
#include "mkbkgd.inc"

	.option	pic0

	.set noreorder

/*
;******************************************************************************
; File: artfriend.s
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III friendality Art Textures
;******************************************************************************
*/

	.align 2
	.globl a_fatality_drip
a_fatality_drip:
	.word FATALITY01
	.word FATALITY02
	.word FATALITY03
	.word FATALITY04
	.word FATALITY05
	.word FATALITY06
	.word FATALITY07
	.word FATALITY08
j_fatal:
	.word FATALITY09
	.word FATALITY10
	.word FATALITY11
	.word FATALITY12
	.word FATALITY13
	.word FATALITY14
	.word FATALITY15
	.word ani_jump
	.word j_fatal
	.globl FATALITY01
FATALITY01:
	.word FATALITY01_IMG
	.half 1, 102, -1, 0
	.word FATAL_P
FATALITY02:
	.word FATALITY02_IMG
	.half 8, 102, -1, 0
FATALITY03:
	.word FATALITY03_IMG
	.half 11, 102, -1, 0
FATALITY04:
	.word FATALITY04_IMG
	.half 14, 102, -1, 0
FATALITY05:
	.word FATALITY05_IMG
	.half 18, 102, -1, 0
FATALITY06:
	.word FATALITY06_IMG
	.half 27, 103, 0, 0
FATALITY07:
	.word FATALITY07_IMG
	.half 31, 103, 0, 0
FATALITY08:
	.word FATALITY08_IMG
	.half 31, 104, 1, 0
FATALITY09:
	.word FATALITY09_IMG
	.half 36, 104, 1, 0
FATALITY10:
	.word FATALITY10_IMG
	.half 31, 104, 1, 0
FATALITY11:
	.word FATALITY11_IMG
	.half 31, 104, 1, 0
FATALITY12:
	.word FATALITY12_IMG
	.half 34, 104, 1, 0
FATALITY13:
	.word FATALITY13_IMG
	.half 34, 104, 1, 0
FATALITY14:
	.word FATALITY14_IMG
	.half 31, 104, 1, 0
FATALITY15:
	.word FATALITY15_IMG
	.half 35, 104, 1, 0
	
	.align 2
#include "fatal.att"
	
	.align 2
	.globl fatal_dict
fatal_dict:	
#include "fatal.dct"
