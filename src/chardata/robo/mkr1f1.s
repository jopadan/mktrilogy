#include <regdef.h>
#include "mkchar.inc"

	.option	pic0
	.set	noreorder
	.data

robo_anitab1:
	.word a_crush_arms
	.word a_crush_blood
	.word a_4bar
	
a_crush_arms:
	.word ani_sladd
	.word CRARM1
	.word RBCHEST2
	.word CRARM2
	.word CRARM3
	.word 0
	.word CRARM4
	.word CRARM5
	.word CRARM6
	.word CRARM7
	.word ani_nosleep
	.word CRARM_NO_UD
	.word 0
	.word RBCRUSH8U
	.word RBCRUSH8D
	.word RBCRUSH17U
	.word RBCRUSH17D
	.word 0
	.word ani_slani_sleep
	.word CRARM3
	.word ani_slani_sleep
	.word CRARM2
	.word ani_slani_sleep
	.word CRARM1
	.word 0
	
a_crush_blood:
	.word ROBOBLOOD1
	.word ROBOBLOOD2
	.word ROBOBLOOD3
	.word ROBOBLOOD4
	.word ROBOBLOOD5
#ifndef CUT_FRAME
	.word ROBOBLOOD6
#endif
	.word ROBOBLOOD7
#ifndef CUT_FRAME
	.word ROBOBLOOD8
#endif
	.word ROBOBLOOD9
#ifndef CUT_FRAME
	.word ROBOBLOOD10
#endif
	.word ROBOBLOOD11
#ifndef CUT_FRAME
	.word ROBOBLOOD12
#endif
	.word ROBOBLOOD13
#ifndef CUT_FRAME
	.word ROBOBLOOD14
#endif
	.word ROBOBLOOD15
	.word ROBOBLOOD16
#ifdef CUT_FRAME
	.word ROBOBLOOD19
	.word ROBOBLOOD19
#else
	.word ROBOBLOOD17
	.word ROBOBLOOD18
#endif
	.word ROBOBLOOD19
	.word 0
	
a_4bar:
	.word RBCRUSH4BAR
	.word 0
	
RBCHEST2:
	.word RBCHEST2_SUB, 0
RBCHEST2_SUB:
	.word RBCHEST2_COPY_IMG
	.half 113, 47, 20, -7
	
ROBOBLOOD1:
	.word ROBOBLOOD1_SUB, 0
ROBOBLOOD1_SUB:
	.word ROBOBLOOD1_IMG
	.half 20, 75, -59, -31
	.word RBLOOD_P
ROBOBLOOD2:
	.word ROBOBLOOD2_SUB, 0
ROBOBLOOD2_SUB:
	.word ROBOBLOOD2_IMG
	.half 23, 94, -48, -34
ROBOBLOOD3:
	.word ROBOBLOOD3_SUB, 0
ROBOBLOOD3_SUB:
	.word ROBOBLOOD3_IMG
	.half 35, 141, -34, -34
ROBOBLOOD4:
	.word ROBOBLOOD4_SUB, 0
ROBOBLOOD4_SUB:
	.word ROBOBLOOD4_IMG
	.half 46, 169, -21, -37
ROBOBLOOD5:
	.word ROBOBLOOD5_SUB, 0
ROBOBLOOD5_SUB:
	.word ROBOBLOOD5_IMG
	.half 59, 188, -13, -39
#ifndef CUT_FRAME
ROBOBLOOD6:
	.word ROBOBLOOD6_SUB, 0
ROBOBLOOD6_SUB:
	.word ROBOBLOOD6_IMG
	.half 73, 202, -9, -40
#endif
ROBOBLOOD7:
	.word ROBOBLOOD7_SUB, 0
ROBOBLOOD7_SUB:
	.word ROBOBLOOD7_IMG
	.half 87, 209, -5, -40
#ifndef CUT_FRAME
ROBOBLOOD8:
	.word ROBOBLOOD8_SUB, 0
ROBOBLOOD8_SUB:
	.word ROBOBLOOD8_IMG
	.half 88, 200, -25, -40
#endif
ROBOBLOOD9:
	.word ROBOBLOOD9_SUB, 0
ROBOBLOOD9_SUB:
	.word ROBOBLOOD9_IMG
	.half 89, 218, -16, -40
#ifndef CUT_FRAME
ROBOBLOOD10:
	.word ROBOBLOOD10_SUB, 0
ROBOBLOOD10_SUB:
	.word ROBOBLOOD10_IMG
	.half 90, 230, -9, -40
#endif
ROBOBLOOD11:
	.word ROBOBLOOD11_SUB, 0
ROBOBLOOD11_SUB:
	.word ROBOBLOOD11_IMG
	.half 89, 231, -9, -40
#ifndef CUT_FRAME
ROBOBLOOD12:
	.word ROBOBLOOD12_SUB, 0
ROBOBLOOD12_SUB:
	.word ROBOBLOOD12_IMG
	.half 89, 230, -9, -40
#endif
ROBOBLOOD13:
	.word ROBOBLOOD13_SUB, 0
ROBOBLOOD13_SUB:
	.word ROBOBLOOD13_IMG
	.half 53, 230, -10, -72
#ifndef CUT_FRAME
ROBOBLOOD14:
	.word ROBOBLOOD14_SUB, 0
ROBOBLOOD14_SUB:
	.word ROBOBLOOD14_IMG
	.half 39, 222, -18, -85
#endif
ROBOBLOOD15:
	.word ROBOBLOOD15_SUB, 0
ROBOBLOOD15_SUB:
	.word ROBOBLOOD15_IMG
	.half 31, 222, -18, -97
ROBOBLOOD16:
	.word ROBOBLOOD16_SUB, 0
ROBOBLOOD16_SUB:
	.word ROBOBLOOD16_IMG
	.half 20, 222, -18, -108
#ifndef CUT_FRAME
ROBOBLOOD17:
	.word ROBOBLOOD17_SUB, 0
ROBOBLOOD17_SUB:
	.word ROBOBLOOD17_IMG
	.half 19, 222, -18, -109
ROBOBLOOD18:
	.word ROBOBLOOD18_SUB, 0
ROBOBLOOD18_SUB:
	.word ROBOBLOOD18_IMG
	.half 19, 222, -18, -109
#endif
ROBOBLOOD19:
	.word ROBOBLOOD19_SUB, 0
ROBOBLOOD19_SUB:
	.word ROBOBLOOD19_IMG
	.half 19, 222, -18, -109
	
RBCRUSH4BAR:
	.word RBCRUSH4BAR_IMG
	.half 128, 7, -54, 9
	.word RCRUSH_P
	
RBCRUSH8U:
	.word RBCRUSH8U_IMG
	.half 15, 84, -53, 19
	.word RCRUSH_P
RBCRUSH8D:
	.word RBCRUSH8D_IMG
	.half 21, 84, -53, -108
	.word RCRUSH_P
RBCRUSH17U:
	.word RBCRUSH17U_IMG
	.half 7, 83, -54, -29
	.word RCRUSH_P
RBCRUSH17D:
	.word RBCRUSH17D_IMG
	.half 10, 84, -53, -44
	.word RCRUSH_P
	
CRARM1:
	.word CRARM1_SUB, 0
CRARM1_SUB:
	.word CRARM1_IMG
	.half 12, 34, -1, -33
	.word RCRUSH_P
CRARM2:
	.word CRARM2_SUB, 0
CRARM2_SUB:
	.word CRARM2_IMG
	.half 23, 68, -1, -28
CRARM3:
	.word CRARM3_SUB, 0
CRARM3_SUB:
	.word CRARM3_IMG
	.half 57, 58, -1, -11
CRARM4:
	.word CRARM4_SUB, 0
CRARM4_SUB:
	.word CRARM4_IMG
	.half 105, 58, -1, 6
CRARM5:
	.word CRARM5_SUB, 0
CRARM5_SUB:
	.word CRARM5_IMG
	.half 150, 74, -1, 20
CRARM6:
	.word CRARM6_SUB, 0
CRARM6_SUB:
	.word CRARM6_IMG
	.half 149, 91, -1, 19
CRARM7:
	.word CRARM7_SUB, 0
CRARM7_SUB:
	.word CRARM7_IMG
	.half 149, 116, -1, 19
CRARM_NO_UD:
	.word CRARM_NO_UD_SUB, 0
CRARM_NO_UD_SUB:
	.word CRARM_NO_UD_IMG
	.half 10, 58, -1, -34
	
	.align 2
#include "mkr1f1.att" 
