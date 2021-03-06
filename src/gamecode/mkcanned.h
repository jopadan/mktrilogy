/******************************************************************************
 File: mkcanned.h

 By: David Schwartz

 Date: Nov 1994

 (C) Williams Entertainment

 Mortal Kombat III canned routines header
******************************************************************************/

#ifndef __mk_mkcanned_h__
#define __mk_mkcanned_h__

/*
 * 	DEFINITIONS
 */


/*
 *	RAM
 */

/*
 *	PROTOTYPES
 */
void fast_flash_dude(WORD ta0,WORD ta1);
WORD is_loser_on_ground(void);
void tot_replacement_proc(void);
void tot_david_replacement_proc(void);

void finish_him(void);
void dizzy_dude(void);
void plwins(WORD);
void psel_victory_animation(void);
void victory_animation(void);
void collapse_on_ground(void);
void mframew_2x(WORD,WORD);
void robo_dizzy_call(void);
void endurance_trans(void);
void ending_victory_animation(void);
void wings1(void);
void wings2(void);
void wng1(long pa11,WORD player);

void rvic_fade(void);			//-u64-
void victory_lighting(void);	//-u64-

/*
 *	MACROS
 */
#define player_1_wins plwins(PID_P1)
#define player_2_wins plwins(PID_P2)


#endif /* __mk_mkcanned_h__ */

