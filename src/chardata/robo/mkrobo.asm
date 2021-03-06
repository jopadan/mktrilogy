**************************************************************************
*											     *
*  mk3 - Robot Ninja										*
*											     *
**************************************************************************
	.FILE	'mkrobo.asm'
	.WIDTH	132
	.OPTION	B,D,L,T
	.MNOLIST

	.include mainequ.asm
	.include imgtbl.glo
	.include mkrobo.tbl
	.include mkrobo2.tbl
	.include mkrobo3.tbl
	.text

robo_anitab1
	.long	a_stance	;  0 - stance
;delete later
	.long	a_stance2	;  0 - stance
	.long	a_walkf		;  1 - walk forward
	.long	a_walkb		;  2 - walk backward
	.long	a_turn		;  3 - turn around (standing)
	.long	a_duck		;  4 - duck
	.long	a_duck_turn	;  5 - duck turnaround
	.long	a_duck_block	;  6 - duck block
	.long	a_duck_hit	;  7 - duck hit
	.long	a_duck_punch	;  8 - duck punch
	.long	a_duck_kick_hi	;  9 - duck high kick
	.long	a_duck_kick_lo	;  a - duck low kick
	.long	a_uppercut	;  b - uppercut
	.long	a_block		;  c - block (standing)
	.long	a_victory	;  d - victory
;delete later
	.long	a_r2victory	;  d - victory

	.long	a_hipunch	;  e - punch high
	.long	a_lopunch	;  f - punch low
	.long	a_elbow		; 10
	.long	a_hikick 	; 11
	.long	a_lokick 	; 12
	.long	a_knee		; 13
	.long	a_sweep_kick	; 14
	.long	a_roundhouse	; 15
	.long	a_jump		; 16
	.long	a_jump_kick	; 17
	.long	a_flip_punch	; 18
	.long	a_flip_kick	; 19
	.long	a_fflip		; 1a
	.long	a_bflip		; 1b
	.long	a_hit_hi	; 1c
	.long	a_hit_lo	; 1d
	.long	a_knockdown	; 1e
	.long	a_sweep_fall	; 1f
	.long	a_stumble	; 20
	.long	a_getup		; 21
	.long	a_sweepup	; 22 -
	.long	a_throw		; 23 -
;delete later
	.long	a_robo2_throw		; yes = different throw animation
	.long	a_smoke_throw		; yes = different throw animation

	.long	a_zap		; 24 - 
	.long	a_dizzy		; 25 -
	.long	a_fb_kano	; 26 - flipped by kano
	.long	a_fb_sonya	; 27 - flipped by sonya
	.long	a_fb_jax	; 28 - flipped by jax
	.long	a_fb_ind	; 29 - flipped by indian
	.long	a_fb_sz		; 2a	- flipped by subzero
	.long	a_fb_swat	; 2b - flipped by swat
	.long	a_fb_lia	; 2c	- flipped by lia
	.long	a_fb_robo1	; 2d	- flipped by robot ninja
	.long	a_fb_robo2	; 2e	- flipped by robot ninja 2
	.long	a_fb_lao	; 2f	- flipped by kung lao
	.long	a_fb_tusk	; 30 - flipped by tusk
	.long	a_fb_sg         ; 31 - flipped by she goro
	.long	a_fb_st		; 32 - flipped by shang tsung
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
	.long	a_fb_nj		; 3f - flipped by male ninja (rayden)
	.long	a_fb_nj		; 40 - flipped by male ninja (baraka)


	.long	a_afb_kano	; 3d - air flipped by kano
	.long	a_legged	; 3e - legged by sonya
	.long	a_projectile	; 3f - projectile animation
	.long	a_shook		; 40 - shook by kano
	.long	a_afb_robo2	; 41 - air flipped by robo2
	.long	a_zoomed	; 42 - zoomed
	.long	a_orb_banged	; 43 - hit by reptile's obj thingy
	.long	a_jade_shook	; 44 - shook by jade
	.long	0			; 45
	.long	a_run		; 46 - run
	.long	a_thudd		; 47	-
	.long	a_scared	; 48 -

	.long	a_back_break
	.long	a_baby
	.long	a_big_head
	.long	a_half_cutup
	.long	a_cutup
	.long	a_float
	.long	a_pounded
	.long	a_reach
	.long	a_skin_rip
	.long	a_stretch
	.long	a_suk
	.long	a_shocked
	.long	a_shredded


robo_anitab2
	.long	a_chest_open		; 0 - chest open
	.long	a_net			; 1 - 
	.long	a_bolt			; 2 - robo dizzy bolt
	.long	a_robo_telepunch	; 3 - teleport punch
	.long	a_bomb			; 4 - robo's bomb
	.long	a_target		; 5 -
	.long	a_air_slam		; 6 - air slam
	.long	a_tele_explode		; 7 - teleport explode
	.long	a_crush_arms		; 8 - robo's crushin' arms
	.long	a_throw_spear		; 9
	.long	a_flame_on		; a
	.long	a_inviso		; b - smoke inviso move
	.long	a_spear			; c - spear obj
	.long	a_self_destruct		; d
	.long	a_helecopter		; e
	.long	a_arm_bomb		; f
	.long	a_crush_blood		; 10
	.long	a_4bar				;11
	.long	a_earth				;12
	.long	a_smbomb			;13
	
	.long	a_shark
	.long	a_bat
	
	.long	a_robo1_friend
	.long	a_dinger
	.long	a_robo2_friend
	.long	a_bull
	.long	a_smoke_friend

;***********************************************************************

a_zap
a_dummy

a_stance
;add later
;	.long	ani_ochar_jump
;	.long	ft_robo2 
;	.long	a_stance2

	.long	RBSTANCE1
	.long	RBSTANCE2
	.long	RBSTANCE3
	.long	RBSTANCE4
	.long	RBSTANCE5
	.long	RBSTANCE6
	.long	RBSTANCE7
	.long	RBSTANCE8
	.long	RBSTANCE9
	.long	ani_jump,a_stance

a_stance2
	.long	RB2STANCE1
	.long	RB2STANCE2
	.long	RB2STANCE3
	.long	RB2STANCE4
	.long	RB2STANCE5
	.long	RB2STANCE6
	.long	RB2STANCE7
	.long	RB2STANCE8
	.long	RB2STANCE9
	.long	ani_jump,a_stance2

RBSTANCE1
	.long	RBSTANCE1A,RBSTANCE1B,0
RBSTANCE2
	.long	RBSTANCE2A,RBSTANCE2B,0
RBSTANCE3
	.long	RBSTANCE3A,RBSTANCE3B,0
RBSTANCE4
	.long	RBSTANCE4A,RBSTANCE4B,0
RBSTANCE5
	.long	RBSTANCE5A,RBSTANCE5B,0
RBSTANCE6
	.long	RBSTANCE6A,RBSTANCE6B,0
RBSTANCE7
	.long	RBSTANCE7A,RBSTANCE7B,0
RBSTANCE8
	.long	RBSTANCE8A,RBSTANCE8B,0
RBSTANCE9
	.long	RBSTANCE9A,RBSTANCE9B,0



RB2STANCE1
	.long	RB2STANCE1A,RB2STANCE1B,0
RB2STANCE2
	.long	RB2STANCE2A,RB2STANCE2B,0
RB2STANCE3
	.long	RB2STANCE3A,RB2STANCE3B,0
RB2STANCE4
	.long	RB2STANCE4A,RB2STANCE4B,0
RB2STANCE5
	.long	RB2STANCE5A,RB2STANCE5B,0
RB2STANCE6
	.long	RB2STANCE6A,RB2STANCE6B,0
RB2STANCE7
	.long	RB2STANCE7A,RB2STANCE7B,0
RB2STANCE8
	.long	RB2STANCE8A,RB2STANCE8B,0
RB2STANCE9
	.long	RB2STANCE9A,RB2STANCE9B,0

**************************************************************************

a_turn
	.long	RBTURN1
	.long	RBTURN2
	.long	ani_flip
	.long	RBTURN1
	.long	0

RBTURN1	.long	RBTURN1A,RBTURN1B,0
RBTURN2	.long	RBTURN2A,RBTURN2B,0

**************************************************************************

a_walkf	.long	RBWALK1
	.long	RBWALK2
	.long	RBWALK3
	.long	RBWALK4
	.long	RBWALK5
	.long	RBWALK6
	.long	RBWALK7
	.long	RBWALK8
	.long	RBWALK9
	.long	ani_jump,a_walkf

a_walkb	.long	RBWALK9
	.long	RBWALK8
	.long	RBWALK7
	.long	RBWALK6
	.long	RBWALK5
	.long	RBWALK4
	.long	RBWALK3
	.long	RBWALK2
	.long	RBWALK1
	.long	ani_jump,a_walkb

RBWALK1	.long	RBWALKLEG1A,RBWALKLEG1B,RBWALKTORSO1A,0
RBWALK2	.long	RBWALKLEG2A,RBWALKTORSO2A,0
RBWALK3	.long	RBWALKLEG3A,RBWALKTORSO3A,0
RBWALK4	.long	RBWALKLEG4A,RBWALKLEG4B,RBWALKTORSO4A,0
RBWALK5	.long	RBWALKLEG5A,RBWALKLEG5B,RBWALKTORSO5A,0
RBWALK6	.long	RBWALKLEG6A,RBWALKTORSO6A,0
RBWALK7	.long	RBWALKLEG7A,RBWALKTORSO7A,0
RBWALK8	.long	RBWALKLEG8A,RBWALKTORSO8A,0
RBWALK9	.long	RBWALKLEG9A,RBWALKLEG9B,RBWALKTORSO9A,0

**************************************************************************

a_duck
	.long	RBDUCK1
	.long	RBDUCK2
	.long	RBDUCK3
	.long	0

RBDUCK1	.long	RBDUCK1A,RBDUCK1B,0
RBDUCK2	.long	RBDUCK2A,RBDUCK2B,0
RBDUCK3	.long	RBDUCK3A,0

**************************************************************************

a_duck_block
	.long	RBDUCKBLOCK1
	.long	RBDUCKBLOCK2
	.long	RBDUCKBLOCK3
	.long	0

RBDUCKBLOCK1
	.long	RBDUCKBLOCK1A,0
RBDUCKBLOCK2
	.long	RBDUCKBLOCK2A,0
RBDUCKBLOCK3
	.long	RBDUCKBLOCK3A,0

**************************************************************************

a_duck_hit
	.long	RBDUCKHIT1
	.long	RBDUCKHIT2
	.long	RBDUCKHIT3
	.long	0

RBDUCKHIT1
	.long	RBDUCKHIT1A,RBDUCKHIT1B,RBDUCKHIT1C,0
RBDUCKHIT2
	.long	RBDUCKHIT2A,0
RBDUCKHIT3
	.long	RBDUCKHIT3A,0

**************************************************************************

a_duck_turn
	.long	RBDUCKTURN1
	.long	RBDUCKTURN2
	.long	ani_flip
	.long	RBDUCKTURN1
	.long	RBDUCK3
	.long	0

RBDUCKTURN1
	.long	RBDUCKTURN1A,RBDUCKTURN1B,0
RBDUCKTURN2
	.long	RBDUCKTURN2A,RBDUCKTURN2B,0

**************************************************************************

a_duck_punch
	.long	RBDUCKPUNCH1
	.long	RBDUCKPUNCH2
	.long	RBDUCKPUNCH3
	.long	0
	.long	RBDUCKPUNCH2
	.long	RBDUCKPUNCH1
	.long	RBDUCK3
	.long	0

RBDUCKPUNCH1
	.long	RBDUCKPUNCH1A,0
RBDUCKPUNCH2
	.long	RBDUCKPUNCH2A,0
RBDUCKPUNCH3
	.long	RBDUCKPUNCH3A,0

**************************************************************************

a_duck_kick_lo
	.long	RBDUCKLOKICK1
	.long	RBDUCKLOKICK2
	.long	RBDUCKLOKICK3
	.long	0
	.long	RBDUCKLOKICK2
	.long	RBDUCKLOKICK1
	.long	RBDUCK3
	.long	0

RBDUCKLOKICK1
	.long	RBDUCKLOKICK1A,RBDUCKLOKICK1B,0
RBDUCKLOKICK2
	.long	RBDUCKLOKICK2A,RBDUCKLOKICK2B,RBDUCKLOKICK2C,0
RBDUCKLOKICK3
	.long	RBDUCKLOKICK3A,RBDUCKLOKICK3B,RBDUCKLOKICK3C,0

**************************************************************************

a_duck_kick_hi
	.long	RBDUCKHIKICK1
	.long	RBDUCKHIKICK2
	.long	RBDUCKHIKICK3
	.long	RBDUCKHIKICK4
	.long	0
	.long	RBDUCKHIKICK3
	.long	RBDUCKHIKICK2
	.long	RBDUCKHIKICK1
	.long	RBDUCK3
	.long	0

RBDUCKHIKICK1
	.long	RBDUCKHIKICK1A,0
RBDUCKHIKICK2
	.long	RBDUCKHIKICK2A,RBDUCKHIKICK2B,0
RBDUCKHIKICK3
	.long	RBDUCKHIKICK3A,RBDUCKHIKICK3B,0
RBDUCKHIKICK4
	.long	RBDUCKHIKICK4A,RBDUCKHIKICK4B,0

**************************************************************************

a_uppercut
	.long	RBUPPERCUT1

;ejbpatch
;	.long	RBUPPERCUT2

	.long	RBUPPERCUT3
	.long	RBUPPERCUT4
	.long	RBUPPERCUT5
;ejbpatch
;	.long	RBUPPERCUT6

	.long	ani_nosleep	; dont sleep after next frame
	.long	RBUPPERCUT7
	.long	0
	.long	RBUPPERCUT5
	.long	0

RBUPPERCUT1
	.long	RBUPPERCUT1A,0
RBUPPERCUT2
	.long	RBUPPERCUT2A,0
RBUPPERCUT3
	.long	RBUPPERCUT3A,0
RBUPPERCUT4
	.long	RBUPPERCUT4A,0
RBUPPERCUT5
	.long	RBUPPERCUT5A,RBUPPERCUT5B,0
RBUPPERCUT6
	.long	RBUPPERCUT6A,RBUPPERCUT6B,0
RBUPPERCUT7
	.long	RBUPPERCUT7A,RBUPPERCUT7B,0

**************************************************************************

a_hipunch
	.long	RBHIPUNCH1
	.long	RBHIPUNCH2
	.long	RBHIPUNCH3
	.long	0

	.long	RBHIPUNCH4
	.long	RBHIPUNCH5
	.long	RBHIPUNCH6
	.long	0

	.long	RBHIPUNCH5
	.long	RBHIPUNCH4
	.long	ani_jump,a_hipunch+(32*2)
	.long	0					; we NEED this "0"
*
* Unhipunch #1
*
	.long	RBHIPUNCH2
	.long	RBHIPUNCH1
	.long	0
*
* Unhipunch #2
*
	.long	RBHIPUNCH7
	.long	0
*
* Hi to Med #1
*
	.long	RBHIPUNCH4
	.long	RBLOPUNCH5
	.long	ani_jump,a_lopunch+(32*6)
	.long	0
*
* Hi to Med #2
*
	.long	RBHIPUNCH5
	.long	RBLOPUNCH2
	.long	ani_jump,a_lopunch+(32*2)
	.long	0

**************************************************************************

a_lopunch
	.long	RBLOPUNCH1
	.long	RBLOPUNCH2
	.long	RBLOPUNCH3
	.long	0

	.long	RBLOPUNCH4
	.long	RBLOPUNCH5
	.long	RBLOPUNCH6
	.long	0

	.long	RBLOPUNCH5
	.long	RBLOPUNCH4
	.long	ani_jump,a_lopunch+(32*2)
	.long	0
*
* Unlopunch #1
*
	.long	RBLOPUNCH2
	.long	RBLOPUNCH1
	.long	0
*
* Unlopunch #2
*
	.long	RBHIPUNCH7
	.long	0
*
* Med to High #1
*
	.long	RBLOPUNCH4
	.long	RBLOPUNCH5
	.long	ani_jump,a_hipunch+(32*6)
	.long	0
*
* Med to High #2
*
	.long	RBLOPUNCH4
	.long	RBHIPUNCH5
	.long	ani_jump,a_hipunch+(32*2)


RBLOPUNCH1
	.long	RBLOPUNCH1A,RBLOPUNCH1B,0
RBLOPUNCH2
	.long	RBLOPUNCH2A,RBLOPUNCH2B,0
RBLOPUNCH3
	.long	RBLOPUNCH3A,RBLOPUNCH3B,0
RBLOPUNCH4
	.long	RBLOPUNCH4A,RBLOPUNCH4B,0
RBLOPUNCH5
	.long	RBLOPUNCH5A,RBLOPUNCH5B,0
RBLOPUNCH6
	.long	RBLOPUNCH6A,RBLOPUNCH6B,0

**************************************************************************

a_elbow
	.long	ani_adjustx
	.word	>08
	.long	RBELBOCOMBO1
	.long	ani_adjustx
	.word	>08
	.long	RBELBOCOMBO2
	.long	RBELBOCOMBO3
	.long	0
	.long	RBELBOCOMBO2
	.long	RBELBOCOMBO1
	.long	0

	.long	ani_adjustx
	.word	>10
	.long	RBELBOCOMBO4
	.long	ani_adjustx
	.word	>10
	.long	RBELBOCOMBO5
	.long	RBELBOCOMBO6
	.long	0

	.long	ani_adjustx
	.word	>04
	.long	RBELBOCOMBO7
	.long	ani_adjustx
	.word	>04
	.long	RBELBOCOMBO8
	.long	ani_adjustx
	.word	>04
	.long	RBELBOCOMBO9
	.long	ani_adjustx
	.word	>04
	.long	RBELBOCOMBO10
	.long	0

	.long	RBELBOCOMBO9
	.long	RBELBOCOMBO8
	.long	RBELBOCOMBO7
	.long	0
*
* 6 = moving up elbow #1
*
;	.long	RBELBOCOMBO1
;	.long	RBELBOCOMBO2
;	.long	RBELBOCOMBO3
;	.long	0
;	.long	RBELBOCOMBO2
;	.long	RBELBOCOMBO1
;	.long	0


RBELBOCOMBO1
	.long	RBELBOCOMBO1A,RBELBOCOMBO1B,0
RBELBOCOMBO2
	.long	RBELBOCOMBO2A,RBELBOCOMBO2B,0
RBELBOCOMBO3
	.long	RBELBOCOMBO3A,RBELBOCOMBO3B,0
RBELBOCOMBO4
	.long	RBELBOCOMBO4A,RBELBOCOMBO4B,0
RBELBOCOMBO5
	.long	RBELBOCOMBO5A,RBELBOCOMBO5B,0
RBELBOCOMBO6
	.long	RBELBOCOMBO6A,RBELBOCOMBO6B,0
RBELBOCOMBO7
	.long	RBELBOCOMBO7A,RBELBOCOMBO7B,0
RBELBOCOMBO8
	.long	RBELBOCOMBO8A,0
RBELBOCOMBO9
	.long	RBELBOCOMBO9A,RBELBOCOMBO9B,0
RBELBOCOMBO10
	.long	RBELBOCOMBO10A,RBELBOCOMBO10B,0


RBHIPUNCH1
	.long	RBHIPUNCH1A,RBHIPUNCH1B,0
RBHIPUNCH2
	.long	RBHIPUNCH2A,RBHIPUNCH2B,0
RBHIPUNCH3
	.long	RBHIPUNCH3A,RBHIPUNCH3B,0
RBHIPUNCH4
	.long	RBHIPUNCH4A,RBHIPUNCH4B,0
RBHIPUNCH5
	.long	RBHIPUNCH5A,RBHIPUNCH5B,0
RBHIPUNCH6
	.long	RBHIPUNCH6A,RBHIPUNCH6B,0
RBHIPUNCH7
	.long	RBHIPUNCH7A,RBHIPUNCH7B,0

**************************************************************************

a_block	.long	RBHIBLOCK1
	.long	RBHIBLOCK2
	.long	RBHIBLOCK3
	.long	0

RBHIBLOCK1
	.long	RBHIBLOCK1A,RBHIBLOCK1B,0
RBHIBLOCK2
	.long	RBHIBLOCK2A,RBHIBLOCK2B,0
RBHIBLOCK3
	.long	RBHIBLOCK3A,RBHIBLOCK3B,0

**************************************************************************

a_lokick
	.long	RBLOKICK1
	.long	RBLOKICK2
	.long	RBLOKICK3
	.long	RBLOKICK4
	.long	RBLOKICK5
	.long	RBLOKICK6
	.long	0
	.long	RBLOKICK5
	.long	RBLOKICK4
	.long	RBLOKICK3
	.long	RBLOKICK2
	.long	RBLOKICK1
	.long	0

RBLOKICK1
	.long	RBLOKICK1A,RBLOKICK1B,0
RBLOKICK2
	.long	RBLOKICK2A,RBLOKICK2B,0
RBLOKICK3
	.long	RBLOKICK3A,0
RBLOKICK4
	.long	RBLOKICK4A,RBLOKICK4B,0
RBLOKICK5
	.long	RBLOKICK5A,0
RBLOKICK6
	.long	RBLOKICK6A,RBLOKICK6B,0

**************************************************************************

a_knee
	.long	RBKNEE1
	.long	RBKNEE2
	.long	RBKNEE3
	.long	0
	.long	RBKNEE2
	.long	RBKNEE1
	.long	0
*
* part 3 = knee 2 (backwards roundhouse)
*
	.long	RBSPINKICK8
	.long	RBSPINKICK7
	.long	RBSPINKICK6
	.long	RBSPINKICK5
	.long	0

	.long	RBSPINKICK4
	.long	RBSPINKICK3
	.long	RBSPINKICK2
	.long	RBSPINKICK1
	.long	0




RBKNEE1	.long	RBKNEE1A,RBKNEE1B,0
RBKNEE2	.long	RBKNEE2A,0
RBKNEE3	.long	RBKNEE3A,RBKNEE3B,0

**************************************************************************

a_sweep_kick
	.long	RBSWEEPKICK1
	.long	RBSWEEPKICK2
	.long	RBSWEEPKICK3
	.long	ani_calla,sweep_sounds
	.long	RBSWEEPKICK4
	.long	RBSWEEPKICK5
	.long	0

	.long	RBSWEEPKICK6
	.long	RBSWEEPKICK7
	.long	RBSWEEPKICK8
	.long	0

RBSWEEPKICK1
	.long	RBSWEEPKICK1A,RBSWEEPKICK1B,0
RBSWEEPKICK2
	.long	RBSWEEPKICK2A,RBSWEEPKICK2B,0
RBSWEEPKICK3
	.long	RBSWEEPKICK3A,0
RBSWEEPKICK4
	.long	RBSWEEPKICK4A,0
RBSWEEPKICK5
	.long	RBSWEEPKICK5A,RBSWEEPKICK5B,RBSWEEPKICK5C,0
RBSWEEPKICK6
	.long	RBSWEEPKICK6A,RBSWEEPKICK6B,0
RBSWEEPKICK7
	.long	RBSWEEPKICK7A,RBSWEEPKICK7B,0
RBSWEEPKICK8
	.long	RBSWEEPKICK8A,RBSWEEPKICK8B,0

**************************************************************************

a_roundhouse
	.long	RBSPINKICK1
	.long	RBSPINKICK2
	.long	RBSPINKICK3
	.long	RBSPINKICK4
	.long	RBSPINKICK5
	.long	0
	.long	RBSPINKICK6
	.long	RBSPINKICK7
	.long	RBSPINKICK8
	.long	0

RBSPINKICK1
	.long	RBSPINKICK1A,RBSPINKICK1B,0
RBSPINKICK2
	.long	RBSPINKICK2A,RBSPINKICK2B,0
RBSPINKICK3
	.long	RBSPINKICK3A,0
RBSPINKICK4
	.long	RBSPINKICK4A,RBSPINKICK4B,0
RBSPINKICK5
	.long	RBSPINKICK5A,RBSPINKICK5B,0
RBSPINKICK6
	.long	RBSPINKICK6A,RBSPINKICK6B,0
RBSPINKICK7
	.long	RBSPINKICK7A,0
RBSPINKICK8
	.long	RBSPINKICK8A,RBSPINKICK8B,0

**************************************************************************

a_hikick
	.long	RBLOKICK1
	.long	RBLOKICK2
	.long	RBLOKICK3
	.long	RBLOKICK4
	.long	RBLOKICK5
	.long	RBHIKICK1
	.long	0
	.long	RBLOKICK5
	.long	RBLOKICK4
	.long	RBLOKICK3
	.long	RBLOKICK2
	.long	RBLOKICK1
	.long	0

RBHIKICK1
	.long	RBHIKICK1A,RBHIKICK1B,0

**************************************************************************

a_jump	.long	RBJUMP1
	.long	RBJUMP2
	.long	RBJUMP3
	.long	0

RBJUMP1	.long	RBJUMP1A,RBJUMP1B,0
RBJUMP2	.long	RBJUMP2A,RBJUMP2B,0
RBJUMP3	.long	RBJUMP3A,RBJUMP3B,0

**************************************************************************

a_jump_kick
	.long	RBJUMPKICK1
	.long	RBJUMPKICK2
	.long	RBJUMPKICK3
	.long	0
	.long	RBJUMPKICK2
	.long	RBJUMPKICK1
	.long	0

RBJUMPKICK1
	.long	RBJUMPKICK1A,0
RBJUMPKICK2
	.long	RBJUMPKICK2A,0
RBJUMPKICK3
	.long	RBJUMPKICK3A,RBJUMPKICK3B,0

**************************************************************************

a_flip_kick
	.long	RBFLIPKICK1
	.long	RBFLIPKICK2
	.long	RBFLIPKICK3
	.long	0
	.long	RBFLIPKICK2
	.long	RBFLIPKICK1
	.long	0

RBFLIPKICK1
	.long	RBFLIPKICK1A,0
RBFLIPKICK2
	.long	RBFLIPKICK2A,0
RBFLIPKICK3
	.long	RBFLIPKICK3A,0

**************************************************************************

a_flip_punch
	.long	RBFLIPUNCH1
	.long	RBFLIPUNCH2
	.long	RBFLIPUNCH3
	.long	0
	.long	RBFLIPUNCH2
	.long	RBFLIPUNCH1
	.long	0

RBFLIPUNCH1
	.long	RBFLIPUNCH1A,0
RBFLIPUNCH2
	.long	RBFLIPUNCH2A,0
RBFLIPUNCH3
	.long	RBFLIPUNCH3A,0

**************************************************************************

a_fflip	.long	RBJUMPFLIP1
	.long	RBJUMPFLIP2
	.long	RBJUMPFLIP3
	.long	RBJUMPFLIP4
	.long	RBJUMPFLIP5
	.long	RBJUMPFLIP6
	.long	RBJUMPFLIP7
	.long	RBJUMPFLIP8
	.long	ani_jump,a_fflip+32

a_bflip
	.long	RBJUMPFLIP1
	.long	RBJUMPFLIP8
	.long	RBJUMPFLIP7
	.long	RBJUMPFLIP6
	.long	RBJUMPFLIP5
	.long	RBJUMPFLIP4
	.long	RBJUMPFLIP3
	.long	RBJUMPFLIP2
	.long	ani_jump,a_bflip+32

RBJUMPFLIP1
	.long	RBJUMPFLIP1A,0
RBJUMPFLIP2
	.long	RBJUMPFLIP2A,0
RBJUMPFLIP3
	.long	RBJUMPFLIP3A,0
RBJUMPFLIP4
	.long	RBJUMPFLIP4A,0
RBJUMPFLIP5
	.long	RBJUMPFLIP5A,0
RBJUMPFLIP6
	.long	RBJUMPFLIP6A,0
RBJUMPFLIP7
	.long	RBJUMPFLIP7A,0
RBJUMPFLIP8
	.long	RBJUMPFLIP8A,0

**************************************************************************

a_smoke_throw
	.long	ani_adjustx
	.word	6
	.long	RBAIRSLAM2
	.long	ani_adjustx
	.word	6
	.long	RBAIRSLAM3
	.long	0

a_air_slam
	.long	RBAIRSLAM4
	.long	RBAIRSLAM5
	.long	RBAIRSLAM6
	.long	RBAIRSLAM7
	.long	RBAIRSLAM8
	.long	RBAIRSLAM9	; part 1 = da slam
	.long	0

	.long	RBAIRSLAM1
	.long	RBAIRSLAM2
	.long	RBAIRSLAM3	; part 2 = da lunge
	.long	0

RBAIRSLAM1
	.long	RBAIRSLAM1A,0
RBAIRSLAM2
	.long	RBAIRSLAM2A,RBAIRSLAM2B,0
RBAIRSLAM3
	.long	RBAIRSLAM3A,RBAIRSLAM3B,0
RBAIRSLAM4
	.long	RBAIRSLAM4A,RBAIRSLAM4B,0
RBAIRSLAM5
	.long	RBAIRSLAM5A,RBAIRSLAM5B,0
RBAIRSLAM6
	.long	RBAIRSLAM6A,RBAIRSLAM6B,0
RBAIRSLAM7
	.long	RBAIRSLAM7A,RBAIRSLAM7B,0
RBAIRSLAM8
	.long	RBAIRSLAM8A,RBAIRSLAM8B,RBAIRSLAM8C,0
RBAIRSLAM9
	.long	RBAIRSLAM9A,RBAIRSLAM9B,0

**************************************************************************

a_hit_hi
	.long	RBHIHIT2
	.long	RBHIHIT3
	.long	RBHIHIT2
	.long	RBHIHIT1
	.long	0

RBHIHIT1	.long	RBHIHIT1A,RBHIHIT1B,0
RBHIHIT2	.long	RBHIHIT2A,RBHIHIT2B,0
RBHIHIT3	.long	RBHIHIT3A,RBHIHIT3B,0


**************************************************************************

a_hit_lo
	.long	RBLOHIT2
	.long	RBLOHIT3
	.long	RBLOHIT2
	.long	RBLOHIT1
	.long	0

RBLOHIT1	.long	RBLOHIT1A,RBLOHIT1B,0
RBLOHIT2	.long	RBLOHIT2A,RBLOHIT2B,0
RBLOHIT3	.long	RBLOHIT3A,RBLOHIT3B,0

**************************************************************************

a_stumble
	.long	RBSTUMBLE1
	.long	RBSTUMBLE2
	.long	RBSTUMBLE3
	.long	RBSTUMBLE4
	.long	RBSTUMBLE5
	.long	RBSTUMBLE6
	.long	RBSTUMBLE7
	.long	RBSTUMBLE8
	.long	RBSTUMBLE9
; ejbpatch - note how much longer it iz than norm
	.long	0

*
* part 2 = repeating version
*
j_stumble
	.long	RBSTUMBLE1
	.long	RBSTUMBLE2
	.long	RBSTUMBLE3
	.long	RBSTUMBLE4
	.long	RBSTUMBLE5
	.long	RBSTUMBLE6
	.long	RBSTUMBLE7
	.long	RBSTUMBLE8
	.long	RBSTUMBLE9
	.long	ani_jump,j_stumble

RBSTUMBLE1
	.long	RBSTUMBLE1A,0
RBSTUMBLE2
	.long	RBSTUMBLE2A,RBSTUMBLE2B,0
RBSTUMBLE3
	.long	RBSTUMBLE3A,RBSTUMBLE3B,0
RBSTUMBLE4
	.long	RBSTUMBLE4A,0
RBSTUMBLE5
	.long	RBSTUMBLE5A,0
RBSTUMBLE6
	.long	RBSTUMBLE6A,0
RBSTUMBLE7
	.long	RBSTUMBLE7A,RBSTUMBLE7B,0
RBSTUMBLE8
	.long	RBSTUMBLE8A,RBSTUMBLE8B,0
RBSTUMBLE9
	.long	RBSTUMBLE9A,RBSTUMBLE9B,0

**************************************************************************

a_dizzy
	.long	ani_calla,shock_init
	.long	ani_calla,shock_check
	.long	ROBOSHOCK1			; shock for 2 ticks
	.long	ani_calla,stun_speed_3
	.long	RBSTUNNED1			; + UNSHOCK for 4 ticks = 6 ticks
	.long	ani_calla,stun_speed_6

	.long	ani_calla,shock_check
	.long	ROBOSHOCK2			; shock for 2 ticks
	.long	ani_calla,stun_speed_3
	.long	RBSTUNNED2			; + UNSHOCK for 4 ticks = 6 ticks
	.long	ani_calla,stun_speed_6

	.long	ani_calla,shock_check
	.long	ROBOSHOCK3			; shock for 2 ticks
	.long	ani_calla,stun_speed_3
	.long	RBSTUNNED3			; + UNSHOCK for 4 ticks = 6 ticks
	.long	ani_calla,stun_speed_6

	.long	ani_calla,shock_check
	.long	ROBOSHOCK4			; shock for 2 ticks
	.long	ani_calla,stun_speed_3
	.long	RBSTUNNED4			; + UNSHOCK for 4 ticks = 6 ticks
	.long	ani_calla,stun_speed_6

	.long	ani_calla,shock_check
	.long	ROBOSHOCK5			; shock for 2 ticks
	.long	ani_calla,stun_speed_3
	.long	RBSTUNNED5			; + UNSHOCK for 4 ticks = 6 ticks
	.long	ani_calla,stun_speed_6

	.long	ani_calla,shock_check
	.long	ROBOSHOCK6			; shock for 2 ticks
	.long	ani_calla,stun_speed_3
	.long	RBSTUNNED6			; + UNSHOCK for 4 ticks = 6 ticks
	.long	ani_calla,stun_speed_6

	.long	ani_calla,shock_check
	.long	ROBOSHOCK7			; shock for 2 ticks
	.long	ani_calla,stun_speed_3
	.long	RBSTUNNED7			; + UNSHOCK for 4 ticks = 6 ticks
	.long	ani_calla,stun_speed_6

	.long	ani_calla,shock_check
	.long	ROBOSHOCK8			; shock for 2 ticks
	.long	ani_calla,stun_speed_3
	.long	RBSTUNNED8			; + UNSHOCK for 4 ticks = 6 ticks
	.long	ani_calla,stun_speed_6

	.long	ani_jump,a_dizzy+(32*2)


shock_init
	movk	1,a0
	move	a0,*a13(p_store1),0
	rets

shock_check
	move	*a13(p_store1),a0,0
	dec	a0
	jrne	shockc9

	movk	3,a1
	move	a1,*a13(p_anirate),0		; only show this for 2 ticks
	movi	ROBOSHOCK1A,a0
	calla	player_swpal_a0_image	; switch to ShOcK pal
	subi	32*3,a9				; counter 2 lines ahead

	movk	4,a0
	calla	randu

shockc9	move	a0,*a13(p_store1),0
	addi	32*3,a9				; skip shock stuff
	rets


stun_speed_3
	calla	player_normpal
	movk	3,a0
	jruc	stuns3

stun_speed_6
	movk	6,a0
stuns3	move	a0,*a13(p_anirate),0
	rets


RBSTUNNED1
	.long	RBSTUNNED1A,RBSTUNNED1B,0
RBSTUNNED2
	.long	RBSTUNNED2A,RBSTUNNED2B,0
RBSTUNNED3
	.long	RBSTUNNED3A,RBSTUNNED3B,0
RBSTUNNED4
	.long	RBSTUNNED4A,RBSTUNNED4B,0
RBSTUNNED5
	.long	RBSTUNNED5A,RBSTUNNED5B,0
RBSTUNNED6
	.long	RBSTUNNED6A,RBSTUNNED6B,0
RBSTUNNED7
	.long	RBSTUNNED7A,RBSTUNNED7B,0
RBSTUNNED8
	.long	RBSTUNNED8A,RBSTUNNED8B,0

ROBOSHOCK1
	.long	ROBOSHOCK1A,ROBOSHOCK1B,0
ROBOSHOCK2
	.long	ROBOSHOCK2A,ROBOSHOCK2B,0
ROBOSHOCK3
	.long	ROBOSHOCK3A,ROBOSHOCK3B,0
ROBOSHOCK4
	.long	ROBOSHOCK4A,ROBOSHOCK4B,0
ROBOSHOCK5
	.long	ROBOSHOCK5A,ROBOSHOCK5B,0
ROBOSHOCK6
	.long	ROBOSHOCK6A,ROBOSHOCK6B,0
ROBOSHOCK7
	.long	ROBOSHOCK7A,ROBOSHOCK7B,0
ROBOSHOCK8
	.long	ROBOSHOCK8A,ROBOSHOCK8B,0

**************************************************************************

a_knockdown
	.long	RBKNOCKDOWN1
	.long	RBKNOCKDOWN2
	.long	RBKNOCKDOWN3
	.long	RBKNOCKDOWN4
	.long	RBKNOCKDOWN5
	.long	0
	.long	RBKNOCKDOWN6
	.long	RBKNOCKDOWN7
	.long	0

RBKNOCKDOWN1
	.long	RBKNOCKDOWN1A,RBKNOCKDOWN1B,0
RBKNOCKDOWN2
	.long	RBKNOCKDOWN2A,0
RBKNOCKDOWN3
	.long	RBKNOCKDOWN3A,0
RBKNOCKDOWN4
	.long	RBKNOCKDOWN4A,RBKNOCKDOWN4B,0
RBKNOCKDOWN5
	.long	RBKNOCKDOWN5A,RBKNOCKDOWN5B,0
RBKNOCKDOWN6
	.long	RBKNOCKDOWN6A,0
RBKNOCKDOWN7
	.long	RBKNOCKDOWN7A,0

**************************************************************************

a_getup
	.long	RBGETUP1
	.long	RBGETUP2
	.long	RBGETUP3
	.long	RBGETUP4
	.long	RBGETUP5
	.long	RBGETUP6
	.long	0

RBGETUP1
	.long	RBGETUP1A,0
RBGETUP2
	.long	RBGETUP2A,0
RBGETUP3
	.long	RBGETUP3A,0
RBGETUP4
	.long	RBGETUP4A,0
RBGETUP5
	.long	RBGETUP5A,0
RBGETUP6
	.long	RBGETUP6A,0

;************************************************************************

a_afb_kano
	.long	ani_offset_xy
	.word	->29,->03
	.long	RBKNOCKDOWN1

	.long	ani_offset_xy
	.word	->2d,>05
	.long	RBKNOCKDOWN3

	.long	ani_offset_xy
 	.word	->36,>14
	.long	RBKNOCKDOWN4

	.long	0
*
* fall down solo
*
	.long	RBKNOCKDOWN4
	.long	RBKNOCKDOWN5
	.long	RBKNOCKDOWN6
	.long	RBKNOCKDOWN7
	.long	0

a_fb_smoke
a_afb_robo2
	.long	ani_offset_xy
	.word	->21,->2c
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	->0a,->34
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>25,->2a
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>45,->0f
	.long	RBFLIPPED4
	.long	ani_offset_xy
	.word	>5f,->09
	.long	RBKNOCKDOWN6
	.long	ani_offset_xy
	.word	>6c,>26
	.long	RBKNOCKDOWN6
	.long	0

a_fb_mileena
	.long	ani_offset_xy
	.word	->3a,->01
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->29,>07
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->1e,>01
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>0e,->1a
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>63,->34
	.long	RBFLIPPED4
	.long	0

	.long	RBFLIPPED5
	.long	RBKNOCKDOWN5
	.long	RBKNOCKDOWN6
	.long	RBKNOCKDOWN7
	.long	0

a_fb_kitana
	.long	ani_offset_xy
	.word	->20,->23
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->08,->40
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>32,->2d
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>3d,>0c
	.long	RBFLIPPED4
	.long	0

	.long	RBFLIPPED4
	.long	RBKNOCKDOWN5
	.long	RBKNOCKDOWN6
	.long	0


a_fb_jade
	.long	ani_offset_xy
	.word	->5a,>04
	.long	RBKNOCKDOWN1
	.long	ani_offset_xy
	.word	->5b,->21
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->43,->6c
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	->05,->6d
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>5e,->6c
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>81,->3d
	.long	RBFLIPPED4
	.long	ani_offset_xy
	.word	>89,->0c
	.long	RBFLIPPED5
	.long	0

	.long	RBFLIPPED4
	.long	RBKNOCKDOWN5
	.long	RBKNOCKDOWN6
	.long	0


a_fb_nj	.long	ani_offset_xy
	.word	->49,>06
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->3c,>0e
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->28,>17
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>00,>16
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>0e,>0e
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>5d,->17
	.long	RBFLIPPED4
	.long	0

	.long	RBFLIPPED5
	.long	RBKNOCKDOWN6
	.long	RBKNOCKDOWN7
	.long	0



a_fb_lao
	.long	ani_offset_xy
	.word	->29,>1a
	.long	RBSTUMBLE1		; 1
	.long	ani_offset_xy
	.word	->09,>33
	.long	RBSTUMBLE1		; 2
	.long	ani_flip
	.long	ani_offset_xy
	.word	->28,>24
	.long	RBFLIPPED1		; 3
	.long	ani_offset_xy
	.word	->46,->0f
	.long	RBFLIPPED2		; 4
	.long	ani_offset_xy
	.word	->2d,->44
	.long	RBFLIPPED3		; 5
	.long	ani_offset_xy
	.word	>14,->5a
	.long	RBFLIPPED4		; 6
	.long	ani_offset_xy
	.word	>54,->61
	.long	RBFLIPPED5		; 7
	.long	ani_offset_xy
	.word	>5a,->48
	.long	RBFLIPPED5		; 8
	.long	ani_offset_xy
	.word	>77,>02
	.long	RBFLIPPED5		; 9
	.long	ani_offset_xy
	.word	>77,>52
	.long	RBFLIPPED5		; 10
	.long	0


a_fb_tusk
	.long	ani_offset_xy
	.word	->6e,>00
	.long	RBFLIPPED1		; 1
	.long	ani_offset_xy
	.word	->64,->45
	.long	RBFLIPPED2		; 2
	.long	ani_offset_xy
	.word	->10,->64
	.long	RBFLIPPED3		; 3
	.long	ani_offset_xy
	.word	>40,->36
	.long	RBFLIPPED4		; 4
	.long	ani_offset_xy
	.word	>44,->0a
	.long	RBFLIPPED5		; 5

	.long	ani_offset_xy
	.word	>0f,>2b
	.long	RBFLIPPED5		; 6
	.long	ani_offset_xy
	.word	->22,->01
  	.long	RBKNOCKDOWN6		; 7
	.long	ani_offset_xy
	.word	->68,>01
	.long	RBFLIPPED1		; 8
	.long	ani_offset_xy
	.word	->55,->4a
	.long	RBFLIPPED2		; 9
	.long	ani_offset_xy
	.word	>26,->6d
	.long	RBFLIPPED3		; 10 

	.long	ani_offset_xy
	.word	>65,>09
	.long	RBFLIPPED5		; 11
	.long	ani_offset_xy
	.word	>64,>09
  	.long	RBKNOCKDOWN6		; 12
	.long	0



a_fb_sg
	.long	ani_offset_xy
	.word	->3d,->30
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->08,->52
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	->01,->4d
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>0b,->44
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>0e,->2b
	.long	RBFLIPPED3
	.long	ani_flip
	.long	ani_offset_xy
	.word	->26,->09
  	.long	RBKNOCKDOWN7
	.long	0


a_fb_st
	.long	ani_offset_xy
	.word	->44,>00
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->32,>07
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->2a,>0d
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	->02,>12
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>14,>3a
	.long	RBFLIPPED4

	.long	ani_offset_xy
	.word	->0f,>0b
	.long	RBKNOCKDOWN6
	.long	ani_offset_xy
	.word	->23,>0a
	.long	RBKNOCKDOWN6
	.long	ani_offset_xy
	.word	->32,>04
	.long	RBKNOCKDOWN6

	.long	ani_offset_xy
	.word	->53,>15
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->67,->0b
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->3c,->4c
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>2b,->35
	.long	RBFLIPPED4
	.long	ani_offset_xy
	.word	>4c,->0f
	.long	RBFLIPPED5
	.long	ani_offset_xy
	.word	>53,>06
	.long	RBKNOCKDOWN6
	.long	0


a_fb_lk
	.long	ani_offset_xy
	.word	->3f,->01
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->35,>07
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->13,>0d
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>16,>14
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>3f,>09
	.long	RBFLIPPED4
	.long	ani_offset_xy
	.word	>88,->1f
	.long	RBFLIPPED4
	.long	0

	.long	RBFLIPPED5
	.long	RBKNOCKDOWN5
	.long	RBKNOCKDOWN6
	.long	RBKNOCKDOWN7
	.long	0


a_fb_kano
	.long	ani_offset_xy
	.word	->32,->13			; we need even # of words here !
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->1a,->23
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>32,->24
	.long	RBFLIPPED3
	.long	0

	.long	RBFLIPPED4
	.long	RBFLIPPED5
	.long	RBKNOCKDOWN4
	.long	RBKNOCKDOWN5
	.long	0

a_fb_sonya
	.long	ani_offset_xy
	.word	->26,>07
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->14,>0d
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>10,>0e
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>4d,->05
	.long	RBFLIPPED4
	.long	ani_offset_xy
	.word	>7f,->0f
	.long	RBFLIPPED4
	.long	0

	.long	RBFLIPPED5
	.long	RBKNOCKDOWN4
	.long	RBKNOCKDOWN5
	.long	0

a_fb_jax
	.long	ani_offset_xy
	.word	->43,->18
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->29,->33
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>03,->45
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>3e,->20
	.long	RBFLIPPED4
	.long	ani_offset_xy
	.word	>4e,>16
	.long	RBFLIPPED4
	.long	ani_offset_xy
	.word	>4d,>18
	.long	RBKNOCKDOWN6
	.long	0

a_fb_ind
	.long	ani_offset_xy
	.word	->58,->13
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->4a,->33
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	->15,->5a
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>32,->38
	.long	RBFLIPPED4
	.long	ani_offset_xy
	.word	>54,->26
	.long	RBKNOCKDOWN6
	.long	ani_offset_xy
	.word	>49,>0b
	.long	RBKNOCKDOWN6
	.long	0

a_fb_sz
	.long	ani_offset_xy
	.word	->48,->35
	.long	RBFLIPPED1

	.long	ani_flip
	.long	ani_offset_xy
	.word	>46,->1d
	.long	RBFLIPPED5

	.long	ani_offset_xy
	.word	>35,>0a
	.long	RBFLIPPED5

	.long	ani_offset_xy
	.word	>02,>08
	.long	RBKNOCKDOWN5

	.long	ani_offset_xy
	.word	->3a,->13
	.long	RBKNOCKDOWN5

	.long	ani_offset_xy
	.word	->6e,->44
	.long	RBKNOCKDOWN5
	.long	0

a_fb_swat
	.long	ani_offset_xy
	.word	->4b,->10
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->36,->3b
	.long	RBFLIPPED2
	.long	ani_offset_xy
	.word	>28,->48
	.long	RBFLIPPED3
	.long	ani_offset_xy
	.word	>5b,->02
	.long	RBFLIPPED4
	.long	ani_offset_xy
	.word	>51,>14
	.long	RBKNOCKDOWN6
	.long	0



a_fb_lia
	.long	ani_offset_xy
	.word	->64,>00
	.long	RBSTUMBLE1
	.long	ani_offset_xy
	.word	->73,>03
	.long	RBSTUMBLE1

	.long	ani_offset_xy
	.word	->6c,->18
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->51,->37
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->20,->42
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	>23,->46
	.long	RBFLIPPED1

	.long	ani_offset_xy
	.word	>a3,>25
	.long	RBFLIPPED4
	.long	ani_offset_xy
	.word	>93,>00
	.long	RBKNOCKDOWN7
	.long	0


a_fb_robo1
	.long	ani_offset_xy
	.word	->4b,->05
	.long	RBFLIPPED1		; 1
	.long	ani_offset_xy
	.word	->4e,->2d
	.long	RBFLIPPED2		; 2
	.long	ani_offset_xy
	.word	->37,->42
	.long	RBFLIPPED2		; 3

	.long	ani_offset_xy
	.word	>00,->5f
	.long	RBFLIPPED3		; 4
	.long	ani_offset_xy
	.word	>3c,->55
	.long	RBFLIPPED4		; 5
	.long	ani_offset_xy
	.word	>60,->3d
	.long	RBFLIPPED4		; 6

	.long	ani_offset_xy
	.word	>7b,->0d
	.long	RBFLIPPED5		; 7
	.long	ani_offset_xy
	.word	>66,->09
	.long	RBKNOCKDOWN7		; 8
	.long	0


a_fb_robo2
	.long	ani_offset_xy
	.word	->1a,>00
	.long	RBSTUMBLE1		; 1
	.long	ani_offset_xy
	.word	->17,->07
	.long	RBFLIPPED1		; 2
	.long	ani_offset_xy
	.word	->0e,->09
	.long	RBFLIPPED2		; 3
	.long	ani_offset_xy
	.word	>12,>04
	.long	RBFLIPPED3		; 4
	.long	ani_offset_xy
	.word	>0f,>1b
	.long	RBFLIPPED4		; 5
	.long	ani_offset_xy
	.word	>09,>0e
	.long	RBFLIPPED5		; 6
	.long	ani_offset_xy
	.word	->13,->11
	.long	RBKNOCKDOWN7		; 7
	.long	0


a_legged
	.long	ani_offset_xy
	.word	->50-8,>03
	.long	RBKNOCKDOWN1

	.long	ani_offset_xy
	.word	->3b-8,->29
	.long	RBFLIPPED1

	.long	ani_offset_xy
	.word	>01-8,->4a
	.long	RBFLIPPED3

	.long	ani_offset_xy
	.word	>3f-8,->26
	.long	RBFLIPPED4

	.long	ani_offset_xy
	.word	>77-8,>00
	.long	RBFLIPPED5
	.long	0



a_orb_banged
	.long	RBFLIPPED1
	.long	RBFLIPPED2
	.long	RBFLIPPED3
	.long	RBFLIPPED4
	.long	RBFLIPPED5
	.long	0



a_zoomed
	.long	ani_offset_xy
	.word	>55,->07
	.long	RBKNOCKDOWN3	; 1

	.long	ani_offset_xy
	.word	>61,>18
	.long	RBKNOCKDOWN4	; 2

	.long	ani_offset_xy
	.word	>32,>20
	.long	RBKNOCKDOWN5	; 3

	.long	ani_offset_xy
	.word	->30,>26
	.long	RBKNOCKDOWN5	; 4

	.long	ani_offset_xy
	.word	->87,->06
	.long	RBFLIPPED1	; 5

	.long	ani_offset_xy
	.word	->2b,->4c
	.long	RBFLIPPED3	; 6
	.long	0

	.long	RBFLIPPED3
	.long	RBFLIPPED4
	.long	RBFLIPPED5
	.long	RBKNOCKDOWN5
	.long	RBKNOCKDOWN6
	.long	RBKNOCKDOWN7
	.long	0


a_shook
	.long	ani_offset_xy
	.word	->4d,->13
	.long	RBSTUMBLE1	; 3

	.long	ani_offset_xy
	.word	->34,->2b
	.long	RBSTUMBLE1	; 4

	.long	ani_offset_xy
	.word	->1a,->24
	.long	RBSTUMBLE1	; 5
	.long	0

; loop
	.long	ani_offset_xy
	.word	->1d,->24
	.long	RBSTUMBLE1	; 6

	.long	ani_offset_xy
	.word	->36,->32
	.long	RBSTUMBLE1	; 7

	.long	ani_offset_xy
	.word	->40,->32	
	.long	RBSTUMBLE1	; 8

	.long	ani_offset_xy
	.word	->36,->32
	.long	RBSTUMBLE1	; 7
	.long	0

RBFLIPPED1
	.long	RBFLIPPED1A,RBFLIPPED1B,0
RBFLIPPED2
	.long	RBFLIPPED2A,RBFLIPPED2B,0
RBFLIPPED3
	.long	RBFLIPPED3A,0
RBFLIPPED4
	.long	RBFLIPPED4A,0
RBFLIPPED5
	.long	RBFLIPPED5A,0

**************************************************************************

a_sweep_fall
	.long	RBSWEEPFALL1
	.long	RBSWEEPFALL2
	.long	RBSWEEPFALL3
	.long	RBSWEEPFALL4
	.long	RBSWEEPFALL5
	.long	0
	.long	RBSWEEPFALL6
	.long	RBSWEEPFALL7
	.long	0

RBSWEEPFALL1
	.long	RBSWEEPFALL1A,RBSWEEPFALL1B,RBSWEEPFALL1C,0
RBSWEEPFALL2
	.long	RBSWEEPFALL2A,RBSWEEPFALL2B,0
RBSWEEPFALL3
	.long	RBSWEEPFALL3A,RBSWEEPFALL3B,0
RBSWEEPFALL4
	.long	RBSWEEPFALL4A,RBSWEEPFALL4B,0
RBSWEEPFALL5
	.long	RBSWEEPFALL5A,RBSWEEPFALL5B,0
RBSWEEPFALL6
	.long	RBSWEEPFALL6A,RBSWEEPFALL6B,0
RBSWEEPFALL7
	.long	RBSWEEPFALL7A,RBSWEEPFALL7B,0

**************************************************************************

a_sweepup
	.long	RBSWEEPUP1
	.long	RBSWEEPUP2
	.long	RBSWEEPUP3
	.long	RBSWEEPUP4
	.long	RBSWEEPUP5
	.long	0

RBSWEEPUP1
	.long	RBSWEEPUP1A,0
RBSWEEPUP2
	.long	RBSWEEPUP2A,RBSWEEPUP2B,0
RBSWEEPUP3
	.long	RBSWEEPUP3A,RBSWEEPUP3B,0
RBSWEEPUP4
	.long	RBSWEEPUP4A,0
RBSWEEPUP5
	.long	RBSWEEPUP5A,RBSWEEPUP5B,0

**************************************************************************

a_chest_open
	.long	RBCHEST1
	.long	RBCHEST2
	.long	0

RBCHEST1	.long	RBCHEST1A,RBCHEST1B,0
RBCHEST2	.long	RBCHEST2A,RBCHEST2B,0

**************************************************************************

a_victory
;add later
;	.long	ani_ochar_jump
;	.long	ft_robo2 
;	.long	a_r2victory		; yes = different victory animation

a_inviso
	.long	RB1VICTORY1
	.long	RB1VICTORY2
	.long	RB1VICTORY3
	.long	RB1VICTORY4
	.long	RB1VICTORY5
	.long	RB1VICTORY6
	.long	0

a_r2victory
	.long	RB2VICTORY1
	.long	RB2VICTORY2
	.long	RB2VICTORY3
	.long	RB2VICTORY4
	.long	RB2VICTORY5
	.long	RB2VICTORY6
	.long	0


RB1VICTORY1
	.long	RB1VICTORY1A,RB1VICTORY1B,0
RB1VICTORY2
	.long	RB1VICTORY2A,RB1VICTORYLEG1,0
RB1VICTORY3
	.long	RB1VICTORY3A,RB1VICTORY3B,RB1VICTORYLEG1,0
RB1VICTORY4
	.long	RB1VICTORY4A,RB1VICTORYLEG1,0
RB1VICTORY5
	.long	RB1VICTORY5A,RB1VICTORYLEG1,0
RB1VICTORY6
	.long	RB1VICTORY6A,RB1VICTORYLEG1,0


RB2VICTORY1
	.long	RB2VICTORY1A,RB2VICTORY1B,0
RB2VICTORY2
	.long	RB2VICTORY2A,RB2VICTORY2B,0
RB2VICTORY3
	.long	RB2VICTORY3A,RB2VICTORY3B,0
RB2VICTORY4
	.long	RB2VICTORY4A,RB2VICTORY4B,0
RB2VICTORY5
	.long	RB2VICTORY5A,RB2VICTORY5B,0
RB2VICTORY6
	.long	RB2VICTORY6A,RB2VICTORY6B,0

**************************************************************************

a_throw
;add later
;	.long	ani_ochar_jump
;	.long	ft_robo2 
;	.long	a_robo2_throw		; yes = different throw animation

;add later
;	.long	ani_ochar_jump
;	.long	ft_smoke
;	.long	a_smoke_throw		; yes = different throw animation

	.long	RBSHOLDER1
	.long	RBSHOLDER2
	.long	RBSHOLDER3
	.long	RBSHOLDER4

	.long	0	  	; remove this when "debugging"

	.long	ani_sladd,RBMECARM1
	.long	ani_slani_sleep,RBMECARM1
	.long	ani_slani_sleep,RBMECARM2
	.long	ani_slani_sleep,RBMECARM3
	.long	ani_slani_sleep,RBMECARM4
	.long	0

	.long	ani_slani,RBMECARM5
	.long	ani_calla,set_a10_to_him
	.long	RBSHOLDER4

	.long	ani_calla,set_a10_to_slave
	.long	ani_slani,RBMECARM6
	.long	ani_calla,set_a10_to_him
	.long	RBSHOLDER4

	.long	ani_calla,set_a10_to_slave
	.long	ani_slani,RBMECARM7
	.long	ani_calla,set_a10_to_him
	.long	RBSHOLDER4

	.long	ani_calla,set_a10_to_slave
	.long	ani_slani,RBMECARM8
	.long	ani_calla,set_a10_to_him
	.long	RBSHOLDER4

	.long	ani_calla,set_a10_to_slave
	.long	ani_slani,RBMECARM9
	.long	ani_calla,set_a10_to_him
	.long	RBSHOLDER4

	.long	ani_calla,set_a10_to_slave
	.long	ani_slani,RBMECARM10
	.long	ani_calla,set_a10_to_him
	.long	RBSHOLDER4				; animate together

	.long	ani_calla,set_a10_to_slave
	.long	ani_slani,RBMECARM12
	.long	ani_calla,set_a10_to_him
	.long	RBSHOLDER4				; animate together

	.long	ani_calla,set_a10_to_slave
	.long	ani_slani,RBMECARM13
	.long	ani_calla,set_a10_to_him
	.long	RBSHOLDER4				; animate together
	.long	0

	.long	ani_calla,set_a10_to_slave
	.long	ani_slani_sleep,RBMECARM14
	.long	ani_slani_sleep,RBMECARM15
	.long	ani_slani_sleep,RBMECARM16
	.long	ani_slani_sleep,RBMECARM17
	.long	ani_slani_sleep,RBMECARM18
	.long	ani_slani_sleep,RBMECARM19
	.long	ani_slani_sleep,RBMECARM20
	.long	ani_slani_sleep,RBMECARM21
	.long	0

set_a10_to_him
	move	*a13(p_otherguy),a10,1
	rets

set_a10_to_slave
	move	*a13(p_slave),a10,1
	rets



RBMECARM1
	.long	RBMECARM1A,0
RBMECARM2
	.long	RBMECARM2A,0
RBMECARM3
	.long	RBMECARM3A,0
RBMECARM4
	.long	RBMECARM4A,0
RBMECARM5
	.long	RBMECARM5A,0
RBMECARM6
	.long	RBMECARM6A,0
RBMECARM7
	.long	RBMECARM7A,0
RBMECARM8
	.long	RBMECARM8A,0
RBMECARM9
	.long	RBMECARM9A,0
RBMECARM10
	.long	RBMECARM10A,0

RBMECARM12
	.long	RBMECARM12A,0
RBMECARM13
	.long	RBMECARM13A,0

RBMECARM14
	.long	RBMECARM14A,0
RBMECARM15
	.long	RBMECARM15A,0
RBMECARM16
	.long	RBMECARM16A,0
RBMECARM17
	.long	RBMECARM17A,0
RBMECARM18
	.long	RBMECARM18A,0
RBMECARM19
	.long	RBMECARM19A,0
RBMECARM20
	.long	RBMECARM20A,0
RBMECARM21
	.long	RBMECARM21A,0
RBSHOLDER1
	.long	RBSHOLDER1A,RBSHOLDER1B,0
RBSHOLDER2
	.long	RBSHOLDER2A,RBSHOLDER2B,0
RBSHOLDER3
	.long	RBSHOLDER3A,RBSHOLDER3B,0
RBSHOLDER4
	.long	RBSHOLDER4A,RBSHOLDER4B,0

;***********************************************************************

a_projectile
a_rocket
	.long	rocket1
	.long	rocket2
	.long	ani_jump,a_rocket		; 12
	.long	0

jrock1	.long	rocket3
	.long	rocket4
	.long	ani_jump,jrock1			; 1
	.long	0

jrock2	.long	rocket5
	.long	rocket6
	.long	ani_jump,jrock2			; 2
	.long	0

jrock3	.long	rocket7
	.long	rocket8
	.long	ani_jump,jrock3			; 3
	.long	0

jrock6	.long	rocket13
	.long	rocket14
	.long	ani_jump,jrock6			; 6
	.long	0

jrock5	.long	rocket11
	.long	rocket12
	.long	ani_jump,jrock5			; 5
	.long	0

jrock4	.long	rocket9
	.long	rocket10
	.long	ani_jump,jrock4			; 4
	.long	0

jrock3f	.long	rocket7
	.long	rocket8
	.long	ani_jump,jrock3f		; 3
	.long	0


rocket1	.long	ROCKETA1,0
rocket2	.long	ROCKETA2,0

rocket3	.long	ROCKETB1,0
rocket4	.long	ROCKETB2,0

rocket5	.long	ROCKETC1,0
rocket6	.long	ROCKETC2,0

rocket7	.long	ROCKETD1,0
rocket8	.long	ROCKETD2,0

rocket9	.long	ROCKETE1,0
rocket10 .long	ROCKETE2,0

rocket11 .long	ROCKETF1,0
rocket12 .long	ROCKETF2,0

rocket13 .long	ROCKETG1,0
rocket14 .long	ROCKETG2,0

;***********************************************************************

a_target
	.long	TARGET1
	.long	TARGET2
	.long	TARGET3
	.long	TARGET4
	.long	TARGET5
	.long	TARGET6
	.long	TARGET7
	.long	TARGET8
	.long	ani_jump,a_target


a_bomb	.long	RRBOMB1
	.long	RRBOMB2
	.long	RRBOMB3
	.long	RRBOMB4
	.long	RRBOMB5
	.long	RRBOMB6

	.long	RRBOMB1
	.long	RRBOMB1
	.long	RRBOMB1
	.long	RRBOMB1
	.long	ani_jump,a_bomb
	.long	0

; used ? (ejbpatch)
*
* part 2 = bomb pulse
*
	.long	PULSE1
	.long	PULSE2
	.long	PULSE3
	.long	PULSE4
	.long	PULSE5
	.long	PULSE6
	.long	0

RRBOMB1	.long	ROBOMB1,0
RRBOMB2	.long	ROBOMB2,0
RRBOMB3	.long	ROBOMB3,0
RRBOMB4	.long	ROBOMB4,0
RRBOMB5	.long	ROBOMB5,0
RRBOMB6	.long	ROBOMB6,0

PULSE1	.long	ROBOMBPULSE1,0
PULSE2	.long	ROBOMBPULSE2,0
PULSE3	.long	ROBOMBPULSE3,0
PULSE4	.long	ROBOMBPULSE4,0
PULSE5	.long	ROBOMBPULSE5,0
PULSE6	.long	ROBOMBPULSE6,0

;***********************************************************************

a_net	.long	RNET1
	.long	RNET2
	.long	RNET3
	.long	RNET4
	.long	RNET5
	.long	RNET6
	.long	0

j_net_wiggle
	.long	RNET7
	.long	RNET8
	.long	RNET9
	.long	RNET10
	.long	RNET11
	.long	RNET12
	.long	RNET13
	.long	RNET14
	.long	ani_jump,j_net_wiggle
	.long	0

	.long	RNET15
	.long	RNET16
	.long	RNET17
	.long	RNET18
	.long	RNET19
	.long	RNET20
	.long	0

RNET1	.long	NET1,0
RNET2	.long	NET2,0
RNET3	.long	NET3,0
RNET4	.long	NET4,0
RNET5	.long	NET5,0
RNET6	.long	NET6,0
RNET7	.long	NET7,0
RNET8	.long	NET8,0
RNET9	.long	NET9,0
RNET10	.long	NET10,0
RNET11	.long	NET11,0
RNET12	.long	NET12,0
RNET13	.long	NET13,0
RNET14	.long	NET14,0
RNET15	.long	NET15,0
RNET16	.long	NET16,0
RNET17	.long	NET17,0
RNET18	.long	NET18,0
RNET19	.long	NET19,0
RNET20	.long	NET20,0


a_run
	.long	RBRUN1
	.long	RBRUN2
	.long	RBRUN3
	.long	ani_calla,rsnd_footstep
	.long	RBRUN4
	.long	RBRUN5
	.long	RBRUN6
	.long	RBRUN7
	.long	RBRUN8
	.long	RBRUN9
	.long	ani_calla,rsnd_footstep
	.long	RBRUN10
	.long	RBRUN11
	.long	RBRUN12
	.long	ani_jump,a_run
	.long	0			; we need this zero !!

RBRUN1	.long	RBRUN1A,RBRUN1B,0
RBRUN2	.long	RBRUN2A,RBRUN2B,0
RBRUN3	.long	RBRUN3A,RBRUN3B,0
RBRUN4	.long	RBRUN4A,0
RBRUN5	.long	RBRUN5A,0
RBRUN6	.long	RBRUN6A,RBRUN6B,0
RBRUN7	.long	RBRUN7A,RBRUN7B,0
RBRUN8	.long	RBRUN8A,RBRUN8B,0
RBRUN9	.long	RBRUN9A,RBRUN9B,0
RBRUN10	.long	RBRUN10A,0
RBRUN11	.long	RBRUN11A,0
RBRUN12	.long	RBRUN12A,RBRUN12B,0

;***************************************************************************

a_bolt	.long	BOLT1
	.long	BOLT2
	.long	BOLT3
	.long	BOLT4
	.long	BOLT5
	.long	BOLT6
	.long	BOLT7
	.long	BOLT8
	.long	0


a_robo_telepunch
	.long	RBAIRPUNCH1
	.long	RBAIRPUNCH2
	.long	RBAIRPUNCH3
	.long	RBAIRPUNCH4
	.long	RBAIRPUNCH5
	.long	0

RBAIRPUNCH1
	.long	RBAIRPUNCH1A,0
RBAIRPUNCH2
	.long	RBAIRPUNCH2A,0
RBAIRPUNCH3
	.long	RBAIRPUNCH3A,RBAIRPUNCH3B,0
RBAIRPUNCH4
	.long	RBAIRPUNCH4A,RBAIRPUNCH4B,0
RBAIRPUNCH5
	.long	RBAIRPUNCH5A,0


a_robo2_throw
	.long	ani_adjustx
	.word	6
	.long	RBFLYFLIP2
	.long	ani_adjustx
	.word	6
	.long	RBFLYFLIP3		; grab
	.long	ani_adjustx
	.word	6
	.long	RBFLYFLIP4
	.long	0

	.long	RBFLYFLIP4
	.long	RBFLYFLIP5
	.long	RBFLYFLIP6
	.long	RBFLYFLIP7
	.long	RBFLYFLIP8		; animate 2-gether !!
	.long	RBFLYFLIP9
	.long	RBFLYFLIP10
	.long	0

RBFLYFLIP2
	.long	RBFLYFLIP2A,0
RBFLYFLIP3
	.long	RBFLYFLIP3A,0
RBFLYFLIP4
	.long	RBFLYFLIP4A,0
RBFLYFLIP5
	.long	RBFLYFLIP5A,0
RBFLYFLIP6
	.long	RBFLYFLIP6A,RBFLYFLIP6B,0
RBFLYFLIP7
	.long	RBFLYFLIP7A,0
RBFLYFLIP8
	.long	RBFLYFLIP8A,0
RBFLYFLIP9
	.long	RBFLYFLIP9A,0
RBFLYFLIP10
	.long	RBFLYFLIP10A,RBFLYFLIP10B,0


a_tele_explode
	.long	RBEXPLODE1
	.long	RBEXPLODE2
	.long	RBEXPLODE3
	.long	0
*
* part 2 = limb (left arm)
*
jlimb2	.long	RBXPLARM1
	.long	RBXPLARM2
	.long	RBXPLARM3
	.long	RBXPLARM4
	.long	RBXPLARM5
	.long	RBXPLARM6
	.long	RBXPLARM7
	.long	RBXPLARM8,ani_jump,jlimb2
	.long	0
*
* part 3 = limb (head)
*
jlimb3	.long	RBXPHEAD1
	.long	RBXPHEAD2
	.long	RBXPHEAD3
	.long	RBXPHEAD4
	.long	RBXPHEAD5
	.long	RBXPHEAD6
	.long	RBXPHEAD7
	.long	RBXPHEAD8,ani_jump,jlimb3
	.long	0
*
* part 4 = limb (right arm)
*
jlimb4	.long	RBXPRARM1
	.long	RBXPRARM2
	.long	RBXPRARM3
	.long	RBXPRARM4
	.long	RBXPRARM5
	.long	RBXPRARM6
	.long	RBXPRARM7
	.long	RBXPRARM8,ani_jump,jlimb4
	.long	0
*
* part 5 = limb (chest)
*
jlimb5	.long	RBXPCHEST1
	.long	RBXPCHEST2
	.long	RBXPCHEST3
	.long	RBXPCHEST4
	.long	RBXPCHEST5
	.long	RBXPCHEST6
	.long	RBXPCHEST7
	.long	RBXPCHEST8,ani_jump,jlimb5
	.long	0
*
* part 6 = limb (hip)
*
jlimb6	.long	RBXPHIP1
	.long	RBXPHIP2
	.long	RBXPHIP3
	.long	RBXPHIP4
	.long	RBXPHIP5
	.long	RBXPHIP6
	.long	RBXPHIP7
	.long	RBXPHIP8,ani_jump,jlimb6
	.long	0
*
* part 7 = limb (right leg)
*
jlimb7	.long	RBXPRLEG1
	.long	RBXPRLEG2
	.long	RBXPRLEG3
	.long	RBXPRLEG4
	.long	RBXPRLEG5
	.long	RBXPRLEG6
	.long	RBXPRLEG7
	.long	RBXPRLEG8,ani_jump,jlimb7
	.long	0
*
* part 8 = limb (left leg)
*
jlimb8	.long	RBXPLLEG1
	.long	RBXPLLEG2
	.long	RBXPLLEG3
	.long	RBXPLLEG4
	.long	RBXPLLEG5
	.long	RBXPLLEG6
	.long	RBXPLLEG7
	.long	RBXPLLEG8,ani_jump,jlimb8
	.long	0

RBEXPLODE1
	.long	RBEXPLODE1A,RBEXPLODE1B,0
RBEXPLODE2
	.long	RBEXPLODE2A,RBEXPLODE2B,0
RBEXPLODE3
	.long	RBEXPLODE3A,RBEXPLODE3B,0

;**************************************************************

a_crush_arms
	.long	ani_sladd,CRARM1	; slave = arms
	.long	RBCHEST2
	.long	CRARM2
	.long	CRARM3
	.long	0

	.long	CRARM4
	.long	CRARM5
	.long	CRARM6
	.long	CRARM7
	.long	ani_nosleep
	.long	CRARM_NO_UD
	.long	0
*
* single objects
*
	.long	RBCRUSH8U
	.long	RBCRUSH8D
	.long	RBCRUSH17U
	.long	RBCRUSH17D
	.long	0
*
* retract
*
	.long	ani_slani_sleep,CRARM3
	.long	ani_slani_sleep,CRARM2
	.long	ani_slani_sleep,CRARM1
	.long	0


CRARM1	.long	RBCRUSH1,0
CRARM2	.long	RBCRUSH2,0
CRARM3	.long	RBCRUSH3,0
CRARM4	.long	RBCRUSH4,RBCRUSH4U,RBCRUSH4D,0
CRARM5	.long	RBCRUSH4,RBCRUSH5U,RBCRUSH5D,0
CRARM6	.long	RBCRUSH4,RBCRUSH6U,RBCRUSH6D,0
CRARM7	.long	RBCRUSH4,RBCRUSH7U,RBCRUSH7D,0

CRARM_NO_UD
	.long	RBCRUSH4,0

;*************************************************************************

a_crush_blood
	.long	ROBOBLOOD1
	.long	ROBOBLOOD2
	.long	ROBOBLOOD3
	.long	ROBOBLOOD4
	.long	ROBOBLOOD5
	.long	ROBOBLOOD6
	.long	ROBOBLOOD7
	.long	ROBOBLOOD8
	.long	ROBOBLOOD9
	.long	ROBOBLOOD10
	.long	ROBOBLOOD11
	.long	ROBOBLOOD12
	.long	ROBOBLOOD13
	.long	ROBOBLOOD14
	.long	ROBOBLOOD15
	.long	ROBOBLOOD16
	.long	ROBOBLOOD17
	.long	ROBOBLOOD18
	.long	ROBOBLOOD19
	.long	0


ROBOBLOOD1
	.long	ROBOBLOOD1A,0
ROBOBLOOD2
	.long	ROBOBLOOD2A,0
ROBOBLOOD3
	.long	ROBOBLOOD3A,ROBOBLOOD3B,0
ROBOBLOOD4
	.long	ROBOBLOOD4A,ROBOBLOOD4B,0
ROBOBLOOD5
	.long	ROBOBLOOD5A,ROBOBLOOD5B,ROBOBLOOD5C,ROBOBLOOD5D
	.long	ROBOBLOOD5E,0
ROBOBLOOD6
	.long	ROBOBLOOD6A,ROBOBLOOD6B,ROBOBLOOD6C,ROBOBLOOD6D
	.long	ROBOBLOOD6E,0
ROBOBLOOD7
	.long	ROBOBLOOD7A,ROBOBLOOD7B,ROBOBLOOD7C,ROBOBLOOD7D
	.long	0
ROBOBLOOD8
	.long	ROBOBLOOD8A,ROBOBLOOD8B,ROBOBLOOD8C,ROBOBLOOD8D
	.long	ROBOBLOOD8E,ROBOBLOOD8F,0
ROBOBLOOD9
	.long	ROBOBLOOD9A,ROBOBLOOD9B,ROBOBLOOD9C,ROBOBLOOD9D
	.long	ROBOBLOOD9E,0
ROBOBLOOD10
	.long	ROBOBLOOD10A,ROBOBLOOD10B,ROBOBLOOD10C,ROBOBLOOD10D
	.long	0
ROBOBLOOD11
	.long	ROBOBLOOD11A,ROBOBLOOD11B,ROBOBLOOD11C,ROBOBLOOD11D
	.long	0
ROBOBLOOD12
	.long	ROBOBLOOD12A,ROBOBLOOD12B,ROBOBLOOD12C,ROBOBLOOD12D
	.long	ROBOBLOOD12E,0
ROBOBLOOD13
	.long	ROBOBLOOD13A,ROBOBLOOD13B,ROBOBLOOD13C,ROBOBLOOD13D
	.long	0
ROBOBLOOD14
	.long	ROBOBLOOD14A,ROBOBLOOD14B,ROBOBLOOD14C,0
ROBOBLOOD15
	.long	ROBOBLOOD15A,ROBOBLOOD15B,ROBOBLOOD15C,ROBOBLOOD15D
	.long	0
ROBOBLOOD16
	.long	ROBOBLOOD16A,ROBOBLOOD16B,ROBOBLOOD16C,ROBOBLOOD16D
	.long	0
ROBOBLOOD17
	.long	ROBOBLOOD17A,ROBOBLOOD17B,ROBOBLOOD17C,ROBOBLOOD17D
	.long	0
ROBOBLOOD18
	.long	ROBOBLOOD18A,ROBOBLOOD18B,ROBOBLOOD18C,ROBOBLOOD18D
	.long	0
ROBOBLOOD19
	.long	ROBOBLOOD19A,ROBOBLOOD19B,ROBOBLOOD19C,ROBOBLOOD19D
	.long	0

;**************************************************************

a_scared
	.long	RBSCARED2
	.long	0

RBSCARED2
	.long	RBSCARED2A,0

a_thudd
	.long	RBTHUD1
	.long	RBTHUD2
	.long	RBTHUD3
	.long	RBTHUD4
	.long	RBTHUD5
	.long	RBTHUD6
	.long	0

RBTHUD1
	.long	RBTHUD1A,0
RBTHUD2
	.long	RBTHUD2A,0
RBTHUD3
	.long	RBTHUD3A,0
RBTHUD4
	.long	RBTHUD4A,0
RBTHUD5
	.long	RBTHUD5A,0
RBTHUD6
	.long	RBTHUD6A,0

;**************************************************************

a_flame_on
	.long	RBFLAMEON1
	.long	RBFLAMEON2
	.long	RBFLAMEON3
	.long	RBFLAMEON3
	.long	RBFLAMEON3
	.long	ani_sound
	.long	>1f				; flame throw sound
	.long	ani_sladd,RFIRE1
	.long	ani_slani_sleep,RFIRE1
	.long	ani_slani_sleep,RFIRE2
	.long	ani_slani_sleep,RFIRE3
	.long	ani_slani_sleep,RFIRE4
	.long	ani_slani_sleep,RFIRE5
	.long	ani_slani_sleep,RFIRE6
	.long	0
	.long	RBFLAMEON2
	.long	RBFLAMEON1
	.long	0


RFIRE1	.long	ROBOFIRE1,0
RFIRE2	.long	ROBOFIRE2,0
RFIRE3	.long	ROBOFIRE3,0
RFIRE4	.long	ROBOFIRE4,0
RFIRE5	.long	ROBOFIRE5,0
RFIRE6	.long	ROBOFIRE6,0
RFIRE7	.long	ROBOFIRE7,0

RBFLAMEON1
	.long	RBFLAMEON1A,RBFLAMEON1B,0
RBFLAMEON2
	.long	RBFLAMEON2A,RBFLAMEON2B,0
RBFLAMEON3
	.long	RBFLAMEON3A,RBFLAMEON3B,0

;**************************************************************

a_throw_spear
	.long	RBCHEST1
	.long	RBCHEST2
	.long	0

	.long	RBCHEST2
	.long	RBCHEST1
	.long	0
*
* part 3 = spear obj
*
;	.long	COMEHERE1
;	.long	COMEHERE2
;	.long	COMEHERE3
;	.long	0
*
* part 4 = multipart spear
*
;	.long	M_SPEAR1

a_spear	.long	M_SPEAR1
	.long	M_SPEAR2
	.long	ani_jump,a_spear
	.long	0
	.long	M_SPEAR3			; 3 = tight rope !!
	.long	0

M_SPEAR1	.long	COMEHERE1,0
M_SPEAR2	.long	COMEHERE2,0
M_SPEAR3	.long	COMEHERE3,0

;**************************************************************

a_self_destruct
	.long	RBDESTRUCT2
	.long	ani_sladd,PLITE3
	.long	RBDESTRUCT4
	.long	0

	.long	ani_slani,PLITE4
	.long	RBDESTRUCT5
	.long	ani_calla,beep_sound
	.long	ani_slani,PLITE5
	.long	RBDESTRUCT6
	.long	ani_slani,PLITE6
	.long	RBDESTRUCT7
	.long	ani_calla,beep_sound
	.long	ani_slani,PLITE5
	.long	RBDESTRUCT6
	.long	0
*
* part 3 = laugh
*
	.long	ani_sladd,RBDISPLAY1
	.long	RBLAFF2
	.long	ani_slani,RBDISPLAY2
	.long	RBLAFF2
	.long	ani_slani,RBDISPLAY3
	.long	RBLAFF3
	.long	0

	.long	ani_calla,robo_laugh_sound
	.long	RBLAFF4
	.long	ani_slani,RBDISPLAY2
	.long	RBLAFF5
	.long	ani_slani,RBDISPLAY3
	.long	RBLAFF6
	.long	ani_slani,RBDISPLAY1
	.long	RBLAFF5
	.long	0

robo_laugh_sound
	movi	>1c,a0
	jauc	ochar_sound

beep_sound
	movi	>1a,a0
	jauc	ochar_sound

RBDESTRUCT2
	.long	RBDESTRUCT2A,RBDESTRUCT2B,0
RBDESTRUCT4
	.long	RBDESTRUCT4A,RBDESTRUCT3A,RBDESTRUCT3B,0
RBDESTRUCT5
	.long	RBDESTRUCT5A,RBDESTRUCT3A,RBDESTRUCT3B,0
RBDESTRUCT6
	.long	RBDESTRUCT6A,RBDESTRUCT3A,RBDESTRUCT3B,0
RBDESTRUCT7
	.long	RBDESTRUCT7A,RBDESTRUCT3A,RBDESTRUCT3B,0

PLITE3	.long	RBPANELITE3,0
PLITE4	.long	RBPANELITE4,0
PLITE5	.long	RBPANELITE5,0
PLITE6	.long	RBPANELITE6,0

	.long	HEADSPINBODY
	.long	HEADA1,HEADA2,HEADA3,HEADA4,HEADA5,HEADA6
	.long	HEADA7,HEADA8,HEADB1,HEADB2,HEADB3,HEADB4,HEADB5,HEADB6,HEADB7,HEADB8
	.long	HEADC1,HEADC2,HEADC3,HEADC4,HEADC5,HEADC6,HEADC7,HEADC8,0

RBLAFF2
	.long	RBLAFF2A,RBLAFF2B,0
RBLAFF3
	.long	RBLAFF3A,RBLAFF3B,0
RBLAFF4
	.long	RBLAFF4A,RBLAFF4B,0
RBLAFF5
	.long	RBLAFF5A,RBLAFF5B,0
RBLAFF6
	.long	RBLAFF6A,RBLAFF6B,0

RBDISPLAY1
	.long	RBDISPLAY1A,RBDISPLAY1B,0
RBDISPLAY2
	.long	RBDISPLAY2A,RBDISPLAY2B,0
RBDISPLAY3
	.long	RBDISPLAY3A,RBDISPLAY3B,RBDISPLAY3C,0


a_helecopter

j_copt1
	.long	COPTERA1
	.long	COPTERA2
	.long	COPTERA3
	.long	COPTERA4
	.long	COPTERA5
	.long	COPTERA6
	.long	COPTERA7
	.long	COPTERA8
	.long	ani_jump,j_copt1
	.long	0

j_copt2
	.long	COPTERB1
	.long	COPTERB2
	.long	COPTERB3
	.long	COPTERB4
	.long	COPTERB5
	.long	COPTERB6
	.long	COPTERB7
	.long	COPTERB8
	.long	ani_jump,j_copt2
	.long	0

j_copt3
	.long	COPTERC1
	.long	COPTERC2
	.long	COPTERC3
	.long	COPTERC4
	.long	COPTERC5
	.long	COPTERC6
	.long	COPTERC7
	.long	COPTERC8
	.long	ani_jump,j_copt3
	.long	0

COPTERA1	.long	HEADSPINBODY,HEADA1,0
COPTERA2	.long	HEADSPINBODY,HEADA2,0
COPTERA3	.long	HEADSPINBODY,HEADA3,0
COPTERA4	.long	HEADSPINBODY,HEADA4,0
COPTERA5	.long	HEADSPINBODY,HEADA5,0
COPTERA6	.long	HEADSPINBODY,HEADA6,0
COPTERA7	.long	HEADSPINBODY,HEADA7,0
COPTERA8	.long	HEADSPINBODY,HEADA8,0

COPTERB1	.long	HEADSPINBODY,HEADB1,0
COPTERB2	.long	HEADSPINBODY,HEADB2,0
COPTERB3	.long	HEADSPINBODY,HEADB3,0
COPTERB4	.long	HEADSPINBODY,HEADB4,0
COPTERB5	.long	HEADSPINBODY,HEADB5,0
COPTERB6	.long	HEADSPINBODY,HEADB6,0
COPTERB7	.long	HEADSPINBODY,HEADB7,0
COPTERB8	.long	HEADSPINBODY,HEADB8,0

COPTERC1	.long	HEADSPINBODY,HEADC1,0
COPTERC2	.long	HEADSPINBODY,HEADC2,0
COPTERC3	.long	HEADSPINBODY,HEADC3,0
COPTERC4	.long	HEADSPINBODY,HEADC4,0
COPTERC5	.long	HEADSPINBODY,HEADC5,0
COPTERC6	.long	HEADSPINBODY,HEADC6,0
COPTERC7	.long	HEADSPINBODY,HEADC7,0
COPTERC8	.long	HEADSPINBODY,HEADC8,0


a_earth
	.long	EARTH1
	.long	ani_swpal
	.long	EARTH2
	.long	0

;	.long	EARTH3
;	.long	0
;EARTH3	.long	EARTH3A,EARTH3B,0

EARTH1	.long	EARTH1A,0
EARTH2	.long	EARTH2A,0

;***************************************************************

a_arm_bomb
	.long	RBSHOLDER1
	.long	ani_sladd,ARM1
	.long	ani_slani_sleep,ARM1
	.long	ani_slani_sleep,ARM2
	.long	ani_slani_sleep,ARM3
	.long	ani_slani_sleep,ARM4
	.long	ani_slani_sleep,ARM5
	.long	ani_slani_sleep,ARM6
	.long	0
	.long	ani_slani_sleep,ARM7
	.long	ani_slani_sleep,ARM8
	.long	ani_slani_sleep,ARM9
	.long	ani_slani_sleep,ARM10
	.long	ani_slani_sleep,ARM11
	.long	0

ARM1	.long	SMMECARM1,0
ARM2	.long	SMMECARM2,0
ARM3	.long	SMMECARM3,0
ARM4	.long	SMMECARM4,0
ARM5	.long	SMMECARM5,0
ARM6	.long	SMMECARM6,0
ARM7	.long	SMMECARM7,0
ARM8	.long	SMMECARM8,0
ARM9	.long	SMMECARM9,0
ARM10	.long	SMMECARM10,0
ARM11	.long	SMMECARM11,0

;***************************************************************

;***************************************************************

a_jade_shook
	.long	ani_offset_xy
	.word	->83,->18
	.long	RBFLIPPED1
	.long	ani_offset_xy
	.word	->80,>0a 
	.long	RBSTUMBLE1
	.long	ani_offset_xy
	.word	->6d,>24
	.long	RBKNOCKDOWN2
	.long	ani_offset_xy
	.word	->80,>0a 
	.long	RBSTUMBLE1
	.long	ani_jump,a_jade_shook

;***************************************************************
;********************************************************************
a_back_break
	.long	RBBACKBREAK1
	.long	0
	
RBBACKBREAK1
	.long	RBBACKBREAK3A,RBBACKBREAK3B,0

;********************************************************************
a_baby
	.long	BABKETCH
	.long	0
	
;********************************************************************
a_big_head
	.long	BHROBO1
	.long	BHROBO2
	.long	BHROBO3
	.long	BHROBO4
	.long	BHROBO5
	.long	0

;********************************************************************
a_half_cutup
	.long	HALF_RBCUTUP1
	.long	0
	
HALF_RBCUTUP1
	.long	RBCUTUP1D,RBCUTUP1C,0
;********************************************************************
a_cutup
	.long	RBCUTUP1
	.long	0
	
RBCUTUP1
	.long	RBCUTUP1A,RBCUTUP1B,RBCUTUP1C,RBCUTUP1D,0
;********************************************************************
a_float
	.long	RBFLOAT	
	.long	0
	
RBFLOAT	
	.long	RBFLOATA,RBFLOATB,0
;********************************************************************
a_pounded
	.long	RBNAIL1
	.long	0

;********************************************************************
a_reach
	.long	ani_adjustxy
	.word	-9,4
	.long	RBMOUTH3
	.long	RBMOUTH4
	.long	RBMOUTH5
	.long	RBMOUTH6
	.long	RBMOUTH8
	.long	0

RBMOUTH3
	.long	RBMOUTH3A,RBMOUTH3B,RBMOUTH3C,RBSKELEG1A,RBSKELEG1B,0
RBMOUTH4
	.long	RBMOUTH4A,RBMOUTH4B,RBMOUTH4C,RBSKELEG1A,RBSKELEG1B,0
RBMOUTH5
	.long	RBMOUTH5A,RBMOUTH5B,RBMOUTH5C,RBSKELEG1A,RBSKELEG1B,0
RBMOUTH6
	.long	RBMOUTH6A,RBMOUTH6B,RBMOUTH6C,0
RBMOUTH8
	.long	RBMOUTH8A,0


ROBOBONE1
	.long	ROBOBONE1A,0
ROBOBONE2
	.long	ROBOBONE2A,0
ROBOBONE3
	.long	ROBOBONE3A,ROBOBONE3B,0
ROBOBONE4
	.long	ROBOBONE4A,ROBOBONE4B,ROBOBONE4C,0

;********************************************************************
a_skin_rip
	.long	RBRIP1
	.long	0
RBRIP1	.long	RBRIP1A,RBRIP1B,0
;********************************************************************
a_stretch
	.long	GROROBO2
	.long	GROROBO3
	.long	GROROBO4
	.long	GROROBO5
	.long	0
GROROBO2
	.long	GROROBO2A,GROROBO2B,GROROBO2C,0
GROROBO3
	.long	GROROBO3A,GROROBO3B,GROROBO3C,0
GROROBO4
	.long	GROROBO4A,GROROBO4B,GROROBO4C,0
GROROBO5
	.long	GROROBO5A,GROROBO5B,0
;********************************************************************
a_suk
	.long	SUKROB1
	.long	SUKROB3
	.long	SUKROB4
	.long	SUKROB5
	.long	SUKROB6
	.long	0

SUKROB1
	.long	SUKROB1A,SUKROB1B,SUKROB1C,0
SUKROB3
	.long	SUKROB3A,SUKROB3B,0
SUKROB4
	.long	SUKROB4A,0
SUKROB5
	.long	SUKROB5A,0
SUKROB6
	.long	SUKROB6A,0

;********************************************************************
a_shocked
	.long	RBBZZ1
	.long	RBBZZ2
	.long	RBBZZ3
	.long	RBBZZ4
	.long	0
RBBZZ1	.long	RBBUZZ1,0
RBBZZ2	.long	RBBUZZ2,0
RBBZZ3	.long	RBBUZZ3,0
RBBZZ4	.long	RBBUZZ4,0
;********************************************************************
a_shredded
	.long	ani_adjustxy
	.word	6,6
	.long	RBSTUMBLE1

	.long	ani_adjustxy
	.word	-6,-6
	.long	RBSTUMBLE2

	.long	ani_adjustxy
	.word	6,6
	.long	RBSTUMBLE3

	.long	ani_adjustxy
	.word	-6,-6
	.long	RBSTUMBLE2

	.long	ani_jump,a_shredded

a_4bar
	.long RBCRUSH4BAR
	.long 0

a_smbomb
	.long SMBOMB1A
	.long 0



a_shark
	.long	SHARK1
	.long	SHARK3
	.long	SHARK4
	.long	SHARK5
	.long	0

	.long	SHARK9
	.long	SHARK10
	.long	SHARK11
	.long	SHARK12
	.long	SHARK13
	.long	0

	.long	SHARK14
	.long	SHARK15
	.long	SHARK16
	.long	SHARK17
	.long	SHARK19
	.long	0

SHARK1
	.long	SHARK1A,SHARK1B,0
SHARK3
	.long	SHARK3A,SHARK3B,0
SHARK4
	.long	SHARK4A,SHARK4B,0
SHARK5
	.long	SHARK5A,SHARK5B,0
SHARK9
	.long	SHARK9A,SHARK9B,0

SHARK10
	.long	SHARK10A,SHARK10B,SHARK10C,0
SHARK11
	.long	SHARK11A,SHARK11B,SHARK11C,SHARK11D
	.long	0
SHARK12
	.long	SHARK12A,SHARK12B,SHARK12C,SHARK12D
	.long	SHARK12E,0
SHARK13
	.long	SHARK13A,SHARK13B,SHARK13C,SHARK13D
	.long	SHARK13E,SHARK13F,SHARK13G,0
SHARK14
	.long	SHARK14A,SHARK14B,SHARK14C,SHARK14D
	.long	0
SHARK15
	.long	SHARK15A,SHARK15B,0
SHARK16
	.long	SHARK16A,0
SHARK17
	.long	SHARK17A,SHARK17B,0
SHARK19
	.long	SHARK19A,0

a_shark_fin
	.long	SHARKFIN,0

SHARKFIN
	.long	SHARKFINA,SHARKFINB,SHARKFINC,SHARKFIND
	.long	0

a_bat
	.long	BAT1
	.long	BAT3
	.long	BAT4
	.long	BAT5
	.long	BAT6
	.long	0

	.long	BAT7
j_bat	.long	BAT8
	.long	BAT9
	.long	BAT10
	.long	BAT11
	.long	BAT12
	.long	BAT13
	.long	ani_jump,j_bat
	.long	0

BAT1	.long	BAT1A,BAT1B,0
BAT3	.long	BAT3A,BAT3B,0
BAT4	.long	BAT4A,BAT4B,0
BAT5	.long	BAT5A,BAT5B,0
BAT6	.long	BAT6A,BAT6B,0
BAT7	.long	BAT7A,BAT7B,0
BAT8	.long	BAT8A,BAT8B,0
BAT9	.long	BAT9A,BAT9B,0
BAT10	.long	BAT10A,BAT10B,0
BAT11	.long	BAT11A,BAT11B,0
BAT12	.long	BAT12A,BAT12B,0
BAT13	.long	BAT13A,BAT13B,0

a_robo1_friend
	.long	RBHAMMER2
	.long	RBHAMMER3
	.long	RBHAMMER4
	.long	RBHAMMER5
	.long	RBHAMMER6
	.long	0

RBHAMMER2
	.long	RBHAMMER2A,RBHAMMER2B,0
RBHAMMER3
	.long	RBHAMMER3A,RBHAMMER3B,RBHAMMER3C,0
RBHAMMER4
	.long	RBHAMMER4A,RBHAMMER4B,0
RBHAMMER5
	.long	RBHAMMER5A,RBHAMMER5B,RBHAMMER5C,0
RBHAMMER6
	.long	RBHAMMER6A,RBHAMMER6B,0

a_dinger
	.long	RBDINGER1
	.long	RBDINGER2
	.long	RBDINGER3
	.long	RBDINGER4
	.long	RBDINGER5
	.long	RBDINGER6
	.long	RBDINGER7
	.long	RBDINGER8
	.long	RBDINGER9
	.long	RBDINGER10
	.long	RBDINGER11
	.long	RBDINGER12
	.long	0

	.long	RBDINGER13
	.long	RBDINGER14
	.long	RBDINGER15
	.long	0

RBDINGER1
	.long	RBDINGER1A,0
RBDINGER2
	.long	RBDINGER2A,0
RBDINGER3
	.long	RBDINGER3A,0
RBDINGER4
	.long	RBDINGER4A,0
RBDINGER5
	.long	RBDINGER5A,0
RBDINGER6
	.long	RBDINGER6A,0
RBDINGER7
	.long	RBDINGER7A,0
RBDINGER8
	.long	RBDINGER8A,0
RBDINGER9
	.long	RBDINGER9A,0
RBDINGER10
	.long	RBDINGER10A,0
RBDINGER11
	.long	RBDINGER11A,0
RBDINGER12
	.long	RBDINGER12A,0
RBDINGER13
	.long	RBDINGER13A,0
RBDINGER14
	.long	RBDINGER14A,0
RBDINGER15
	.long	RBDINGER15A,0

;**********************************************************************

a_robo2_friend
	.long	RBCHACHA1
	.long	RBCHACHA2
	.long	RBCHACHA3
	.long	RBCHACHA4
	.long	RBCHACHA5
	.long	RBCHACHA4
	.long	RBCHACHA3
	.long	RBCHACHA2
	.long	ani_jump,a_robo2_friend

RBCHACHA1
	.long	RBCHACHA1A,RBCHACHA1B,0
RBCHACHA2
	.long	RBCHACHA2A,RBCHACHA2B,0
RBCHACHA3
	.long	RBCHACHA3A,RBCHACHA3B,0
RBCHACHA4
	.long	RBCHACHA4A,RBCHACHA4B,0
RBCHACHA5
	.long	RBCHACHA5A,RBCHACHA5B,0


;***************************************************************
a_bull
	.long	BULL1
	.long	BULL3
	.long	BULL4
	.long	BULL5
	.long	BULL6
	.long	0

j_bull	.long	BULL7
	.long	BULL8
	.long	BULL9
	.long	BULL10
	.long	BULL11
	.long	BULL12
	.long	BULL13
	.long	ani_jump,j_bull

BULL1	.long	BULL1A,BULL1B,0
BULL3	.long	BULL3A,BULL3B,BULL3C,0
BULL4	.long	BULL4A,BULL4B,BULL4C,0
BULL5	.long	BULL5A,BULL5B,BULL5C,0
BULL6	.long	BULL6A,BULL6B,BULL6C,0
BULL7	.long	BULL7A,BULL7B,0
BULL8	.long	BULL8A,BULL8B,BULL8C,0
BULL9	.long	BULL9A,BULL9B,BULL9C,BULL9D,0
BULL10	.long	BULL10A,BULL10B,BULL10C,0
BULL11	.long	BULL11A,BULL11B,BULL11C,BULL11D,0
BULL12	.long	BULL12A,BULL12B,BULL12C,BULL12D,0
BULL13	.long	BULL13A,BULL13B,BULL13C,0

;***************************************************************
a_smoke_friend
	.long	ani_sladd,HORN1
	.long	ani_slani_sleep,HORN1
	.long	ani_slani_sleep,HORN2
	.long	ani_slani_sleep,HORN3
	.long	0

	.long	ani_slani_sleep,HORN4
	.long	ani_slani_sleep,HORN5
	.long	ani_slani_sleep,HORN4
	.long	ani_slani_sleep,HORN5
	.long	ani_slani_sleep,HORN4
	.long	ani_slani_sleep,HORN5
	.long	ani_slani_sleep,HORN4
	.long	ani_slani_sleep,HORN5
	.long	ani_slani_sleep,HORN4
	.long	ani_slani_sleep,HORN5
	.long	ani_slani_sleep,HORN3
	.long	0

	.long	ani_slani_sleep,HORN2
	.long	ani_slani_sleep,HORN1
	.long	0


HORN1	.long	BIGHORN1,0
HORN2	.long	BIGHORN2,0
HORN3	.long	BIGHORN3,0
HORN4	.long	BIGHORN4,0
HORN5	.long	BIGHORN5,0


	.end

