#include <regdef.h>
#include "mkchar.inc"

	.option	pic0
	.set	noreorder
	.data

anj_anitab1:
	.word a_snake_in_da_box
	.word a_crank_box
	.word a_snowbox
	.word a_skull_in_da_box
	.word a_pin
	.word a_sign
	
a_snake_in_da_box:
	.word RPSNAKEBOX1A
	.word RPSNAKEBOX2A
	.word RPSNAKEBOX3A
	.word RPSNAKEBOX4A
	.word RPSNAKEBOX5A
	.word RPSNAKEBOX6A
	.word RPSNAKEBOX5A
	.word RPSNAKEBOX4A
	.word RPSNAKEBOX5A
	.word RPSNAKEBOX6A
	.word RPSNAKEBOX5A
	.word RPSNAKEBOX4A
	.word RPSNAKEBOX5A
	.word RPSNAKEBOX6A
	.word RPSNAKEBOX5A
	.word RPSNAKEBOX4A
	.word 0
a_crank_box:
	.word SCJACKBOX2
	.word SCJACKBOX5
	.word SCJACKBOX6
	.word SCJACKBOX7
	.word SCJACKBOX5
	.word SCJACKBOX6
	.word SCJACKBOX7
	.word SCJACKBOX5
	.word SCJACKBOX6
	.word SCJACKBOX7
	.word SCJACKBOX5
	.word SCJACKBOX6
	.word SCJACKBOX7
#ifndef CUT_FRAME
	.word SCJACKBOX8
	.word SCJACKBOX9
#endif
	.word 0
a_snowbox:
	.word SNOWBOX1
	.word SNOWBOX2
	.word SNOWBOX3
	.word SNOWBOX4
	.word SNOWBOX5
	.word SNOWBOX6
	.word SNOWBOX7
	.word SNOWBOX8
	.word SNOWBOX7
#ifdef CUT_FRAME
	.word SNOWBOX8
#else
	.word SNOWBOX10
#endif
	.word 0
a_skull_in_da_box:
	.word SCSKULLBOX1A
	.word SCSKULLBOX2A
	.word SCSKULLBOX3A
	.word SCSKULLBOX4A
	.word SCSKULLBOX6A
	.word SCSKULLBOX7A
#ifndef CUT_FRAME
	.word SCSKULLBOX8A
#endif
	.word SCSKULLBOX9A
#ifndef CUT_FRAME
	.word SCSKULLBOX10A
#endif
	.word SCSKULLBOX11A
	.word SCSKULLBOX13A
	.word 0
a_pin:
	.word PIN1
	.word ani_jump
	.word a_pin
a_sign:
	.word SMOKESIGN1
	.word 0
	
SCJACKBOX2:
	.word SCJACKBOX2_SUB, 0
SCJACKBOX2_SUB:
	.word SCJACKBOX2_IMG
	.half 108, 44, 18, -4
SCJACKBOX5:
	.word SCJACKBOX5_SUB, 0
SCJACKBOX5_SUB:
	.word SCJACKBOX5_IMG
	.half 112, 46, 22, -1
SCJACKBOX6:
	.word SCJACKBOX6_SUB, 0
SCJACKBOX6_SUB:
	.word SCJACKBOX6_IMG
	.half 112, 46, 22, -1
SCJACKBOX7:
	.word SCJACKBOX7_SUB, 0
SCJACKBOX7_SUB:
	.word SCJACKBOX7_IMG
	.half 112, 45, 20, -1
#ifndef CUT_FRAME
SCJACKBOX8:
	.word SCJACKBOX8_SUB, 0
SCJACKBOX8_SUB:
	.word SCJACKBOX8_IMG
	.half 112, 45, 20, -1
SCJACKBOX9:
	.word SCJACKBOX9_SUB, 0
SCJACKBOX9_SUB:
	.word SCJACKBOX9_IMG
	.half 112, 47, 20, -1
#endif

RPSNAKEBOX1A:
	.word RPSNAKEBOX1A_IMG
	.half 15, 18, 10, -19
	.word JBOX3_P
RPSNAKEBOX2A:
	.word RPSNAKEBOX2A_IMG
	.half 34, 25, 16, 0
RPSNAKEBOX3A:
	.word RPSNAKEBOX3A_IMG
	.half 48, 30, 22, 13
RPSNAKEBOX4A:
	.word RPSNAKEBOX4A_IMG
	.half 61, 36, 28, 26
RPSNAKEBOX5A:
	.word RPSNAKEBOX5A_IMG
	.half 61, 36, 26, 26
RPSNAKEBOX6A:
	.word RPSNAKEBOX6A_IMG
	.half 62, 36, 22, 27

SNOWBOX1:
	.word SNOWBOX1_IMG
	.half 25, 26, 18, -15
	.word	JBOX2_P
SNOWBOX2:
	.word SNOWBOX2_IMG
	.half 42, 40, 25, -4
SNOWBOX3:
	.word SNOWBOX3_IMG
	.half 65, 51, 29, 14
SNOWBOX4:
	.word SNOWBOX4_IMG
	.half 83, 60, 31, 29
SNOWBOX5:
	.word SNOWBOX5_IMG
	.half 76, 70, 36, 27
SNOWBOX6:
	.word SNOWBOX6_IMG
	.half 78, 59, 32, 27
SNOWBOX7:
	.word SNOWBOX7_IMG
	.half 62, 34, 25, 27
SNOWBOX8:
	.word SNOWBOX8_IMG
	.half 64, 34, 26, 29
#ifndef CUT_FRAME
SNOWBOX10:
	.word SNOWBOX10_IMG
	.half 62, 34, 22, 27
#endif

SCSKULLBOX1A:
	.word SCSKULLBOX1A_IMG
	.half 21, 21, 13, -13
	.word JBOX1_P
SCSKULLBOX2A:
	.word SCSKULLBOX2A_IMG
	.half 32, 30, 14, -3
SCSKULLBOX3A:
	.word SCSKULLBOX3A_IMG
	.half 54, 34, 19, 14
SCSKULLBOX4A:
	.word SCSKULLBOX4A_IMG
	.half 69, 35, 22, 26
SCSKULLBOX6A:
	.word SCSKULLBOX6A_IMG
	.half 73, 46, 23, 27
SCSKULLBOX7A:
	.word SCSKULLBOX7A_IMG
	.half 75, 58, 30, 29
#ifndef CUT_FRAME
SCSKULLBOX8A:
	.word SCSKULLBOX8A_IMG
	.half 76, 66, 39, 30
SCSKULLBOX10A:
	.word SCSKULLBOX10A_IMG
	.half 63, 74, 48, 28
#endif
SCSKULLBOX9A:
	.word SCSKULLBOX9A_IMG
	.half 73, 74, 48, 29
SCSKULLBOX11A:
	.word SCSKULLBOX11A_IMG
	.half 61, 72, 47, 26
SCSKULLBOX13A:
	.word SCSKULLBOX13A_IMG
	.half 60, 26, 21, 26

PIN1:
	.word PIN1_IMG
	.half 45, 12, 5, 3
	.word BOWLING_P

SMOKESIGN1:
	.word SMOKESIGN1_IMG
	.half 51, 57, 0, 0
	.word SMOKESIGN1_P

	.align 2
#include "mknj.attf" 
