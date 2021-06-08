#include <regdef.h>
#include "mkchar.inc"

	.option	pic0
	.set	noreorder
	.data

anj_anitab1:
	.word a_schand
	
a_schand:
	.word SCHAND1
	.word SCHAND2
	.word SCHAND3
	.word 0
#ifndef CUT_FRAME
	.word SCHAND4
#endif
	.word SCHAND5
	.word SCHAND6
	.word SCHAND7
	.word SCHAND8
	.word SCHAND9
	.word SCHAND10
	.word SCHAND11
	.word SCHAND12
	.word 0
	.word SCHAND15
	.word SCHAND16
	.word SCHAND17
	.word SCHAND18
	.word SCHAND19
	.word 0
	

SCHAND1:
	.word SCHAND1_SUB,0
SCHAND1_SUB:
	.word SCHAND1_IMG
	.half 9, 47, 24, 5
	.word SCHAND_P
SCHAND2:
	.word SCHAND2_SUB,0
SCHAND2_SUB:
	.word SCHAND2_IMG
	.half 26, 55, 28, 13
SCHAND3:
	.word SCHAND3_SUB,0
SCHAND3_SUB:
	.word SCHAND3_IMG
	.half 31, 66, 34, 21
#ifndef CUT_FRAME
SCHAND4:
	.word SCHAND4_SUB,0
SCHAND4_SUB:
	.word SCHAND4_IMG
	.half 43, 115, 57, 28
#endif
SCHAND5:
	.word SCHAND5_SUB,0
SCHAND5_SUB:
	.word SCHAND5_IMG
	.half 39, 144, 67, 25
SCHAND6:
	.word SCHAND6_SUB,0
SCHAND6_SUB:
	.word SCHAND6_IMG
	.half 70, 142, 70, 55
SCHAND7:
	.word SCHAND7_SUB,0
SCHAND7_SUB:
	.word SCHAND7_IMG
	.half 106, 137, 70, 94
SCHAND8:
	.word SCHAND8_SUB,0
SCHAND8_SUB:
	.word SCHAND8_IMG
	.half 143, 146, 72, 133
SCHAND9:
	.word SCHAND9_SUB,0
SCHAND9_SUB:
	.word SCHAND9_IMG
	.half 138, 159, 61, 129
SCHAND10:
	.word SCHAND10_SUB,0
SCHAND10_SUB:
	.word SCHAND10_IMG
	.half 137, 156, 46, 131
SCHAND11:
	.word SCHAND11_SUB,0
SCHAND11_SUB:
	.word SCHAND11_IMG
	.half 128, 130, 41, 121
SCHAND12:
	.word SCHAND12_SUB,0
SCHAND12_SUB:
	.word SCHAND12_IMG
	.half 130, 139, 44, 122
SCHAND15:
	.word SCHAND15_SUB,0
SCHAND15_SUB:
	.word SCHAND15_IMG
	.half 158, 127, 42, 145
SCHAND16:
	.word SCHAND16_SUB,0
SCHAND16_SUB:
	.word SCHAND16_IMG
	.half 108, 119, 42, 100
SCHAND17:
	.word SCHAND17_SUB,0
SCHAND17_SUB:
	.word SCHAND17_IMG
	.half 54, 102, 38, 46
SCHAND18:
	.word SCHAND18_SUB,0
SCHAND18_SUB:
	.word SCHAND18_IMG
	.half 23, 69, 17, 15
SCHAND19:
	.word SCHAND19_SUB,0
SCHAND19_SUB:
	.word SCHAND1_IMG
	.half 9, 47, 8, 3

	.align 2
#include "mknjscf1.att" 