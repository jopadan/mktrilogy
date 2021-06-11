**************************************************************************
*											     *
*  video game project:	Mortal Kombat 3							*
* 											     *
*  game software:    	David Schwartz								     *
* 											     *
*  module: Sword Arms										*
*											     *
**************************************************************************
	.FILE	'MK4.ASM'
	.WIDTH	132
	.OPTION	B,D,L,T
	.MNOLIST
*
* GET THE SYSTEM STUFF
*
	.INCLUDE	MAINEQU.ASM
	.INCLUDE	MKSA.TBL
	.INCLUDE	MKSA2.TBL
	.INCLUDE	IMGTBL.GLO

	.text

sa_anitab1
	.long	a_sastance	;  0 - stance
	.long	a_sawalkf	;  1 - walk forward
	.long	a_sawalkb	;  2 - walk backward
	.long	a_saturn	;  3 - turn around
	.long	a_saduck  	;  4 - duck animation
	.long	a_saduckturn	;  5 - turn around while ducking
	.long	a_saduckblock	;  6 - ducking block
	.long	a_saduckhit	; 7 - hit while ducking
	.long	a_saduckpunch	; 8 - duck punch
	.long	a_saduckkickh	; 9 - duck kick high
	.long	a_saduckkickl	; a - duck kick low
	.long	a_sauppercut	; b - uppercut
	.long	a_sablockhi	;  c - standing block
	.long	a_savictory	; d - victory
	.long	a_sahipunch	; e - hi punch
	.long	a_salopunch	; f - lo punch
	.long	a_saelbow	; 10 - elbow
	.long	a_sahikick	; 11 - hi kick
	.long	a_salokick	; 12 - lo kick
	.long	a_saknee	; 13 - knee
	.long	a_sasweep	; 14 - sweep kick
	.long	a_saroundh	; 15 - roundhouse kick
	.long	a_sajumpup	;  16 - jump straight up
	.long	a_sajumpupkick	; 17 - jump straight up kick
	.long	a_saflippunch	; 18 - flip punch
	.long	a_saflipkick	; 19 - flip kick
	.long	a_safflip	;  1a - forward flip
	.long	a_sabflip	;  1b - backward flip
	.long	a_sahithi	; 1c - hit high
	.long	a_sahitlo	; 1d - hit low
	.long	a_sakdown	; 1e - knocked down
	.long	a_sasweepfall	; 1f - sweep fall
	.long	a_sastumble	; 20 - stumble back
	.long	a_sagetup	; 21 - normal getup
	.long	a_sasweepup	; 22 - getup from sweep kick
	.long	a_sabodyslam	; 23 - body slam
	.long	a_sazap		; 24 - throwing fireball hi
	.long	a_sastunned	; 25 - stunned

	.long	a_fb_kano	; 26 - flipped by kano
	.long	a_fb_sonya	; 27 - flipped by sonya
	.long	a_fb_jax	; 28 - flipped by jax
	.long	a_fb_ind	; 29 - flipped by indian
	.long	a_fb_sz		; 2a	- flipped by subzero
	.long	a_fb_swat	; 2b - flipped by swat
	.long	a_fb_lia	; 2c	- flipped by lia
	.long	a_fb_robo	; 2d	- flipped by robot ninja
	.long	a_fb_robo2	; 2e	- flipped by robot ninja 2
	.long	a_fb_lao	; 2f	- flipped by kung lao
	.long	a_fb_tusk	; 30 - flipped by tusk
	.long	a_fb_sg         ; 31 - flipped by she goro
	.long	a_fb_st		; 32	- flipped by shang tsung
    .long	a_fb_lk		; 33 - flipped by liu kang
	.long	a_fb_smoke	; 34	- flipped by smoke
	.long	a_fb_kitana	; 35 -
	.long	a_fb_jade	; 36 -
	.long	a_fb_mileena	; 37 - flipped by mileena

	.long	a_fb_nj		; 38 - flipped by male ninja (scorpion)
	.long	a_fb_nj		; 39 - flipped by male ninja (reptile)
	.long	a_fb_nj		; 3a - flipped by male ninja (ermac)
	.long	a_fb_nj		; 3b - flipped by male ninja (oldsz)
	.long	a_fb_nj		; 3c - flipped by male ninja (oldsmoke)
	.long	a_fb_nj		; 3d - flipped by male ninja (noob)
	.long	a_fb_nj		; 3e - flipped by male ninja (rain)
	.long	a_sa_fb_rd		; 3f - flipped by rayden
	.long	a_sa_fb_sa		; 40 - flipped by baraka

	.long	a_afb_kano	; 41 - air flipped by kano
	.long	a_legged	; 42 - legged by sonya
	.long	a_saprojani	; 43 - fireball ani
	.long	a_shook		; 44 - shook by kano
	.long	a_afb_robo2	; 45 - air flipped by robo2
	.long	a_zoomed	; 46 - zoomed
	.long	a_banged	; 47
	.long	a_jade_shook	; 48 - shook by jade
	.long	0			; 49
	.long	a_run		; 4a - run
	.long	a_thudd		; 4b	-
	.long	a_scared	; 4c -


	.long	a_back_broke	; 4d - back getting broken
	.long	a_baby
	.long	a_big_head

	.long	a_half_cutup
	.long	a_cutup
	.long	a_float
	.long	a_pounded
	.long	a_reach
	.long	a_skin_rip
	.long	a_suk
	.long	a_stretch
	.long	a_shocked
	.long	a_shredded


sa_anitab2
	.long	a_sashred	; 0 - shredder !
	.long	a_swipe		; 1 - swipe !
	.long	a_sastab	; 2 - stab death blow
	.long	a_sa_spin	; 3 - sword arm spin move


a_thudd
a_scared
a_baby
a_big_head
a_half_cutup
a_cutup
a_float
a_pounded
a_reach
a_skin_rip
a_stretch
a_suk
a_shocked
a_sastance
	.long	UGSTANCE1
	.long	UGSTANCE2
	.long	UGSTANCE3
	.long	UGSTANCE4
	.long	UGSTANCE5
	.long	UGSTANCE6
	.long	UGSTANCE5
	.long	UGSTANCE4
	.long	UGSTANCE3
	.long	UGSTANCE2
	.long	ani_jump,a_sastance

UGSTANCE1
	.long	UGSTANCE1A,UGSTANCE1B,0
UGSTANCE2
	.long	UGSTANCE2A,UGSTANCE2B,0
UGSTANCE3
	.long	UGSTANCE3A,UGSTANCE3B,0
UGSTANCE4
	.long	UGSTANCE4A,UGSTANCE4B,0
UGSTANCE5
	.long	UGSTANCE5A,UGSTANCE5B,0
UGSTANCE6
	.long	UGSTANCE6A,UGSTANCE6B,0

;********************************************************************

a_sawalkf
	.long	UGWALK1
	.long	UGWALK2
	.long	UGWALK3
	.long	UGWALK4
	.long	UGWALK5
	.long	UGWALK6
	.long	UGWALK7
	.long	UGWALK8
	.long	UGWALK9
	.long	ani_jump,a_sawalkf

a_sawalkb
	.long	UGWALK9
	.long	UGWALK8
	.long	UGWALK7
	.long	UGWALK6
	.long	UGWALK5
	.long	UGWALK4
	.long	UGWALK3
	.long	UGWALK2
	.long	UGWALK1
	.long	ani_jump,a_sawalkb

UGWALK1	.long	UGWALKLEG1A,UGWALKLEG1B,UGWALKTORSO1A,UGWALKTORSO1B,0
UGWALK2	.long	UGWALKLEG2A,UGWALKLEG2B,UGWALKTORSO2A,UGWALKTORSO2B,0
UGWALK3	.long	UGWALKLEG3A,UGWALKTORSO3A,UGWALKTORSO3B,0
UGWALK4	.long	UGWALKLEG4A,UGWALKLEG4B,UGWALKTORSO4A,UGWALKTORSO4B,0
UGWALK5	.long	UGWALKLEG5A,UGWALKLEG5B,UGWALKTORSO5A,UGWALKTORSO5B,0
UGWALK6	.long	UGWALKLEG6A,UGWALKTORSO6A,UGWALKTORSO6B,0
UGWALK7	.long	UGWALKLEG7A,UGWALKLEG7B,UGWALKTORSO7A,UGWALKTORSO7B,0
UGWALK8	.long	UGWALKLEG8A,UGWALKLEG8B,UGWALKTORSO8A,UGWALKTORSO8B,0
UGWALK9	.long	UGWALKLEG9A,UGWALKLEG9B,UGWALKTORSO9A,UGWALKTORSO9B,0

;********************************************************************

a_saduck  
	.long	UGDUCK1
	.long	UGDUCK2
	.long	UGDUCK3
	.long	0

UGDUCK1	.long	UGDUCK1A,UGDUCK1B,UGDUCK1C,0
UGDUCK2	.long	UGDUCK2A,UGDUCK2B,0
UGDUCK3	.long	UGDUCK3A,UGDUCK3B,0

;********************************************************************

a_sajumpup
	.long	UGJUMP2
	.long	UGJUMP3
	.long	0
	.long	UGJUMP2
	.long	UGJUMP1
	.long	0

UGJUMP1	.long	UGJUMP1A,UGJUMP1B,UGJUMP1C,0
UGJUMP2	.long	UGJUMP2A,UGJUMP2B,UGJUMP2C,0
UGJUMP3	.long	UGJUMP3A,UGJUMP3B,0

;********************************************************************

a_safflip
	.long	UGJUMPFLIP1
	.long	UGJUMPFLIP2
	.long	UGJUMPFLIP3
	.long	UGJUMPFLIP4
	.long	UGJUMPFLIP5
	.long	UGJUMPFLIP6
	.long	UGJUMPFLIP7
	.long	UGJUMPFLIP8
	.long	ani_jump,a_safflip+32

a_sabflip
	.long	UGJUMPFLIP1
	.long	UGJUMPFLIP8
	.long	UGJUMPFLIP7
	.long	UGJUMPFLIP6
	.long	UGJUMPFLIP5
	.long	UGJUMPFLIP4
	.long	UGJUMPFLIP3
	.long	UGJUMPFLIP2
	.long	ani_jump,a_sabflip+32

UGJUMPFLIP1
	.long	UGJUMPFLIP1A,UGJUMPFLIP1B,0
UGJUMPFLIP2
	.long	UGJUMPFLIP2A,0
UGJUMPFLIP3
	.long	UGJUMPFLIP3A,0
UGJUMPFLIP4
	.long	UGJUMPFLIP4A,UGJUMPFLIP4B,0
UGJUMPFLIP5
	.long	UGJUMPFLIP5A,UGJUMPFLIP5B,0
UGJUMPFLIP6
	.long	UGJUMPFLIP6A,UGJUMPFLIP6B,0
UGJUMPFLIP7
	.long	UGJUMPFLIP7A,0
UGJUMPFLIP8
	.long	UGJUMPFLIP8A,UGJUMPFLIP8B,0

;********************************************************************

a_saturn
	.long	UGTURN1
	.long	UGTURN2
	.long	ani_flip
	.long	ani_adjustx
	.word	5
	.long	UGTURN1
	.long	0

UGTURN1	.long	UGTURN1A,UGTURN1B,0
UGTURN2	.long	UGTURN2A,UGTURN2B,0

;********************************************************************

a_saduckturn
	.long	UGDUCKTURN1
	.long	UGDUCKTURN2
	.long	ani_flip
	.long	ani_adjustx
	.word	5
	.long	UGDUCKTURN2
	.long	UGDUCK3
	.long	0

UGDUCKTURN1
	.long	UGDUCKTURN1A,UGDUCKTURN1B,0
UGDUCKTURN2
	.long	UGDUCKTURN2A,UGDUCKTURN2B,0

;********************************************************************

a_sablockhi
	.long	UGHIBLOCK1
	.long	UGHIBLOCK2
	.long	UGHIBLOCK3
	.long	0
	.long	UGHIBLOCK2
	.long	UGHIBLOCK1
	.long	0

UGHIBLOCK1
	.long	UGHIBLOCK1A,UGHIBLOCK1B,0
UGHIBLOCK2
	.long	UGHIBLOCK2A,UGHIBLOCK2B,UGHIBLOCK2C,0
UGHIBLOCK3
	.long	UGHIBLOCK3A,UGHIBLOCK3B,0

;********************************************************************

a_saduckblock
	.long	UGDUCKBLOCK1
	.long	UGDUCKBLOCK2
	.long	UGDUCKBLOCK3
	.long	0
	.long	UGDUCKBLOCK2
	.long	UGDUCKBLOCK1
	.long	UGDUCK3
	.long	0

UGDUCKBLOCK1
	.long	UGDUCKBLOCK1A,UGDUCKBLOCK1B,0
UGDUCKBLOCK2
	.long	UGDUCKBLOCK2A,UGDUCKBLOCK2B,0
UGDUCKBLOCK3
	.long	UGDUCKBLOCK3A,UGDUCKBLOCK3B,0

;********************************************************************

a_sahikick
	.long	UGHIKICK1
	.long	UGHIKICK2
	.long	UGHIKICK3
	.long	UGHIKICK4
	.long	UGHIKICK5
	.long	UGHIKICK6
	.long	0
	.long	UGHIKICK5
	.long	UGHIKICK4
	.long	UGHIKICK3
	.long	UGHIKICK2
	.long	UGHIKICK1
	.long	0

UGHIKICK1
	.long	UGHIKICK1A,UGHIKICK1B,0
UGHIKICK2
	.long	UGHIKICK2A,0
UGHIKICK3
	.long	UGHIKICK3A,UGHIKICK3B,0
UGHIKICK4
	.long	UGHIKICK4A,UGHIKICK4B,0
UGHIKICK5
	.long	UGHIKICK5A,UGHIKICK5B,UGHIKICK5C,0
UGHIKICK6
	.long	UGHIKICK6A,UGHIKICK6B,UGHIKICK6C,0

;********************************************************************

a_salokick
	.long	UGHIKICK1
	.long	UGHIKICK2
	.long	UGHIKICK3
	.long	UGHIKICK4
	.long	UGHIKICK5
	.long	UGLOKICK1
	.long	0
	.long	UGHIKICK5
	.long	UGHIKICK4
	.long	UGHIKICK3
	.long	UGHIKICK2
	.long	UGHIKICK1
	.long	0

UGLOKICK1
	.long	UGLOKICK1A,UGLOKICK1B,UGLOKICK1C,0

;********************************************************************

a_sakdown
	.long	UGKNOCKDOWN1
	.long	UGKNOCKDOWN2
	.long	UGKNOCKDOWN3
	.long	UGKNOCKDOWN4
	.long	0
*
* part 2 = landing on back
*
	.long	UGKNOCKDOWN5
	.long	UGKNOCKDOWN6
	.long	UGKNOCKDOWN7
	.long	0
*
* part 3 = shake on the ground
*
	.long	UGKNOCKDOWN6
	.long	UGKNOCKDOWN7
	.long	UGKNOCKDOWN6
	.long	UGKNOCKDOWN7
	.long	0

UGKNOCKDOWN1
	.long	UGKNOCKDOWN1A,0
UGKNOCKDOWN2
	.long	UGKNOCKDOWN2A,UGKNOCKDOWN2B,UGKNOCKDOWN2C,0
UGKNOCKDOWN3
	.long	UGKNOCKDOWN3A,UGKNOCKDOWN3B,UGKNOCKDOWN3C,0
UGKNOCKDOWN4
	.long	UGKNOCKDOWN4A,UGKNOCKDOWN4B,0
UGKNOCKDOWN5
	.long	UGKNOCKDOWN5A,UGKNOCKDOWN5B,UGKNOCKDOWN5C,0
UGKNOCKDOWN6
	.long	UGKNOCKDOWN6A,UGKNOCKDOWN6B,0
UGKNOCKDOWN7
	.long	UGKNOCKDOWN7A,UGKNOCKDOWN7B,0

;********************************************************************

a_sahithi
	.long	UGHIHIT2
	.long	UGHIHIT3
	.long	UGHIHIT2
	.long	UGHIHIT1
	.long	0

UGHIHIT1	.long	UGHIHIT1A,UGHIHIT1B,0
UGHIHIT2	.long	UGHIHIT2A,UGHIHIT2B,0
UGHIHIT3	.long	UGHIHIT3A,UGHIHIT3B,0

;********************************************************************

a_sahitlo
	.long	UGLOHIT2
	.long	UGLOHIT3
	.long	UGLOHIT2
	.long	UGLOHIT1
	.long	0

UGLOHIT1	.long	UGLOHIT1A,UGLOHIT1B,0
UGLOHIT2	.long	UGLOHIT2A,UGLOHIT2B,0
UGLOHIT3	.long	UGLOHIT3A,UGLOHIT3B,0

;********************************************************************

a_sagetup
	.long	UGGETUP1
	.long	UGGETUP2
	.long	UGGETUP3
	.long	UGGETUP4
	.long	UGGETUP5
	.long	0

UGGETUP1	.long	UGGETUP1A,UGGETUP1B,0
UGGETUP2	.long	UGGETUP2A,0
UGGETUP3	.long	UGGETUP3A,UGGETUP3B,0
UGGETUP4	.long	UGGETUP4A,UGGETUP4B,0
UGGETUP5	.long	UGGETUP5A,UGGETUP5B,UGGETUP5C,0

;********************************************************************

a_sahipunch
	.long	UGHIPUNCH1
	.long	UGHIPUNCH2
	.long	UGHIPUNCH3
	.long	0

	.long	UGHIPUNCH4
	.long	UGHIPUNCH5
	.long	UGHIPUNCH6
	.long	0

	.long	UGHIPUNCH5
	.long	UGHIPUNCH4
	.long	ani_jump,a_sahipunch+(32*2)
	.long	0

*
* Unhipunch #1
*
	.long	UGHIPUNCH2
	.long	UGHIPUNCH1
	.long	0
*
* Unhipunch #2
*
	.long	UGHIPUNCH5
	.long	0
*
* Hi to Med #1
*
	.long	UGHIPUNCH4
	.long	UGHIPUNCH5
	.long	ani_jump,a_salopunch+(32*6)
	.long	0
*
* Hi to Med #2
*
	.long	UGHIPUNCH5
	.long	UGHIPUNCH4
	.long	ani_jump,a_salopunch+(32*2)
	.long	0

UGHIPUNCH1
	.long	UGHIPUNCH1A,UGHIPUNCH1B,0
UGHIPUNCH2
	.long	UGHIPUNCH2A,UGHIPUNCH2B,UGHIPUNCH2C,0
UGHIPUNCH3
	.long	UGHIPUNCH3A,UGHIPUNCH3B,UGHIPUNCH3C,0
UGHIPUNCH4
	.long	UGHIPUNCH4A,UGHIPUNCH4B,0
UGHIPUNCH5
	.long	UGHIPUNCH5A,UGHIPUNCH5B,UGHIPUNCH5C,0
UGHIPUNCH6
	.long	UGHIPUNCH6A,UGHIPUNCH6B,UGHIPUNCH6C,0
UGHIPUNCH7
	.long	UGHIPUNCH7A,UGHIPUNCH7B,UGHIPUNCH7C,0

;********************************************************************

a_salopunch
	.long	UGHIPUNCH1
	.long	UGHIPUNCH2
	.long	UGLOPUNCH1
	.long	0

	.long	UGHIPUNCH4
	.long	UGHIPUNCH5
	.long	UGLOPUNCH2
	.long	0

	.long	UGHIPUNCH5
	.long	UGHIPUNCH4
	.long	ani_jump,a_salopunch+(32*2)
	.long	0
*
* Unlopunch #1
*
	.long	UGHIPUNCH2
	.long	UGHIPUNCH1
	.long	0
*
* Unlopunch #2
*
	.long	UGHIPUNCH5
	.long	0
*
* Med to High #1
*
	.long	UGHIPUNCH4
	.long	UGHIPUNCH5
	.long	ani_jump,a_sahipunch+(32*6)
	.long	0
*
* Med to High #2
*
	.long	UGHIPUNCH5
	.long	UGHIPUNCH4
	.long	ani_jump,a_sahipunch+(32*2)

UGLOPUNCH1
	.long	UGLOPUNCH1A,UGLOPUNCH1B,UGLOPUNCH1C,0
UGLOPUNCH2
	.long	UGLOPUNCH2A,UGLOPUNCH2B,UGLOPUNCH2C,0

;********************************************************************
a_sasweep
	.long	UGSWEEPKICK1
	.long	UGSWEEPKICK2
	.long	UGSWEEPKICK3
	.long	ani_calla,sweep_sounds
	.long	UGSWEEPKICK4
	.long	UGSWEEPKICK5
	.long	0
	.long	UGSWEEPKICK6
	.long	UGSWEEPKICK7
	.long	0

UGSWEEPKICK1
	.long	UGSWEEPKICK1A,UGSWEEPKICK1B,0
UGSWEEPKICK2
	.long	UGSWEEPKICK2A,UGSWEEPKICK2B,0
UGSWEEPKICK3
	.long	UGSWEEPKICK3A,UGSWEEPKICK3B,0
UGSWEEPKICK4
	.long	UGSWEEPKICK4A,UGSWEEPKICK4B,0
UGSWEEPKICK5
	.long	UGSWEEPKICK5A,UGSWEEPKICK5B,UGSWEEPKICK5C,0
UGSWEEPKICK6
	.long	UGSWEEPKICK6A,UGSWEEPKICK6B,0
UGSWEEPKICK7
	.long	UGSWEEPKICK7A,UGSWEEPKICK7B,0

;********************************************************************

a_sasweepfall
	.long	UGSWEEPFALL1
	.long	UGSWEEPFALL2
	.long	UGSWEEPFALL3
	.long	UGSWEEPFALL4
	.long	UGSWEEPFALL5
	.long	UGSWEEPFALL6
	.long	0
	.long	UGSWEEPFALL5
	.long	UGSWEEPFALL6
	.long	0

UGSWEEPFALL1
	.long	UGSWEEPFALL1A,UGSWEEPFALL1B,0
UGSWEEPFALL2
	.long	UGSWEEPFALL2A,UGSWEEPFALL2B,0
UGSWEEPFALL3
	.long	UGSWEEPFALL3A,UGSWEEPFALL3B,UGSWEEPFALL3C,0
UGSWEEPFALL4
	.long	UGSWEEPFALL4A,UGSWEEPFALL4B,UGSWEEPFALL4C,0
UGSWEEPFALL5
	.long	UGSWEEPFALL5A,UGSWEEPFALL5B,UGSWEEPFALL5C,UGSWEEPFALL5D,0
UGSWEEPFALL6
	.long	UGSWEEPFALL6A,UGSWEEPFALL6B,0

;********************************************************************

a_sasweepup
	.long	UGSWEEPUP1
	.long	UGSWEEPUP2
	.long	UGSWEEPUP3
	.long	UGSWEEPUP4
	.long	0

UGSWEEPUP1
	.long	UGSWEEPUP1A,UGSWEEPUP1B,0
UGSWEEPUP2
	.long	UGSWEEPUP2A,UGSWEEPUP2B,0
UGSWEEPUP3
	.long	UGSWEEPUP3A,UGSWEEPUP3B,0
UGSWEEPUP4
	.long	UGSWEEPUP4A,UGSWEEPUP4B,UGSWEEPUP4C,UGSWEEPUP4D,0

;********************************************************************

a_saduckpunch
	.long	UGDUCKPUNCH1
	.long	UGDUCKPUNCH2
	.long	0
	.long	UGDUCKPUNCH1
	.long	UGDUCK3
	.long	0

UGDUCKPUNCH1
	.long	UGDUCKPUNCH1A,UGDUCKPUNCH1B,UGDUCKPUNCH1C,0
UGDUCKPUNCH2
	.long	UGDUCKPUNCH2A,UGDUCKPUNCH2B,UGDUCKPUNCH2C,0

;********************************************************************

a_saduckkickl
	.long	UGDUCKICKHI1
	.long	ani_calla,kick_sounds
	.long	UGDUCKICKHI2
	.long	UGDUCKICKHI3
	.long	UGDUCKICKHI4
	.long	0
	.long	UGDUCKICKHI3
	.long	UGDUCKICKHI2
	.long	UGDUCKICKHI1
	.long	UGDUCK3
	.long	0

UGDUCKICKHI1
	.long	UGDUCKICKHI1A,UGDUCKICKHI1B,UGDUCKICKHI1C,0
UGDUCKICKHI2
	.long	UGDUCKICKHI2A,UGDUCKICKHI2B,UGDUCKICKHI2C,0
UGDUCKICKHI3
	.long	UGDUCKICKHI3A,UGDUCKICKHI3B,UGDUCKICKHI3C,0
UGDUCKICKHI4
	.long	UGDUCKICKHI4A,UGDUCKICKHI4B,UGDUCKICKHI4C,0

;********************************************************************

a_saduckkickh
	.long	UGDUCKICKHI1
	.long	ani_calla,kick_sounds
	.long	UGDUCKICKHI2
	.long	UGDUCKICKLO1
	.long	UGDUCKICKLO2
	.long	0
	.long	UGDUCKICKLO1
	.long	UGDUCKICKHI2
	.long	UGDUCKICKHI1
	.long	UGDUCK3
	.long	0

UGDUCKICKLO1
	.long	UGDUCKICKLO1A,UGDUCKICKLO1B,0
UGDUCKICKLO2
	.long	UGDUCKICKLO2A,UGDUCKICKLO2B,UGDUCKICKLO2C,0

;********************************************************************

a_saduckhit
	.long	UGDUCKHIT2
	.long	UGDUCKHIT3
	.long	UGDUCKHIT2
	.long	UGDUCKHIT1
	.long	UGDUCK3
	.long	0

UGDUCKHIT1
	.long	UGDUCKHIT1A,UGDUCKHIT1B,0
UGDUCKHIT2
	.long	UGDUCKHIT2A,UGDUCKHIT2B,0
UGDUCKHIT3
	.long	UGDUCKHIT3A,UGDUCKHIT3B,0

;********************************************************************

a_sauppercut
	.long	UGUPPERCUT1
	.long	UGUPPERCUT2
	.long	UGUPPERCUT3
	.long	UGUPPERCUT4
	.long	ani_nosleep	; dont sleep after next frame
	.long	UGUPPERCUT5
	.long	0
	.long	UGUPPERCUT4
	.long	0

UGUPPERCUT1
	.long	UGUPPERCUT1A,UGUPPERCUT1B,0
UGUPPERCUT2
	.long	UGUPPERCUT2A,UGUPPERCUT2B,0
UGUPPERCUT3
	.long	UGUPPERCUT3A,UGUPPERCUT3B,0
UGUPPERCUT4
	.long	UGUPPERCUT4A,UGUPPERCUT4B,UGUPPERCUT4C,0
UGUPPERCUT5
	.long	UGUPPERCUT5A,UGUPPERCUT5B,UGUPPERCUT5C,0

;********************************************************************

a_sajumpupkick
	.long	UGJUMPKICK1
	.long	UGJUMPKICK2
	.long	0
	.long	UGJUMPKICK1
	.long	0

UGJUMPKICK1
	.long	UGJUMPKICK1A,UGJUMPKICK1B,UGJUMPKICK1C,0
UGJUMPKICK2
	.long	UGJUMPKICK2A,UGJUMPKICK2B,0

;********************************************************************

a_saflipkick
	.long	UGFLIPKICK1
	.long	UGFLIPKICK2
	.long	UGFLIPKICK3
	.long	0
	.long	UGFLIPKICK2
	.long	UGFLIPKICK1
	.long	0

UGFLIPKICK1
	.long	UGFLIPKICK1A,UGFLIPKICK1B,0
UGFLIPKICK2
	.long	UGFLIPKICK2A,UGFLIPKICK2B,0
UGFLIPKICK3
	.long	UGFLIPKICK3A,UGFLIPKICK3B,0

;********************************************************************

a_saflippunch
	.long	UGFLIPUNCH1
	.long	UGFLIPUNCH2
	.long	UGFLIPUNCH3
	.long	0
	.long	UGFLIPUNCH2
	.long	UGFLIPUNCH1
	.long	0

UGFLIPUNCH1
	.long	UGFLIPUNCH1A,UGFLIPUNCH1B,0
UGFLIPUNCH2
	.long	UGFLIPUNCH2A,UGFLIPUNCH2B,0
UGFLIPUNCH3
	.long	UGFLIPUNCH3A,0

;********************************************************************

a_saroundh
	.long	UGROUNDKIK1
	.long	UGROUNDKIK2
	.long	UGROUNDKIK3
	.long	ani_nosleep
	.long	UGROUNDKIK4
	.long	0
	.long	UGROUNDKIK5
	.long	UGROUNDKIK6
	.long	UGROUNDKIK7
	.long	UGROUNDKIK8
	.long	0

UGROUNDKIK1
	.long	UGROUNDKIK1A,UGROUNDKIK1B,0
UGROUNDKIK2
	.long	UGROUNDKIK2A,UGROUNDKIK2B,UGROUNDKIK2C,0
UGROUNDKIK3
	.long	UGROUNDKIK3A,UGROUNDKIK3B,0
UGROUNDKIK4
	.long	UGROUNDKIK4A,UGROUNDKIK4B,0
UGROUNDKIK5
	.long	UGROUNDKIK5A,0
UGROUNDKIK6
	.long	UGROUNDKIK6A,UGROUNDKIK6B,0
UGROUNDKIK7
	.long	UGROUNDKIK7A,UGROUNDKIK7B,0
UGROUNDKIK8
	.long	UGROUNDKIK8A,UGROUNDKIK8B,0

;********************************************************************

a_saknee
	.long	UGKNEE1
	.long	UGKNEE2
	.long	UGKNEE3
	.long	0
*
* retract strike
*
	.long	UGKNEE2
	.long	UGKNEE1
	.long	0

	.long	UGKNEE4
	.long	UGKNEE5
	.long	0

UGKNEE1	.long	UGKNEE1A,UGKNEE1B,UGKNEE1C,0
UGKNEE2	.long	UGKNEE2A,0
UGKNEE3	.long	UGKNEE3A,UGKNEE3B,0
UGKNEE4	.long	UGKNEE4A,UGKNEE4B,0
UGKNEE5	.long	UGKNEE5A,UGKNEE5B,0

;********************************************************************

a_saelbow
	.long	UGELBO1
	.long	UGELBO1
	.long	UGELBO2
	.long	ani_nosleep
	.long	UGELBO3
	.long	0
	.long	UGELBO3
	.long	UGELBO3
	.long	UGHIPUNCH1
	.long	0

UGELBO1	.long	UGELBO1A,UGELBO1B,0
UGELBO2	.long	UGELBO2A,UGELBO2B,UGELBO2C,0
UGELBO3	.long	UGELBO3A,UGELBO3B,0
UGELBO4	.long	UGELBO4A,UGELBO4B,UGELBO4C,UGELBO4D,0

;********************************************************************
a_sastumble
	.long	UGSTUMBL1E1
	.long	UGSTUMBL1E2
	.long	UGSTUMBL1E3
	.long	UGSTUMBL1E4
	.long	UGSTUMBL1E5
	.long	UGSTUMBL1E6
	.long	0

UGSTUMBL1E1
	.long	UGSTUMBL1E1A,UGSTUMBLE1B,0
UGSTUMBL1E2
	.long	UGSTUMBLE2A,UGSTUMBLE2B,0
UGSTUMBL1E3
	.long	UGSTUMBLE3A,0
UGSTUMBL1E4
	.long	UGSTUMBLE4A,0
UGSTUMBL1E5
	.long	UGSTUMBLE5A,0
UGSTUMBL1E6
	.long	UGSTUMBLE6A,UGSTUMBLE6B,0

;********************************************************************

a_shredded
	.long	ani_adjustxy
	.word	6,6
	.long	UGSTUMBL1E1

	.long	ani_adjustxy
	.word	-6,-6
	.long	UGSTUMBL1E2

	.long	ani_adjustxy
	.word	6,6
	.long	UGSTUMBL1E3

	.long	ani_adjustxy
	.word	-6,-6
	.long	UGSTUMBL1E2

	.long	ani_jump,a_shredded

***********************************************

a_sabodyslam
	.long	UGFLIP1
	.long	0

	.long	UGFLIP2
	.long	UGFLIP3
	.long	UGFLIP4
	.long	0

	.long	UGFLIP4
	.long	UGFLIP4
	.long	UGFLIP5
	.long	0

UGFLIP1	.long	UGFLIP1A,UGFLIP1B,UGFLIP1C,0
UGFLIP2	.long	UGFLIP2A,UGFLIP2B,UGFLIP2C,0
UGFLIP3	.long	UGFLIP3A,UGFLIP3B,0
UGFLIP4	.long	UGFLIP4A,UGFLIP4B,0
UGFLIP5	.long	UGFLIP5A,UGFLIP5B,0

;********************************************************************
a_sazap
	.long	UGSPARKBLADE1
	.long	UGSPARKBLADE2
	.long	0

	.long	UGSPARKBLADE3
	.long	UGSPARKBLADE4
	.long	0

	.long	UGSPARKBLADE5
	.long	0

UGSPARKBLADE1
	.long	UGSPARKBLADE1A,UGSPARKBLADE1B,UGSPARKBLADE1C,0
UGSPARKBLADE2
	.long	UGSPARKBLADE2A,UGSPARKBLADE2B,0
UGSPARKBLADE3
	.long	UGSPARKBLADE3A,UGSPARKBLADE3B,UGSPARKBLADE3C,0
UGSPARKBLADE4
	.long	UGSPARKBLADE4A,UGSPARKBLADE4B,UGSPARKBLADE4C,0
UGSPARKBLADE5
	.long	UGSPARKBLADE5A,UGSPARKBLADE5B,UGSPARKBLADE5C,UGSPARKBLADE5D,0

;********************************************************************

a_saprojani
	.long	UGSPARK1
	.long	UGSPARK2
	.long	0

	.long	UGSPARK3
	.long	UGSPARK4
	.long	0
*
* spark hit
*
	.long	UGSPARK5
	.long	UGSPARK6
	.long	UGSPARK7
	.long	UGSPARK8
	.long	UGSPARK9
	.long	UGSPARK10
	.long	UGSPARK11
	.long	0

UGSPARK1	.long	UGSPARK1A,0
UGSPARK2	.long	UGSPARK2A,0
UGSPARK3	.long	UGSPARK3A,UGSPARK3B,0
UGSPARK4	.long	UGSPARK4A,0
UGSPARK5	.long	UGSPARK5A,0
UGSPARK6	.long	UGSPARK6A,0
UGSPARK7	.long	UGSPARK7A,0
UGSPARK8	.long	UGSPARK8A,0
UGSPARK9	.long	UGSPARK9A,UGSPARK9B,0

UGSPARK10
	.long	UGSPARK10A,UGSPARK10B,0
UGSPARK11
	.long	UGSPARK11A,0

;********************************************************************
a_sastunned
	.long	UGSTUNNED1
	.long	UGSTUNNED2
	.long	UGSTUNNED3
	.long	UGSTUNNED4
	.long	UGSTUNNED5
	.long	UGSTUNNED6
	.long	UGSTUNNED7
	.long	ani_jump,a_sastunned

UGSTUNNED1
	.long	UGSTUNNED1A,UGSTUNNED1B,0
UGSTUNNED2
	.long	UGSTUNNED2A,UGSTUNNED2B,0
UGSTUNNED3
	.long	UGSTUNNED3A,UGSTUNNED3B,0
UGSTUNNED4
	.long	UGSTUNNED4A,UGSTUNNED4B,0
UGSTUNNED5
	.long	UGSTUNNED5A,UGSTUNNED5B,0
UGSTUNNED6
	.long	UGSTUNNED6A,UGSTUNNED6B,0
UGSTUNNED7
	.long	UGSTUNNED7A,UGSTUNNED7B,0

;********************************************************************

a_savictory
	.long	UGSTAB1
	.long	UGSTAB1
 	.long	UGSTAB1

	.long	ani_sound,>42
	.long	UGSTAB1_WB
	.long	UGSTAB1_WB
	.long	UGSTAB1_WB
	.long	0

	.long	UGVICTORY1
	.long	UGVICTORY2
	.long	UGVICTORY3
	.long	UGVICTORY4
	.long	UGVICTORY5
	.long	UGVICTORY6
	.long	UGVICTORY7
	.long	UGVICTORY8
	.long	0

UGVICTORY1
	.long	UGVICTORY1A,UGVICTORY1B,0
UGVICTORY2
	.long	UGVICTORY2A,UGVICTORY2B,0
UGVICTORY3
	.long	UGVICTORY3A,UGVICTORY3B,UGVICTORY3C
	.long	UGVICTORYLEG1A,UGVICTORYLEG1B,0
UGVICTORY4
	.long	UGVICTORY4A,UGVICTORY4B,UGVICTORY4C
	.long	UGVICTORYLEG1A,UGVICTORYLEG1B,0
UGVICTORY5
	.long	UGVICTORY5A,UGVICTORY5B,UGVICTORY5C
	.long	UGVICTORYLEG1A,UGVICTORYLEG1B,0
UGVICTORY6
	.long	UGVICTORY6A,UGVICTORY6B
	.long	UGVICTORYLEG1A,UGVICTORYLEG1B,0
UGVICTORY7
	.long	UGVICTORY7A
	.long	UGVICTORYLEG1A,UGVICTORYLEG1B,0
UGVICTORY8
	.long	UGVICTORY8A,UGVICTORY8B,UGVICTORY8C
	.long	UGVICTORYLEG1A,UGVICTORYLEG1B,0

;********************************************************************
;********************************************************************

a_sa_fb_sa
	.long	ani_adjustxy
	.word	->40,>00
	.long	UGSTUNNED1
	.long	0

	.long	ani_adjustxy
	.word	>10,->20
	.long	UGFLIPPED1

	.long	ani_adjustxy
	.word	>20,->10
	.long	UGFLIPPED2

	.long	ani_adjustxy
	.word	>40,->10
	.long	UGFLIPPED3
	.long	0

a_sa_fb_rd
	.long	ani_adjustxy
	.word	->42,>00
	.long	UGSTUMBL1E3
	.long	0

	.long	ani_adjustxy
	.word	>0a,->25
	.long	UGFLIPPED1

	.long	ani_adjustxy
	.word	>34,->1b
	.long	UGFLIPPED2
	.long	UGFLIPPED2

	.long	ani_adjustxy
	.word	>0a,>90
	.long	ani_flip_v
	.long	UGFLIPPED2

	.long	ani_adjustxy
	.word	>38,>40
	.long	UGFLIPPED2
	.long	0

	.long	ani_adjustxy
	.word	>18,>10
	.long	ani_flip
	.long	UGKNOCKDOWN7
	.long	0


a_banged
	.long	UGFLIPPED1
	.long	UGFLIPPED2
	.long	UGFLIPPED3
	.long	UGFLIPPED4
	.long	0

UGFLIPPED1
	.long	UGFLIPPED1A,UGFLIPPED1B,0
UGFLIPPED2
	.long	UGFLIPPED2A,UGFLIPPED2B,UGFLIPPED2C,0
UGFLIPPED3
	.long	UGFLIPPED3A,UGFLIPPED3B,UGFLIPPED3C,0
UGFLIPPED4
	.long	UGFLIPPED4A,UGFLIPPED4B,0

;********************************************************************

a_sashred
	.long	UGSHRED1	; get into it (vulnerable)
	.long	0

	.long	UGSHRED2
	.long	UGSHRED3
	.long	UGSHRED4
	.long	UGSHRED5
	.long	UGSHRED6
	.long	UGSHRED5
	.long	UGSHRED4
	.long	UGSHRED3
	.long	ani_jump,a_sashred+(32*2)

UGSHRED1	.long	UGSHRED1A,UGSHRED1B,UGSHRED1C,0
UGSHRED2	.long	UGSHRED2A,UGSHRED2B,UGSHRED2C,UGSHRED2D,UGSHRED2E,0
UGSHRED3	.long	UGSHRED3A,UGSHRED3B,UGSHRED3C,UGSHRED3D,0
UGSHRED4	.long	UGSHRED4A,UGSHRED4B,UGSHRED4C,0
UGSHRED5	.long	UGSHRED5A,UGSHRED5B,UGSHRED5C,0
UGSHRED6	.long	UGSHRED6A,UGSHRED6B,UGSHRED6C,UGSHRED6D,0

;********************************************************************

a_swipe
	.long	UGSWIPE1
	.long	ani_sound,>a13

	.long	UGSWIPE2
	.long	UGSWIPE3
	.long	ani_nosleep
	.long	UGSWIPE4
	.long	0
	.long	UGHIPUNCH1
	.long	0

UGSWIPE1	.long	UGSWIPE1A,UGSWIPE1B,0
UGSWIPE2	.long	UGSWIPE2A,UGSWIPE2B,0
UGSWIPE3	.long	UGSWIPE3A,UGSWIPE3B,UGSWIPE3C,UGSWIPE3D,0
UGSWIPE4	.long	UGSWIPE4A,UGSWIPE4B,UGSWIPE4C,0

;********************************************************************

;********************************************************************


UGSTAB1_WB
	.long	UGSTAB1A,UGSTAB1B
	.long	UGSTABLADES1A,UGSTABLADES1B,0


UGSWORDKICK1
	.long	UGSWORDKICK1A,UGSWORDKICK1B,UGSWORDKICK1C,0
UGSWORDKICK2
	.long	UGSWORDKICK2A,UGSWORDKICK2B,UGSWORDKICK2C,0
UGSWORDKICK3
	.long	UGSWORDKICK3A,UGSWORDKICK3B,UGSWORDKICK3C,0
UGSWORDKICK4
	.long	UGSWORDKICK4A,UGSWORDKICK4B,0
UGSWORDKICK5
	.long	UGSWORDKICK5A,0
UGSWORDKICK6
	.long	UGSWORDKICK6A,UGSWORDKICK6B,0


;*******************************************************

a_sastab
	.long	UGSTAB1
	.long	UGSTAB1
	.long	UGSTAB1

	.long	ani_sound,>42
	.long	UGSTAB1_WB
	.long	UGSTAB1_WB
	.long	UGSTAB1_WB	; out come the blades
	.long	0

	.long	UGSTAB2		; start stab action
	.long	0
*
* double_mframew these frames
*
	.long	UGSTAB3
	.long	UGSTAB4
	.long	UGSTAB5
	.long	UGSTAB6
	.long	0

UGSTAB1	.long	UGSTAB1A,UGSTAB1B,0
UGSTAB2	.long	UGSTAB2A,UGSTAB2B,UGSTAB2C,0
UGSTAB3	.long	UGSTAB3A,UGSTAB3B,UGSTAB3C,0
UGSTAB4	.long	UGSTAB4A,UGSTAB4B,UGSTAB4C,0
UGSTAB5	.long	UGSTAB5A,UGSTAB5B,UGSTAB5C,0
UGSTAB6	.long	UGSTAB6A,UGSTAB6B,UGSTAB6C,0

;*******************************************************


;**********************************************************

a_sa_spin
	.long	UGSPIN1
	.long	UGSPIN2
	.long	UGSPIN3
	.long	UGSPIN4
	.long	UGSPIN5

	.long	ani_flip
;	.long	ani_adjustx
;	.word	7
	.long	UGSPIN4
	.long	UGSPIN3

;	.long	ani_adjustx
;	.word	5
	.long	UGSPIN2

	.long	ani_flip
;	.long	ani_adjustx
;	.word	5
	.long	ani_jump,a_sa_spin


UGSPIN1	.long	UGSPIN1A,UGSPIN1B,0
UGSPIN2	.long	UGSPIN2A,0
UGSPIN3	.long	UGSPIN3A,0
UGSPIN4	.long	UGSPIN4A,UGSPIN4B,0
UGSPIN5	.long	UGSPIN5A,UGSPIN5B,0



*************************************************************************

a_back_broke
	.long	UGBACKBREAK1
	.long	0

UGBACKBREAK1
	.long	UGBACKBREAK1A,UGBACKBREAK1B,UGBACKBREAK1C,0
*************************************************************************

a_fb_goro
	.long	ani_adjustxy
	.word	->50,->20
	.long	UGSTUMBL1E1

	.long	ani_adjustxy
	.word	>10,->70
	.long	UGKNOCKDOWN6

	.long	ani_adjustxy
	.word	>20,>00
	.long	UGKNOCKDOWN6

	.long	ani_adjustxy
	.word	>3a,>20
	.long	UGKNOCKDOWN5

	.long	ani_adjustxy
	.word	>38,>10
	.long	UGKNOCKDOWN5

	.long	ani_adjustxy
	.word	>00,>68
	.long	UGKNOCKDOWN6

	.long	0

*************************************************************************

;********************************************************************
a_run
	.long	UGWALK1
	.long	UGWALK2
	.long	UGWALK3
	.long	UGWALK4
	.long	ani_calla,rsnd_footstep
	.long	UGWALK5
	.long	UGWALK6
	.long	UGWALK7
	.long	UGWALK8
	.long	UGWALK9
	.long	ani_calla,rsnd_footstep
	.long	UGWALK1		;10
	.long	UGWALK2		;11
	.long	UGWALK3		;12
	.long	ani_jump,a_run
	.long	0			; we need this zero !!



a_afb_kano
	.long	ani_offset_xy
	.word	->40,->1b
	.long	UGFLIPPED1

	.long	ani_offset_xy
	.word	->39,>05
	.long	UGKNOCKDOWN4

	.long	ani_offset_xy
 	.word	->59,>22
	.long	UGKNOCKDOWN5
	.long	0
*
* fall down solo
*
	.long	UGKNOCKDOWN5
	.long	UGKNOCKDOWN6
	.long	UGKNOCKDOWN7
	.long	0

a_fb_smoke
a_afb_robo2
	.long	ani_offset_xy
	.word	->25,->26
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	>01,->3b
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>30,->3e
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>4b,->1e
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>58,->03
	.long	UGKNOCKDOWN6
	.long	ani_offset_xy
	.word	>62,>1a
	.long	UGKNOCKDOWN6
	.long	0

a_fb_mileena
	.long	ani_offset_xy
	.word	->3a,->01
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->29,>07
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->1e,>01
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	>0e,->1a
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>63,->34
	.long	UGFLIPPED4
	.long	0

	.long	UGFLIPPED4
	.long	UGKNOCKDOWN5
	.long	UGKNOCKDOWN6
	.long	UGKNOCKDOWN7
	.long	0

a_fb_kitana
	.long	ani_offset_xy
	.word	->20,->23
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->08,->40
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	>32,->2d
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>3d,>0c
	.long	UGFLIPPED4
	.long	0

	.long	UGFLIPPED4
	.long	UGKNOCKDOWN5
	.long	UGKNOCKDOWN6
	.long	0



a_fb_jade
	.long	ani_offset_xy
	.word	->5a,>04
	.long	UGKNOCKDOWN1
	.long	ani_offset_xy
	.word	->5b,->21
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->43,->6c
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	->05,->6d
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	>5e,->6c
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>81,->3d
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>89,->0c
	.long	UGFLIPPED4
	.long	0

	.long	UGFLIPPED4
	.long	UGKNOCKDOWN5
	.long	UGKNOCKDOWN6
	.long	0


a_fb_nj	.long	ani_offset_xy
	.word	->49,>06
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->3c,>0e
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->28,>17
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	>00,>16
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>0e,>0e
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>5d,->17
	.long	UGFLIPPED4
	.long	0

	.long	UGFLIPPED4
	.long	UGKNOCKDOWN7
	.long	UGKNOCKDOWN7
	.long	0




a_fb_kano
	.long	ani_offset_xy
	.word	->3f,->0f
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->28,->1e
	.long	UGFLIPPED2
	.long	ani_offset_xy
 	.word	>35,->37
	.long	UGFLIPPED3
	.long	0

	.long	UGFLIPPED4
	.long	UGKNOCKDOWN5
	.long	UGKNOCKDOWN6
	.long	UGKNOCKDOWN7
	.long	0


a_fb_sonya
	.long	ani_offset_xy
	.word	->29,>0b
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->1f,>15
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	>0e,>04
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>56,->0a
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>8c,->21
	.long	UGFLIPPED4
	.long	0

	.long	UGFLIPPED4
	.long	UGKNOCKDOWN5
	.long	UGKNOCKDOWN6
	.long	UGKNOCKDOWN7
	.long	0


a_fb_jax
	.long	ani_offset_xy
	.word	->43,->16
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->2a,->2e
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	>06,->44
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>35,->2e
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>55,->1d
	.long	UGKNOCKDOWN7
	.long	ani_offset_xy
	.word	>49,>14
	.long	UGKNOCKDOWN7
	.long	0

a_fb_ind
	.long	ani_offset_xy
	.word	->57,->0f
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->48,->30
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	->20,->58
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>27,->4b
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>3b,->13
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>4d,>07
	.long	UGKNOCKDOWN7
	.long	0

a_fb_sz
	.long	ani_offset_xy
	.word	->49,->32
	.long	UGFLIPPED1
	.long	ani_flip
	.long	ani_offset_xy
	.word	>42,->1f
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>38,>05
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>02,>18
	.long	UGKNOCKDOWN5
	.long	ani_offset_xy
	.word	->35,->14
	.long	UGKNOCKDOWN5
	.long	ani_offset_xy
	.word	->72,->51
	.long	UGKNOCKDOWN5
	.long	0


a_fb_swat
	.long	ani_offset_xy
	.word	->4a,->07
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->3c,->33
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	>1c,->50
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>56,->20
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>54,>06
	.long	UGKNOCKDOWN7
	.long	0


a_fb_lia
	.long	ani_offset_xy
	.word	->64,>00
	.long	UGSTUMBLE1
	.long	ani_offset_xy
	.word	->73,>03
	.long	UGSTUMBLE1

	.long	ani_offset_xy
	.word	->75,->1e
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->57,->3d
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->23,->46
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	>1e,->4e
	.long	UGFLIPPED1

	.long	ani_offset_xy
	.word	>a8,>12
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>a7,>08
	.long	UGKNOCKDOWN7
	.long	0


a_fb_robo
	.long	ani_offset_xy
	.word	->52,->0b
	.long	UGFLIPPED1		; 1
	.long	ani_offset_xy
	.word	->4f,->32
	.long	UGFLIPPED2		; 2
	.long	ani_offset_xy
	.word	->38,->48
	.long	UGFLIPPED2		; 3

	.long	ani_offset_xy
	.word	->0a,->6c
	.long	UGFLIPPED3		; 4
	.long	ani_offset_xy
	.word	>38,->62
	.long	UGFLIPPED4		; 5
	.long	ani_offset_xy
	.word	>5c,->50
	.long	UGFLIPPED4		; 6

	.long	ani_offset_xy
	.word	>7b,->13
	.long	UGFLIPPED4		; 7
	.long	ani_offset_xy
	.word	>5a,->11
	.long	UGKNOCKDOWN7		; 8
	.long	0


a_fb_robo2
	.long	ani_offset_xy
	.word	->30,->07
	.long	UGSTUMBLE1		; 1
	.long	ani_offset_xy
	.word	->2c,->1d
	.long	UGFLIPPED1		; 2
	.long	ani_offset_xy
	.word	->0e,->1c
	.long	UGFLIPPED2		; 3
	.long	ani_offset_xy
	.word	>0e,->16
	.long	UGFLIPPED3		; 4
	.long	ani_offset_xy
	.word	>18,>03
	.long	UGFLIPPED4		; 5
	.long	ani_offset_xy
	.word	>09,>0b
	.long	UGFLIPPED4		; 6
	.long	ani_offset_xy
	.word	->0e,->11
	.long	UGKNOCKDOWN7		; 7
	.long	0



a_fb_lao
	.long	ani_offset_xy
	.word	->1d,>1a
	.long	UGSTUMBLE1		; 1
	.long	ani_offset_xy
	.word	->06,>2a
	.long	UGSTUMBLE1		; 2
	.long	ani_flip
	.long	ani_offset_xy
	.word	->29,>22
	.long	UGFLIPPED1		; 3
	.long	ani_offset_xy
	.word	->4a,->0f
	.long	UGFLIPPED2		; 4
	.long	ani_offset_xy
	.word	->32,->4f
	.long	UGFLIPPED3		; 5
	.long	ani_offset_xy
	.word	>10,->67
	.long	UGFLIPPED4		; 6
	.long	ani_offset_xy
	.word	>3f,->69
	.long	UGFLIPPED4		; 7
	.long	ani_offset_xy
	.word	>54,->57
	.long	UGFLIPPED4		; 8
	.long	ani_offset_xy
	.word	>77,>02
	.long	UGFLIPPED4		; 9
	.long	ani_offset_xy
	.word	>77,>52
	.long	UGFLIPPED4		; 10
	.long	0


a_fb_tusk
	.long	ani_offset_xy
	.word	->72,>00
	.long	UGFLIPPED1		; 1
	.long	ani_offset_xy
	.word	->5d,->38
	.long	UGFLIPPED2		; 2
	.long	ani_offset_xy
	.word	->1b,->78
	.long	UGFLIPPED3		; 3
	.long	ani_offset_xy
	.word	>39,->50
	.long	UGFLIPPED4		; 4
	.long	ani_offset_xy
	.word	>39,->10
	.long	UGFLIPPED4		; 5

	.long	ani_offset_xy
	.word	>1a,>0f
  	.long	UGKNOCKDOWN6		; 6
	.long	ani_offset_xy
	.word	->28,->08
  	.long	UGKNOCKDOWN7		; 7
	.long	ani_offset_xy
	.word	->68,>01
	.long	UGFLIPPED1		; 8
	.long	ani_offset_xy
	.word	->56,->44
	.long	UGFLIPPED2		; 9
	.long	ani_offset_xy
	.word	>1b,->66
	.long	UGFLIPPED3		; 10 

	.long	ani_offset_xy
	.word	>65,->05
	.long	UGFLIPPED4		; 11
	.long	ani_offset_xy
	.word	>64,>09
  	.long	UGKNOCKDOWN7		; 12
	.long	0



a_fb_sg
	.long	ani_offset_xy
	.word	->3d,->30
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->13,->45
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	->06,->50
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>0f,->3b
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>0f,->1f
	.long	UGFLIPPED3
	.long	ani_flip
	.long	ani_offset_xy
	.word	->16,>03
  	.long	UGKNOCKDOWN7
	.long	0

a_fb_st
	.long	ani_offset_xy
	.word	->4c,>00
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->41,>07
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->2a,>11
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	->0e,>0d
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>11,>1f
	.long	UGFLIPPED4

	.long	ani_offset_xy
	.word	->05,->01
	.long	UGKNOCKDOWN7
	.long	ani_offset_xy
	.word	->23,>01
	.long	UGKNOCKDOWN7
	.long	ani_offset_xy
	.word	->38,->04
	.long	UGKNOCKDOWN7

	.long	ani_offset_xy
	.word	->56,>03
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->59,->16
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->34,->3e
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	>2b,->41
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>3a,->18
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>48,->03
	.long	UGKNOCKDOWN7
	.long	0





a_fb_lk
	.long	ani_offset_xy
	.word	->3e,->01
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->3b,>07
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->1a,>0e
	.long	UGFLIPPED2
	.long	ani_offset_xy
	.word	>0a,>08
	.long	UGFLIPPED3
	.long	ani_offset_xy
	.word	>37,>03
	.long	UGFLIPPED4
	.long	ani_offset_xy
	.word	>88,->1f
	.long	UGFLIPPED4
	.long	0

	.long	UGFLIPPED4
	.long	UGKNOCKDOWN5
	.long	UGKNOCKDOWN6
	.long	UGKNOCKDOWN7
	.long	0


a_legged
	.long	ani_offset_xy
	.word	->66,>06
	.long	UGKNOCKDOWN1

	.long	ani_offset_xy
	.word	->51,->23
	.long	UGFLIPPED1

	.long	ani_offset_xy
	.word	->1b,->3e
	.long	UGFLIPPED3

	.long	ani_offset_xy
	.word	>31,->2d
	.long	UGFLIPPED4

	.long	ani_offset_xy
	.word	>5e,>00
	.long	UGFLIPPED4
	.long	0

a_zoomed
	.long	ani_offset_xy
	.word	>55,->08
	.long	UGKNOCKDOWN3	; 1

	.long	ani_offset_xy
	.word	>5b,>1f
	.long	UGKNOCKDOWN4	; 2

	.long	ani_offset_xy
	.word	>2a,>28
	.long	UGKNOCKDOWN5	; 3

	.long	ani_offset_xy
	.word	->30,>2b
	.long	UGKNOCKDOWN5	; 4

	.long	ani_offset_xy
	.word	->81,->08
	.long	UGFLIPPED1	; 5

	.long	ani_offset_xy
	.word	->41,->55
	.long	UGFLIPPED3	; 6
	.long	0

	.long	UGFLIPPED3
	.long	UGFLIPPED4
	.long	UGKNOCKDOWN5
	.long	UGKNOCKDOWN6
	.long	UGKNOCKDOWN7
	.long	0


a_shook
	.long	ani_offset_xy
	.word	->4a,>01
	.long	UGSTUMBLE2	; 3

	.long	ani_offset_xy
	.word	->31,->13
	.long	UGSTUMBLE2	; 4

	.long	ani_offset_xy
	.word	->1b,->0f
	.long	UGSTUMBLE2	; 5
	.long	0

; loop
	.long	ani_offset_xy
	.word	->1d,->0f
	.long	UGSTUMBLE2	; 6

	.long	ani_offset_xy
	.word	->2d,->1d
	.long	UGSTUMBLE2	; 7

	.long	ani_offset_xy
	.word	->3d,->21	
	.long	UGSTUMBLE2	; 8

	.long	ani_offset_xy
	.word	->31,->1a
	.long	UGSTUMBLE2	; 7
	.long	0

a_jade_shook
	.long	ani_offset_xy
	.word	->83,->18
	.long	UGFLIPPED1
	.long	ani_offset_xy
	.word	->80,>0a 
	.long	UGSTUMBLE1
	.long	ani_offset_xy
	.word	->6d,>24
	.long	UGKNOCKDOWN2
	.long	ani_offset_xy
	.word	->80,>0a 
	.long	UGSTUMBLE1
	.long	ani_jump,a_jade_shook

	.end





