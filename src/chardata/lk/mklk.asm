**************************************************************************
*											     *
*  mk3 - Liu Kang										*
*											     *
**************************************************************************
	.FILE	'mklk.asm'
	.WIDTH	132
	.OPTION	B,D,L,T
	.MNOLIST

	.include mainequ.asm
	.include imgtbl.glo
	.include sysequ.asm
	.include mklk.tbl
	.include mklk2.tbl
	.text


lk_anitab1
	.long	a_stance	;  0 - stance
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
	.long	a_zap		; 24 - 
	.long	a_dizzy		; 25 -
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


lk_anitab2
	.long	a_zap_lo	; 0
	.long	a_zap_air	; 1
	.long	a_bike_kick	; 2
	.long	a_super_kang	; 3
	.long	a_dummy		; 4
	.long	a_kang_fire	; 5
	.long	a_reform	; 6
	.long	0			;
	.long	0
	.long	0
	.long	MK1GAME		; a

a_dummy
a_stance
	.long	LUSTANCE1
	.long	LUSTANCE2
	.long	LUSTANCE3
	.long	LUSTANCE4
	.long	LUSTANCE5
	.long	LUSTANCE6
	.long	LUSTANCE7
	.long	LUSTANCE8
	.long	LUSTANCE9
	.long	LUSTANCE8
	.long	LUSTANCE7
	.long	LUSTANCE6
	.long	LUSTANCE5
	.long	LUSTANCE4
	.long	LUSTANCE3
	.long	LUSTANCE2
	.long	ani_jump,a_stance

LUSTANCE1
	.long	LUSTANCE1A,LUSTANCE1B,0
LUSTANCE2
	.long	LUSTANCE2A,LUSTANCE2B,0
LUSTANCE3
	.long	LUSTANCE3A,LUSTANCE3B,0
LUSTANCE4
	.long	LUSTANCE4A,LUSTANCE4B,0
LUSTANCE5
	.long	LUSTANCE5A,LUSTANCE5B,0
LUSTANCE6
	.long	LUSTANCE6A,LUSTANCE6B,0
LUSTANCE7
	.long	LUSTANCE7A,LUSTANCE7B,0
LUSTANCE8
	.long	LUSTANCE8A,LUSTANCE8B,0
LUSTANCE9
	.long	LUSTANCE9A,LUSTANCE9B,0

a_turn
	.long	LUTURN1
	.long	LUTURN2
	.long	ani_flip
	.long	LUTURN1
	.long	0

LUTURN1	.long	LUTURN1A,LUTURN1B,0
LUTURN2	.long	LUTURN2A,LUTURN2B,0



a_walkf
	.long	LUWALK1
	.long	LUWALK2
	.long	LUWALK3
	.long	LUWALK4
	.long	LUWALK5
	.long	LUWALK6
	.long	LUWALK7
	.long	LUWALK8
	.long	ani_jump,a_walkf


a_walkb
	.long	LUWALK8
	.long	LUWALK7
	.long	LUWALK6
	.long	LUWALK5
	.long	LUWALK4
	.long	LUWALK3
	.long	LUWALK2
	.long	LUWALK1
	.long	ani_jump,a_walkb


LUWALK1	.long	LUWALKTORSO1A,LUWALKLEG1A,LUWALKLEG1B,0
LUWALK2	.long	LUWALKTORSO2A,LUWALKLEG2A,LUWALKLEG2B,0
LUWALK3	.long	LUWALKTORSO3A,LUWALKLEG3A,0
LUWALK4	.long	LUWALKTORSO4A,LUWALKLEG4A,0
LUWALK5	.long	LUWALKTORSO5A,LUWALKLEG5A,0
LUWALK6	.long	LUWALKTORSO6A,LUWALKLEG6A,0
LUWALK7	.long	LUWALKTORSO7A,LUWALKLEG7A,LUWALKLEG7B,0
LUWALK8	.long	LUWALKTORSO8A,LUWALKLEG8A,LUWALKLEG8B,0

a_duck
	.long	LUDUCK1
	.long	LUDUCK2
	.long	LUDUCK3
	.long	0

LUDUCK1	.long	LUDUCK1A,LUDUCK1B,0
LUDUCK2	.long	LUDUCK2A,LUDUCK2B,0
LUDUCK3	.long	LUDUCK3A,LUDUCK3B,0



a_duck_block
	.long	LUDUCKBLOCK1
	.long	LUDUCKBLOCK2
	.long	LUDUCKBLOCK3
	.long	0

LUDUCKBLOCK1
	.long	LUDUCKBLOCK1A,LUDUCKBLOCK1B,0
LUDUCKBLOCK2
	.long	LUDUCKBLOCK2A,LUDUCKBLOCK2B,0
LUDUCKBLOCK3
	.long	LUDUCKBLOCK3A,LUDUCKBLOCK3B,0


a_duck_hit
	.long	LUDUCKHIT2
	.long	LUDUCKHIT3
	.long	LUDUCKHIT2
	.long	LUDUCKHIT1
	.long	0

LUDUCKHIT1
	.long	LUDUCKHIT1A,LUDUCKHIT1B,0
LUDUCKHIT2
	.long	LUDUCKHIT2A,LUDUCKHIT2B,0
LUDUCKHIT3
	.long	LUDUCKHIT3A,LUDUCKHIT3B,0




a_duck_turn
	.long	LUDUCKTURN1
	.long	LUDUCKTURN2
	.long	ani_flip
	.long	LUDUCKTURN2
	.long	LUDUCKTURN1
	.long	LUDUCK3
	.long	0

LUDUCKTURN1
	.long	LUDUCKTURN1A,LUDUCKTURN1B,0
LUDUCKTURN2
	.long	LUDUCKTURN2A,LUDUCKTURN2B,0


a_duck_punch
	.long	LUDUCKPUNCH1
	.long	LUDUCKPUNCH2
	.long	LUDUCKPUNCH3
	.long	0
	.long	LUDUCKPUNCH2
	.long	LUDUCKPUNCH1
	.long	LUDUCK3
	.long	0

LUDUCKPUNCH1
	.long	LUDUCKPUNCH1A,LUDUCKPUNCH1B,0
LUDUCKPUNCH2
	.long	LUDUCKPUNCH2A,LUDUCKPUNCH2B,0
LUDUCKPUNCH3
	.long	LUDUCKPUNCH3A,LUDUCKPUNCH3B,0


a_duck_kick_lo
	.long	LUDUCKLOKICK1
	.long	LUDUCKLOKICK2
	.long	LUDUCKLOKICK3
	.long	0
	.long	LUDUCKLOKICK2
	.long	LUDUCKLOKICK1
	.long	LUDUCK3
	.long	0

LUDUCKLOKICK1
	.long	LUDUCKLOKICK1A,LUDUCKLOKICK1B,0
LUDUCKLOKICK2
	.long	LUDUCKLOKICK2A,LUDUCKLOKICK2B,0
LUDUCKLOKICK3
	.long	LUDUCKLOKICK3A,LUDUCKLOKICK3B,0


a_duck_kick_hi
	.long	LUDUCKLOKICK1
	.long	LUDUCKHIKICK1
	.long	LUDUCKHIKICK2
	.long	LUDUCKHIKICK3
	.long	0
	.long	LUDUCKHIKICK2
	.long	LUDUCKHIKICK1
	.long	LUDUCKLOKICK1
	.long	LUDUCK3
	.long	0


LUDUCKHIKICK1
	.long	LUDUCKHIKICK1A,LUDUCKHIKICK1B,LUDUCKHIKICK1C,0
LUDUCKHIKICK2
	.long	LUDUCKHIKICK2A,LUDUCKHIKICK2B,0
LUDUCKHIKICK3
	.long	LUDUCKHIKICK3A,LUDUCKHIKICK3B,0




a_uppercut
	.long	LUUPPERCUT2
	.long	LUUPPERCUT3
	.long	LUUPPERCUT4
	.long	LUUPPERCUT5
;	.long	LUUPPERCUT6
	.long	ani_nosleep	; dont sleep after next frame
	.long	LUUPPERCUT7
	.long	0
	.long	LUHIPUNCH1
	.long	0

LUUPPERCUT1
	.long	LUUPPERCUT1A,LUUPPERCUT1B,0
LUUPPERCUT2
	.long	LUUPPERCUT2A,LUUPPERCUT2B,0
LUUPPERCUT3
	.long	LUUPPERCUT3A,LUUPPERCUT3B,0
LUUPPERCUT4
	.long	LUUPPERCUT4A,LUUPPERCUT4B,0
LUUPPERCUT5
	.long	LUUPPERCUT5A,LUUPPERCUT5B,0
LUUPPERCUT6
	.long	LUUPPERCUT6A,LUUPPERCUT6B,0
LUUPPERCUT7
	.long	LUUPPERCUT7A,LUUPPERCUT7B,0



a_hipunch
	.long	LUHIPUNCH1
	.long	LUHIPUNCH2
	.long	LUHIPUNCH3
	.long	0

	.long	LUHIPUNCH4
	.long	LUHIPUNCH5
	.long	LUHIPUNCH6
	.long	0

	.long	LUHIPUNCH5
	.long	LUHIPUNCH4
	.long	ani_jump,a_hipunch+(32*2)
	.long	0					; we NEED this "0"
*
* Unhipunch #1
*
	.long	LUHIPUNCH2
	.long	LUHIPUNCH1
	.long	0
*
* Unhipunch #2
*
	.long	LULOPUNCH7
	.long	0
*
* Hi to Med #1
*
	.long	LUHIPUNCH4
	.long	LULOPUNCH5
	.long	ani_jump,a_lopunch+(32*6)
	.long	0
*
* Hi to Med #2
*
	.long	LUHIPUNCH5
	.long	LULOPUNCH2
	.long	ani_jump,a_lopunch+(32*2)
	.long	0


a_lopunch
	.long	LULOPUNCH1
	.long	LULOPUNCH2
	.long	LULOPUNCH3
	.long	0

	.long	LULOPUNCH4
	.long	LULOPUNCH5
	.long	LULOPUNCH6
	.long	0

	.long	LULOPUNCH5
	.long	LULOPUNCH4
	.long	ani_jump,a_lopunch+(32*2)
	.long	0
*
* Unlopunch #1
*
	.long	LULOPUNCH2
	.long	LULOPUNCH1
	.long	0
*
* Unlopunch #2
*
	.long	LULOPUNCH7
	.long	0
*
* Med to High #1
*
	.long	LULOPUNCH4
	.long	LULOPUNCH5
	.long	ani_jump,a_hipunch+(32*6)
	.long	0
*
* Med to High #2
*
	.long	LULOPUNCH4
	.long	LUHIPUNCH5
	.long	ani_jump,a_hipunch+(32*2)

LUHIPUNCH1
	.long	LUHIPUNCH1A,LUHIPUNCH1B,0
LUHIPUNCH2
	.long	LUHIPUNCH2A,LUHIPUNCH2B,0
LUHIPUNCH3
	.long	LUHIPUNCH3A,LUHIPUNCH3B,0
LUHIPUNCH4
	.long	LUHIPUNCH4A,LUHIPUNCH4B,0
LUHIPUNCH5
	.long	LUHIPUNCH5A,LUHIPUNCH5B,0
LUHIPUNCH6
	.long	LUHIPUNCH6A,LUHIPUNCH6B,0
LULOPUNCH1
	.long	LULOPUNCH1A,LULOPUNCH1B,0
LULOPUNCH2
	.long	LULOPUNCH2A,LULOPUNCH2B,0
LULOPUNCH3
	.long	LULOPUNCH3A,LULOPUNCH3B,0
LULOPUNCH4
	.long	LULOPUNCH4A,LULOPUNCH4B,0
LULOPUNCH5
	.long	LULOPUNCH5A,LULOPUNCH5B,0
LULOPUNCH6
	.long	LULOPUNCH6A,LULOPUNCH6B,0
LULOPUNCH7
	.long	LULOPUNCH7A,LULOPUNCH7B,0



a_block
	.long	LUHIBLOCK1
	.long	LUHIBLOCK2
	.long	LUHIBLOCK3
	.long	0

LUHIBLOCK1
	.long	LUHIBLOCK1A,LUHIBLOCK1B,0
LUHIBLOCK2
	.long	LUHIBLOCK2A,LUHIBLOCK2B,0
LUHIBLOCK3
	.long	LUHIBLOCK3A,LUHIBLOCK3B,0

a_elbow
	.long	ani_adjustx
	.word	5
	.long	LUCOMBO1
	.long	ani_adjustx
	.word	5
	.long	LUCOMBO2
	.long	LUCOMBO3
	.long	0

j_lkunelbow
	.long	LUCOMBO2
	.long	LUCOMBO1
	.long	0

	.long	ani_adjustx
	.word	12
	.long	LUCOMBO4
	.long	ani_adjustx
	.word	12
	.long	LUCOMBO5
	.long	LUCOMBO6
	.long	0

	.long	ani_adjustx
	.word	10
	.long	LUCOMBO7
	.long	ani_adjustx
	.word	10
	.long	LUCOMBO8
	.long	0
	.long	ani_jump,j_lkunelbow


LUCOMBO1
	.long	LUCOMBO1A,LUCOMBO1B,0
LUCOMBO2
	.long	LUCOMBO2A,LUCOMBO2B,0
LUCOMBO3
	.long	LUCOMBO3A,LUCOMBO3B,0
LUCOMBO4
	.long	LUCOMBO4A,LUCOMBO4B,0
LUCOMBO5
	.long	LUCOMBO5A,LUCOMBO5B,0
LUCOMBO6
	.long	LUCOMBO6A,LUCOMBO6B,0
LUCOMBO7
	.long	LUCOMBO7A,LUCOMBO7B,0
LUCOMBO8
	.long	LUCOMBO8A,LUCOMBO8B,0

a_hikick
	.long	LUHIKICK1
	.long	LUHIKICK2
	.long	LUHIKICK3
	.long	LUHIKICK4
	.long	LUHIKICK5
	.long	LUHIKICK6
	.long	0
	.long	LUHIKICK5
	.long	LUHIKICK4
	.long	LUHIKICK3
	.long	LUHIKICK2
	.long	LUHIKICK1
	.long	0

LUHIKICK1
	.long	LUHIKICK1A,LUHIKICK1B,0
LUHIKICK2
	.long	LUHIKICK2A,LUHIKICK2B,0
LUHIKICK3
	.long	LUHIKICK3A,LUHIKICK3B,0
LUHIKICK4
	.long	LUHIKICK4A,0
LUHIKICK5
	.long	LUHIKICK5A,0
LUHIKICK6
	.long	LUHIKICK6A,LUHIKICK6B,0

a_lokick
	.long	LUHIKICK1
	.long	LUHIKICK2
	.long	LUHIKICK3
	.long	LUHIKICK4
	.long	LULOKICK1
	.long	LULOKICK2
	.long	0
	.long	LULOKICK1
	.long	LUHIKICK4
	.long	LUHIKICK3
	.long	LUHIKICK2
	.long	LUHIKICK1
	.long	0

LULOKICK1
	.long	LULOKICK1A,0
LULOKICK2
	.long	LULOKICK2A,0

a_knee
	.long	LUKNEECOMBO1
	.long	LUKNEECOMBO2
	.long	LUKNEECOMBO3
	.long	0

	.long	LUKNEECOMBO2
	.long	LUKNEECOMBO1
	.long	0

	.long	LUKNEECOMBO4
	.long	LUKNEECOMBO5	; ani 3 = knee 2
	.long	0

	.long	LUKNEECOMBO6
	.long	ani_adjustx
	.word	8
	.long	LUKNEECOMBO7
	.long	ani_adjustx
	.word	8
	.long	LUKNEECOMBO8	; ani 4
	.long	0

	.long	LUKNEECOMBO9
	.long	ani_adjustx
	.word	8
	.long	LUKNEECOMBO10
	.long	ani_adjustx
	.word	8
	.long	LUKNEECOMBO11	; ani 5
	.long	0

	.long	LUKNEECOMBO12
	.long	0

LUKNEECOMBO1
	.long	LUKNEECOMBO1A,LUKNEECOMBO1B,0
LUKNEECOMBO2
	.long	LUKNEECOMBO2A,0
LUKNEECOMBO3
	.long	LUKNEECOMBO3A,0
LUKNEECOMBO4
	.long	LUKNEECOMBO4A,LUKNEECOMBO4B,0
LUKNEECOMBO5
	.long	LUKNEECOMBO5A,LUKNEECOMBO5B,0
LUKNEECOMBO6
	.long	LUKNEECOMBO6A,LUKNEECOMBO6B,0
LUKNEECOMBO7
	.long	LUKNEECOMBO7A,LUKNEECOMBO7B,0
LUKNEECOMBO8
	.long	LUKNEECOMBO8A,0
LUKNEECOMBO9
	.long	LUKNEECOMBO9A,0
LUKNEECOMBO10
	.long	LUKNEECOMBO10A,LUKNEECOMBO10B,0
LUKNEECOMBO11
	.long	LUKNEECOMBO11A,LUKNEECOMBO11B,0
LUKNEECOMBO12
	.long	LUKNEECOMBO12A,0

a_sweep_kick
	.long	LUSWEEPKICK1
	.long	LUSWEEPKICK2
	.long	LUSWEEPKICK3
	.long	ani_calla,sweep_sounds
	.long	LUSWEEPKICK4
	.long	LUSWEEPKICK5
	.long	0
	.long	LUSWEEPKICK6
	.long	LUSWEEPKICK7
	.long	LUSWEEPKICK8
	.long	0

LUSWEEPKICK1
	.long	LUSWEEPKICK1A,LUSWEEPKICK1B,0
LUSWEEPKICK2
	.long	LUSWEEPKICK2A,0
LUSWEEPKICK3
	.long	LUSWEEPKICK3A,0
LUSWEEPKICK4
	.long	LUSWEEPKICK4A,0
LUSWEEPKICK5
	.long	LUSWEEPKICK5A,LUSWEEPKICK5B,0
LUSWEEPKICK6
	.long	LUSWEEPKICK6A,LUSWEEPKICK6B,0
LUSWEEPKICK7
	.long	LUSWEEPKICK7A,0
LUSWEEPKICK8
	.long	LUSWEEPKICK8A,0

a_roundhouse
	.long	LUSPINHOOK1
	.long	LUSPINHOOK2
	.long	LUSPINHOOK3
	.long	LUSPINHOOK4
	.long	ani_nosleep
	.long	LUSPINHOOK5
	.long	0

	.long	LUSPINHOOK6
	.long	LUSPINHOOK7
	.long	LUSPINHOOK8
	.long	0

LUSPINHOOK1
	.long	LUSPINHOOK1A,LUSPINHOOK1B,0
LUSPINHOOK2
	.long	LUSPINHOOK2A,LUSPINHOOK2B,0
LUSPINHOOK3
	.long	LUSPINHOOK3A,0
LUSPINHOOK4
	.long	LUSPINHOOK4A,LUSPINHOOK4B,0
LUSPINHOOK5
	.long	LUSPINHOOK5A,LUSPINHOOK5B,0
LUSPINHOOK6
	.long	LUSPINHOOK6A,LUSPINHOOK6B,0
LUSPINHOOK7
	.long	LUSPINHOOK7A,0
LUSPINHOOK8
	.long	LUSPINHOOK8A,LUSPINHOOK8B,0

a_jump	.long	LUJUMP1
	.long	LUJUMP2
	.long	LUJUMP3
	.long	0

LUJUMP1	.long	LUJUMP1A,LUJUMP1B,0
LUJUMP2	.long	LUJUMP2A,LUJUMP2B,0
LUJUMP3	.long	LUJUMP3A,LUJUMP3B,0


a_jump_kick
	.long	LUJUMPKICK1
	.long	LUJUMPKICK2
	.long	LUJUMPKICK3
	.long	0
	.long	LUJUMPKICK2
	.long	LUJUMPKICK1
	.long	0


LUJUMPKICK1
	.long	LUJUMPKICK1A,0
LUJUMPKICK2
	.long	LUJUMPKICK2A,LUJUMPKICK2B,0
LUJUMPKICK3
	.long	LUJUMPKICK3A,LUJUMPKICK3B,0

a_fflip
	.long	LUFLIP1
	.long	LUFLIP2
	.long	LUFLIP3
	.long	LUFLIP4
	.long	LUFLIP5
	.long	LUFLIP6
	.long	LUFLIP7
	.long	LUFLIP8
	.long	ani_jump,a_fflip+32

a_bflip
	.long	LUFLIP1
	.long	LUFLIP8
	.long	LUFLIP7
	.long	LUFLIP6
	.long	LUFLIP5
	.long	LUFLIP4
	.long	LUFLIP3
	.long	LUFLIP2
	.long	ani_jump,a_bflip+32


LUFLIP1
	.long	LUFLIP1A,0
LUFLIP2
	.long	LUFLIP2A,0
LUFLIP3
	.long	LUFLIP3A,0
LUFLIP4
	.long	LUFLIP4A,0
LUFLIP5
	.long	LUFLIP5A,0
LUFLIP6
	.long	LUFLIP6A,0
LUFLIP7
	.long	LUFLIP7A,0
LUFLIP8
	.long	LUFLIP8A,0


a_super_kang
	.long	LUFLIPKICK1
	.long	LUFLIPKICK2
	.long	LUFLYKICK1
	.long	0
	.long	ani_jump,j_flyk

a_flip_kick
	.long	LUFLIPKICK1
	.long	LUFLIPKICK2
	.long	LUFLIPKICK3
	.long	0
j_flyk	.long	LUFLIPKICK2
	.long	LUFLIPKICK1
	.long	0


LUFLYKICK1
	.long	LUFLYKICK1A,0

LUFLIPKICK1
	.long	LUFLIPKICK1A,0
LUFLIPKICK2
	.long	LUFLIPKICK2A,LUFLIPKICK2B,0
LUFLIPKICK3
	.long	LUFLIPKICK3A,0

a_flip_punch
	.long	LUFLIPUNCH4
	.long	LUFLIPUNCH5
	.long	LUFLIPUNCH6
	.long	0
	.long	LUFLIPUNCH5
	.long	LUFLIPUNCH4
	.long	0

LUFLIPUNCH4
	.long	LUFLIPUNCH4A,0
LUFLIPUNCH5
	.long	LUFLIPUNCH5A,LUFLIPUNCH5B,LUFLIPUNCH5C,0
LUFLIPUNCH6
	.long	LUFLIPUNCH6A,LUFLIPUNCH6B,LUFLIPUNCH6C,0


a_hit_hi
	.long	LUHIHIT2
	.long	LUHIHIT3
	.long	LUHIHIT2
	.long	LUHIHIT1
	.long	0

LUHIHIT1	.long	LUHIHIT1A,LUHIHIT1B,0
LUHIHIT2	.long	LUHIHIT2A,LUHIHIT2B,0
LUHIHIT3	.long	LUHIHIT3A,LUHIHIT3B,0



a_hit_lo
	.long	LULOHIT2
	.long	LULOHIT3
	.long	LULOHIT2
	.long	LULOHIT1
	.long	0

LULOHIT1	.long	LULOHIT1A,LULOHIT1B,0
LULOHIT2	.long	LULOHIT2A,LULOHIT2B,0
LULOHIT3	.long	LULOHIT3A,LULOHIT3B,0



a_stumble
	.long	LUSTUMBLE1
	.long	LUSTUMBLE2
	.long	LUSTUMBLE3
	.long	LUSTUMBLE4
	.long	LUSTUMBLE5
	.long	LUSTUMBLE6
	.long	LUSTUMBLE7
	.long	0

j_stumble
	.long	LUSTUMBLE1
	.long	LUSTUMBLE2
	.long	LUSTUMBLE3
	.long	LUSTUMBLE4
	.long	LUSTUMBLE5
	.long	LUSTUMBLE6
	.long	LUSTUMBLE7
	.long	ani_jump,j_stumble

LUSTUMBLE1
	.long	LUSTUMBLE1A,LUSTUMBLE1B,0
LUSTUMBLE2
	.long	LUSTUMBLE2A,LUSTUMBLE2B,0
LUSTUMBLE3
	.long	LUSTUMBLE3A,LUSTUMBLE3B,0
LUSTUMBLE4
	.long	LUSTUMBLE4A,LUSTUMBLE4B,0
LUSTUMBLE5
	.long	LUSTUMBLE5A,LUSTUMBLE5B,0
LUSTUMBLE6
	.long	LUSTUMBLE6A,LUSTUMBLE6B,0
LUSTUMBLE7
	.long	LUSTUMBLE7A,LUSTUMBLE7B,0


a_dizzy
	.long	LUSTUNNED1
	.long	LUSTUNNED2
	.long	LUSTUNNED3
	.long	LUSTUNNED4
	.long	LUSTUNNED5
	.long	LUSTUNNED6
	.long	LUSTUNNED7
	.long	LUSTUNNED8
	.long	LUSTUNNED9
	.long	ani_jump,a_dizzy

LUSTUNNED1
	.long	LUSTUNNED1A,LUSTUNNED1B,0
LUSTUNNED2
	.long	LUSTUNNED2A,LUSTUNNED2B,0
LUSTUNNED3
	.long	LUSTUNNED3A,LUSTUNNED3B,0
LUSTUNNED4
	.long	LUSTUNNED4A,LUSTUNNED4B,0
LUSTUNNED5
	.long	LUSTUNNED5A,LUSTUNNED5B,0
LUSTUNNED6
	.long	LUSTUNNED6A,LUSTUNNED6B,0
LUSTUNNED7
	.long	LUSTUNNED7A,LUSTUNNED7B,0
LUSTUNNED8
	.long	LUSTUNNED8A,LUSTUNNED8B,0
LUSTUNNED9
	.long	LUSTUNNED9A,LUSTUNNED9B,0

a_knockdown
	.long	LUKNOCKDOWN1
	.long	LUKNOCKDOWN2
	.long	LUKNOCKDOWN3
	.long	LUKNOCKDOWN4
	.long	LUKNOCKDOWN5
	.long	LUKNOCKDOWN6
	.long	0
	.long	LUKNOCKDOWN7
	.long	LUKNOCKDOWN8
	.long	0

LUKNOCKDOWN1
	.long	LUKNOCKDOWN1A,0
LUKNOCKDOWN2
	.long	LUKNOCKDOWN2A,0
LUKNOCKDOWN3
	.long	LUKNOCKDOWN3A,0
LUKNOCKDOWN4
	.long	LUKNOCKDOWN4A,0
LUKNOCKDOWN5
	.long	LUKNOCKDOWN5A,0
LUKNOCKDOWN6
	.long	LUKNOCKDOWN6A,0
LUKNOCKDOWN7
	.long	LUKNOCKDOWN7A,LUKNOCKDOWN7B,0
LUKNOCKDOWN8
	.long	LUKNOCKDOWN8A,0

a_getup
	.long	LUGETUP1
	.long	LUGETUP2
	.long	LUGETUP3
	.long	LUGETUP4
	.long	LUGETUP5
	.long	LUGETUP6
	.long	0

LUGETUP1
	.long	LUGETUP1A,0
LUGETUP2
	.long	LUGETUP2A,0
LUGETUP3
	.long	LUGETUP3A,0
LUGETUP4
	.long	LUGETUP4A,LUGETUP4B,0
LUGETUP5
	.long	LUGETUP5A,0
LUGETUP6
	.long	LUGETUP6A,LUGETUP6B,0

a_sweep_fall
	.long	LUSWEEPFALL1
	.long	LUSWEEPFALL2
	.long	LUSWEEPFALL3
	.long	LUSWEEPFALL4
	.long	LUSWEEPFALL5
	.long	0
	.long	LUSWEEPFALL6
	.long	LUSWEEPFALL7
	.long	0

LUSWEEPFALL1
	.long	LUSWEEPFALL1A,LUSWEEPFALL1B,0
LUSWEEPFALL2
	.long	LUSWEEPFALL2A,LUSWEEPFALL2B,0
LUSWEEPFALL3
	.long	LUSWEEPFALL3A,0
LUSWEEPFALL4
	.long	LUSWEEPFALL4A,0
LUSWEEPFALL5
	.long	LUSWEEPFALL5A,0
LUSWEEPFALL6
	.long	LUSWEEPFALL6A,0
LUSWEEPFALL7
	.long	LUSWEEPFALL7A,LUSWEEPFALL7B,0

a_sweepup
	.long	LUSWEEPUP1
	.long	LUSWEEPUP2
	.long	LUSWEEPUP3
	.long	LUSWEEPUP4
	.long	LUSWEEPUP5
	.long	LUSWEEPUP6
	.long	0

LUSWEEPUP1
	.long	LUSWEEPUP1A,0
LUSWEEPUP2
	.long	LUSWEEPUP2A,0
LUSWEEPUP3
	.long	LUSWEEPUP3A,0
LUSWEEPUP4
	.long	LUSWEEPUP4A,LUSWEEPUP4B,0
LUSWEEPUP5
	.long	LUSWEEPUP5A,LUSWEEPUP5B,0
LUSWEEPUP6
	.long	LUSWEEPUP6A,LUSWEEPUP6B,0



a_afb_kano
	.long	ani_offset_xy
	.word	->40,->1b
	.long	LUFLIPPED1

	.long	ani_offset_xy
	.word	->39,>05
	.long	LUKNOCKDOWN4

	.long	ani_offset_xy
 	.word	->59,>22
	.long	LUKNOCKDOWN5
	.long	0
*
* fall down solo
*
	.long	LUKNOCKDOWN5
	.long	LUKNOCKDOWN6
	.long	LUKNOCKDOWN7
	.long	0

a_fb_smoke
a_afb_robo2
	.long	ani_offset_xy
	.word	->25,->26
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	>01,->3b
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>30,->3e
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>4b,->1e
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>58,->03
	.long	LUKNOCKDOWN6
	.long	ani_offset_xy
	.word	>62,>1a
	.long	LUKNOCKDOWN6
	.long	0

a_fb_mileena
	.long	ani_offset_xy
	.word	->3a,->01
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->29,>07
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->1e,>01
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	>0e,->1a
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>63,->34
	.long	LUFLIPPED4
	.long	0

	.long	LUFLIPPED4
	.long	LUKNOCKDOWN5
	.long	LUKNOCKDOWN6
	.long	LUKNOCKDOWN7
	.long	0

a_fb_kitana
	.long	ani_offset_xy
	.word	->20,->23
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->08,->40
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	>32,->2d
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>3d,>0c
	.long	LUFLIPPED4
	.long	0

	.long	LUFLIPPED4
	.long	LUKNOCKDOWN5
	.long	LUKNOCKDOWN6
	.long	0



a_fb_jade
	.long	ani_offset_xy
	.word	->5a,>04
	.long	LUKNOCKDOWN1
	.long	ani_offset_xy
	.word	->5b,->21
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->43,->6c
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	->05,->6d
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	>5e,->6c
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>81,->3d
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>89,->0c
	.long	LUFLIPPED4
	.long	0

	.long	LUFLIPPED4
	.long	LUKNOCKDOWN5
	.long	LUKNOCKDOWN6
	.long	0


a_fb_nj	.long	ani_offset_xy
	.word	->49,>06
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->3c,>0e
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->28,>17
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	>00,>16
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>0e,>0e
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>5d,->17
	.long	LUFLIPPED4
	.long	0

	.long	LUFLIPPED4
	.long	LUKNOCKDOWN7
	.long	LUKNOCKDOWN8
	.long	0




a_fb_kano
	.long	ani_offset_xy
	.word	->3f,->0f
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->28,->1e
	.long	LUFLIPPED2
	.long	ani_offset_xy
 	.word	>35,->37
	.long	LUFLIPPED3
	.long	0

	.long	LUFLIPPED4
	.long	LUKNOCKDOWN5
	.long	LUKNOCKDOWN6
	.long	LUKNOCKDOWN7
	.long	0


a_fb_sonya
	.long	ani_offset_xy
	.word	->29,>0b
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->1f,>15
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	>0e,>04
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>56,->0a
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>8c,->21
	.long	LUFLIPPED4
	.long	0

	.long	LUFLIPPED4
	.long	LUKNOCKDOWN5
	.long	LUKNOCKDOWN6
	.long	LUKNOCKDOWN7
	.long	0


a_fb_jax
	.long	ani_offset_xy
	.word	->43,->16
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->2a,->2e
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	>06,->44
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>35,->2e
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>55,->1d
	.long	LUKNOCKDOWN7
	.long	ani_offset_xy
	.word	>49,>14
	.long	LUKNOCKDOWN7
	.long	0

a_fb_ind
	.long	ani_offset_xy
	.word	->57,->0f
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->48,->30
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	->20,->58
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>27,->4b
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>3b,->13
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>4d,>07
	.long	LUKNOCKDOWN7
	.long	0

a_fb_sz
	.long	ani_offset_xy
	.word	->49,->32
	.long	LUFLIPPED1
	.long	ani_flip
	.long	ani_offset_xy
	.word	>42,->1f
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>38,>05
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>02,>18
	.long	LUKNOCKDOWN5
	.long	ani_offset_xy
	.word	->35,->14
	.long	LUKNOCKDOWN5
	.long	ani_offset_xy
	.word	->72,->51
	.long	LUKNOCKDOWN5
	.long	0


a_fb_swat
	.long	ani_offset_xy
	.word	->4a,->07
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->3c,->33
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	>1c,->50
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>56,->20
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>54,>06
	.long	LUKNOCKDOWN7
	.long	0


a_fb_lia
	.long	ani_offset_xy
	.word	->64,>00
	.long	LUSTUMBLE1
	.long	ani_offset_xy
	.word	->73,>03
	.long	LUSTUMBLE1

	.long	ani_offset_xy
	.word	->75,->1e
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->57,->3d
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->23,->46
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	>1e,->4e
	.long	LUFLIPPED1

	.long	ani_offset_xy
	.word	>a8,>12
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>a7,>08
	.long	LUKNOCKDOWN7
	.long	0


a_fb_robo
	.long	ani_offset_xy
	.word	->52,->0b
	.long	LUFLIPPED1		; 1
	.long	ani_offset_xy
	.word	->4f,->32
	.long	LUFLIPPED2		; 2
	.long	ani_offset_xy
	.word	->38,->48
	.long	LUFLIPPED2		; 3

	.long	ani_offset_xy
	.word	->0a,->6c
	.long	LUFLIPPED3		; 4
	.long	ani_offset_xy
	.word	>38,->62
	.long	LUFLIPPED4		; 5
	.long	ani_offset_xy
	.word	>5c,->50
	.long	LUFLIPPED4		; 6

	.long	ani_offset_xy
	.word	>7b,->13
	.long	LUFLIPPED4		; 7
	.long	ani_offset_xy
	.word	>5a,->11
	.long	LUKNOCKDOWN7		; 8
	.long	0


a_fb_robo2
	.long	ani_offset_xy
	.word	->30,->07
	.long	LUSTUMBLE1		; 1
	.long	ani_offset_xy
	.word	->2c,->1d
	.long	LUFLIPPED1		; 2
	.long	ani_offset_xy
	.word	->0e,->1c
	.long	LUFLIPPED2		; 3
	.long	ani_offset_xy
	.word	>0e,->16
	.long	LUFLIPPED3		; 4
	.long	ani_offset_xy
	.word	>18,>03
	.long	LUFLIPPED4		; 5
	.long	ani_offset_xy
	.word	>09,>0b
	.long	LUFLIPPED4		; 6
	.long	ani_offset_xy
	.word	->0e,->11
	.long	LUKNOCKDOWN7		; 7
	.long	0



a_fb_lao
	.long	ani_offset_xy
	.word	->1d,>1a
	.long	LUSTUMBLE1		; 1
	.long	ani_offset_xy
	.word	->06,>2a
	.long	LUSTUMBLE1		; 2
	.long	ani_flip
	.long	ani_offset_xy
	.word	->29,>22
	.long	LUFLIPPED1		; 3
	.long	ani_offset_xy
	.word	->4a,->0f
	.long	LUFLIPPED2		; 4
	.long	ani_offset_xy
	.word	->32,->4f
	.long	LUFLIPPED3		; 5
	.long	ani_offset_xy
	.word	>10,->67
	.long	LUFLIPPED4		; 6
	.long	ani_offset_xy
	.word	>3f,->69
	.long	LUFLIPPED4		; 7
	.long	ani_offset_xy
	.word	>54,->57
	.long	LUFLIPPED4		; 8
	.long	ani_offset_xy
	.word	>77,>02
	.long	LUFLIPPED4		; 9
	.long	ani_offset_xy
	.word	>77,>52
	.long	LUFLIPPED4		; 10
	.long	0


a_fb_tusk
	.long	ani_offset_xy
	.word	->72,>00
	.long	LUFLIPPED1		; 1
	.long	ani_offset_xy
	.word	->5d,->38
	.long	LUFLIPPED2		; 2
	.long	ani_offset_xy
	.word	->1b,->78
	.long	LUFLIPPED3		; 3
	.long	ani_offset_xy
	.word	>39,->50
	.long	LUFLIPPED4		; 4
	.long	ani_offset_xy
	.word	>39,->10
	.long	LUFLIPPED4		; 5

	.long	ani_offset_xy
	.word	>1a,>0f
  	.long	LUKNOCKDOWN6		; 6
	.long	ani_offset_xy
	.word	->28,->08
  	.long	LUKNOCKDOWN7		; 7
	.long	ani_offset_xy
	.word	->68,>01
	.long	LUFLIPPED1		; 8
	.long	ani_offset_xy
	.word	->56,->44
	.long	LUFLIPPED2		; 9
	.long	ani_offset_xy
	.word	>1b,->66
	.long	LUFLIPPED3		; 10 

	.long	ani_offset_xy
	.word	>65,->05
	.long	LUFLIPPED4		; 11
	.long	ani_offset_xy
	.word	>64,>09
  	.long	LUKNOCKDOWN7		; 12
	.long	0



a_fb_sg
	.long	ani_offset_xy
	.word	->3d,->30
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->13,->45
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	->06,->50
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>0f,->3b
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>0f,->1f
	.long	LUFLIPPED3
	.long	ani_flip
	.long	ani_offset_xy
	.word	->16,>03
  	.long	LUKNOCKDOWN7
	.long	0

a_fb_st
	.long	ani_offset_xy
	.word	->4c,>00
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->41,>07
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->2a,>11
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	->0e,>0d
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>11,>1f
	.long	LUFLIPPED4

	.long	ani_offset_xy
	.word	->05,->01
	.long	LUKNOCKDOWN7
	.long	ani_offset_xy
	.word	->23,>01
	.long	LUKNOCKDOWN7
	.long	ani_offset_xy
	.word	->38,->04
	.long	LUKNOCKDOWN7

	.long	ani_offset_xy
	.word	->56,>03
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->59,->16
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->34,->3e
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	>2b,->41
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>3a,->18
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>48,->03
	.long	LUKNOCKDOWN7
	.long	0





a_fb_lk
	.long	ani_offset_xy
	.word	->3e,->01
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->3b,>07
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->1a,>0e
	.long	LUFLIPPED2
	.long	ani_offset_xy
	.word	>0a,>08
	.long	LUFLIPPED3
	.long	ani_offset_xy
	.word	>37,>03
	.long	LUFLIPPED4
	.long	ani_offset_xy
	.word	>88,->1f
	.long	LUFLIPPED4
	.long	0

	.long	LUFLIPPED4
	.long	LUKNOCKDOWN5
	.long	LUKNOCKDOWN6
	.long	LUKNOCKDOWN7
	.long	0


a_legged
	.long	ani_offset_xy
	.word	->66,>06
	.long	LUKNOCKDOWN1

	.long	ani_offset_xy
	.word	->51,->23
	.long	LUFLIPPED1

	.long	ani_offset_xy
	.word	->1b,->3e
	.long	LUFLIPPED3

	.long	ani_offset_xy
	.word	>31,->2d
	.long	LUFLIPPED4

	.long	ani_offset_xy
	.word	>5e,>00
	.long	LUFLIPPED4
	.long	0

a_orb_banged
	.long	LUFLIPPED1
	.long	LUFLIPPED2
	.long	LUFLIPPED3
	.long	LUFLIPPED4
	.long	0

a_zoomed
	.long	ani_offset_xy
	.word	>55,->08
	.long	LUKNOCKDOWN3	; 1

	.long	ani_offset_xy
	.word	>5b,>1f
	.long	LUKNOCKDOWN4	; 2

	.long	ani_offset_xy
	.word	>2a,>28
	.long	LUKNOCKDOWN5	; 3

	.long	ani_offset_xy
	.word	->30,>2b
	.long	LUKNOCKDOWN5	; 4

	.long	ani_offset_xy
	.word	->81,->08
	.long	LUFLIPPED1	; 5

	.long	ani_offset_xy
	.word	->41,->55
	.long	LUFLIPPED3	; 6
	.long	0

	.long	LUFLIPPED3
	.long	LUFLIPPED4
	.long	LUKNOCKDOWN5
	.long	LUKNOCKDOWN6
	.long	LUKNOCKDOWN7
	.long	0


a_shook
	.long	ani_offset_xy
	.word	->4a,>01
	.long	LUSTUMBLE2	; 3

	.long	ani_offset_xy
	.word	->31,->13
	.long	LUSTUMBLE2	; 4

	.long	ani_offset_xy
	.word	->1b,->0f
	.long	LUSTUMBLE2	; 5
	.long	0

; loop
	.long	ani_offset_xy
	.word	->1d,->0f
	.long	LUSTUMBLE2	; 6

	.long	ani_offset_xy
	.word	->2d,->1d
	.long	LUSTUMBLE2	; 7

	.long	ani_offset_xy
	.word	->3d,->21	
	.long	LUSTUMBLE2	; 8

	.long	ani_offset_xy
	.word	->31,->1a
	.long	LUSTUMBLE2	; 7
	.long	0

LUFLIPPED1
	.long	LUFLIPPED1A,0
LUFLIPPED2
	.long	LUFLIPPED2A,0
LUFLIPPED3
	.long	LUFLIPPED3A,LUFLIPPED3B,0
LUFLIPPED4
	.long	LUFLIPPED4A,0

a_throw
	.long	LUSLAM1
	.long	0

	.long	LUSLAM2
	.long	LUSLAM3
	.long	LUSLAM4
	.long	LUSLAM5
	.long	LUSLAM6
	.long	LUSLAM7		; 2-gether
	.long	0

	.long	LUSLAM6
	.long	LUSLAM5
	.long	LUSLAM4
	.long	LUSLAM3
	.long	LUSLAM2
	.long	0

LUSLAM1	.long	LUSLAM1A,LUSLAM1B,0
LUSLAM2	.long	LUSLAM2A,0
LUSLAM3	.long	LUSLAM3A,0
LUSLAM4	.long	LUSLAM4A,LUSLAM4B,0
LUSLAM5	.long	LUSLAM5A,LUSLAM5B,0
LUSLAM6	.long	LUSLAM6A,0
LUSLAM7	.long	LUSLAM7A,0

a_run
	.long	LURUN1
	.long	LURUN2
	.long	LURUN3
	.long	LURUN4
	.long	ani_calla,rsnd_footstep
	.long	LURUN5
	.long	LURUN6
	.long	LURUN7
	.long	LURUN8
	.long	LURUN9
	.long	ani_calla,rsnd_footstep
	.long	LURUN10
	.long	LURUN11
	.long	LURUN12
	.long	ani_jump,a_run
	.long	0			; we need this zero !!

LURUN1	.long	LURUN1A,0
LURUN2	.long	LURUN2A,LURUN2B,0
LURUN3	.long	LURUN3A,LURUN3B,0
LURUN4	.long	LURUN4A,0
LURUN5	.long	LURUN5A,0
LURUN6	.long	LURUN6A,0
LURUN7	.long	LURUN7A,LURUN7B,0
LURUN8	.long	LURUN8A,LURUN8B,0
LURUN9	.long	LURUN9A,0
LURUN10	.long	LURUN10A,0
LURUN11	.long	LURUN11A,0
LURUN12	.long	LURUN12A,0



a_victory
	.long	LUVICTORY1
	.long	LUVICTORY2
	.long	LUVICTORY3
	.long	LUVICTORY4
	.long	LUVICTORY5
	.long	LUVICTORY6
	.long	LUVICTORY7
	.long	LUVICTORY8
	.long	LUVICTORY9
	.long	LUVICTORY10
	.long	LUVICTORY11
	.long	LUVICTORY12
	.long	LUVICTORY13
	.long	LUVICTORY14
	.long	LUVICTORY15
	.long	0

LUVICTORY1
	.long	LUVICTORY1A,LUVICTORY1B,0
LUVICTORY2
	.long	LUVICTORY2A,LUVICTORYLEG1,0
LUVICTORY3
	.long	LUVICTORY3A,LUVICTORY3B,LUVICTORY3C,LUVICTORYLEG1,0
LUVICTORY4
	.long	LUVICTORY4A,LUVICTORYLEG1,0
LUVICTORY5
	.long	LUVICTORY5A,LUVICTORY5B,LUVICTORY5C,LUVICTORYLEG1,0
LUVICTORY6
	.long	LUVICTORY6A,LUVICTORY6B,LUVICTORYLEG1,0
LUVICTORY7
	.long	LUVICTORY7A,LUVICTORYLEG1,0
LUVICTORY8
	.long	LUVICTORY8A,LUVICTORYLEG1,0
LUVICTORY9
	.long	LUVICTORY9A,LUVICTORYLEG1,0
LUVICTORY10
	.long	LUVICTORY10A,LUVICTORYLEG1,0
LUVICTORY11
	.long	LUVICTORY11A,LUVICTORYLEG1,0
LUVICTORY12
	.long	LUVICTORY12A,LUVICTORYLEG1,0
LUVICTORY13
	.long	LUVICTORY13A,LUVICTORYLEG1,0
LUVICTORY14
	.long	LUVICTORY14A,LUVICTORYLEG1,0
LUVICTORY15
	.long	LUVICTORY15A,LUVICTORYLEG1,0

a_bike_kick
	.long	LUBIKEKICK1
	.long	LUBIKEKICK2
	.long	LUBIKEKICK3
	.long	LUBIKEKICK4
	.long	LUBIKEKICK5
	.long	ani_jump,a_bike_kick

LUBIKEKICK1
	.long	LUBIKEKICK1A,0
LUBIKEKICK2
	.long	LUBIKEKICK2A,LUBIKEKICK2B,0
LUBIKEKICK3
	.long	LUBIKEKICK3A,0
LUBIKEKICK4
	.long	LUBIKEKICK4A,LUBIKEKICK4B,0
LUBIKEKICK5
	.long	LUBIKEKICK5A,0


a_zap	.long	LUHITHROW1
	.long	LUHITHROW2
	.long	LUHITHROW3
	.long	ani_sladd,DRAG1
	.long	ani_slani_sleep,DRAG1
	.long	0

j_zap3	.long	ani_slani_sleep,DRAG2
	.long	ani_slani_sleep,DRAG3
	.long	ani_slani_sleep,DRAG4
	.long	0
	.long	LUHITHROW2
	.long	LUHITHROW1
	.long	0


a_zap_lo
	.long	LULOTHROW4
	.long	LULOTHROW5
	.long	LULOTHROW6
	.long	ani_sladd,DRAG1
	.long	ani_calla,lower_dragon
	.long	0

	.long	ani_slani,DRAG2
	.long	ani_calla,lower_dragon
	.long	LULOTHROW6
	.long	ani_slani,DRAG3
	.long	ani_calla,lower_dragon
	.long	LULOTHROW6
	.long	ani_slani,DRAG4
	.long	ani_calla,lower_dragon
	.long	LULOTHROW6
	.long	0

	.long	LULOTHROW5
	.long	LULOTHROW4
	.long	0


a_zap_air
	.long	LUAIRTHROW1
	.long	LUAIRTHROW2
	.long	LUAIRTHROW3
	.long	LUAIRTHROW4
	.long	ani_sladd,DRAG1
	.long	ani_calla,air_dragon
	.long	0

	.long	ani_slani,DRAG2
	.long	ani_calla,air_dragon
	.long	LUAIRTHROW4
	.long	ani_slani,DRAG3
	.long	ani_calla,air_dragon
	.long	LUAIRTHROW4
	.long	ani_slani,DRAG4
	.long	ani_calla,air_dragon
	.long	LUAIRTHROW4
	.long	0

	.long	LUAIRTHROW3
	.long	LUAIRTHROW2
	.long	LUAIRTHROW1
	.long	0

LUAIRTHROW1
	.long	LUAIRTHROW1A,LUAIRTHROW1B,0
LUAIRTHROW2
	.long	LUAIRTHROW2A,0
LUAIRTHROW3
	.long	LUAIRTHROW3A,LUAIRTHROW3B,0
LUAIRTHROW4
	.long	LUAIRTHROW4A,0



a_projectile
	.long	DRAG5
	.long	DRAG6
	.long	DRAG7
	.long	DRAG8
	.long	ani_jump,a_projectile

DRAG1	.long	DRAGINFIRE1,0
DRAG2	.long	DRAGINFIRE2,0
DRAG3	.long	DRAGINFIRE3,0
DRAG4	.long	DRAGINFIRE4,0
DRAG5	.long	DRAGINFIRE5,0
DRAG6	.long	DRAGINFIRE6,0
DRAG7	.long	DRAGINFIRE7,0
DRAG8	.long	DRAGINFIRE8,0

LUHITHROW1
	.long	LUHITHROW1A,LUHITHROW1B,0
LUHITHROW2
	.long	LUHITHROW2A,LUHITHROW2B,0
LUHITHROW3
	.long	LUHITHROW3A,LUHITHROW3B,0
LULOTHROW4
	.long	LULOTHROW4A,LULOTHROW4B,0
LULOTHROW5
	.long	LULOTHROW5A,LULOTHROW5B,0
LULOTHROW6
	.long	LULOTHROW6A,LULOTHROW6B,0

;******************************************************

a_scared
	.long	LUSCARED2
	.long	0

LUSCARED2
	.long	LUSCARED2A,0

a_thudd
	.long	LUTHUD1
	.long	LUTHUD2
	.long	LUTHUD3
	.long	LUTHUD4
	.long	LUTHUD5
	.long	LUTHUD6
	.long	LUTHUD7
	.long	0

LUTHUD1
	.long	LUTHUD1A,0
LUTHUD2
	.long	LUTHUD2A,0
LUTHUD3
	.long	LUTHUD3A,0
LUTHUD4
	.long	LUTHUD4A,0
LUTHUD5
	.long	LUTHUD5A,0
LUTHUD6
	.long	LUTHUD6A,0
LUTHUD7
	.long	LUTHUD7A,LUTHUD7B,0

;******************************************************

a_reform
	.long	LKREFORM1
	.long	LKREFORM2
	.long	LKREFORM3
	.long	LKREFORM4
	.long	LKREFORM5
	.long	LKREFORM6
	.long	0

a_kang_fire
	.long	ani_swpal
	.long	LKFIRE1
	.long	LKFIRE2
	.long	LKFIRE3
	.long	LKFIRE4
	.long	LKFIRE5
	.long	LKFIRE6
	.long	LKFIRE7
	.long	LKFIRE8
	.long	LKFIRE9
	.long	LKFIRE10
	.long	LKFIRE11
	.long	0

LKREFORM1
	.long	LKREFORM1A,0
LKREFORM2
	.long	LKREFORM2A,0
LKREFORM3
	.long	LKREFORM3A,0
LKREFORM4
	.long	LKREFORM4A,0
LKREFORM5
	.long	LKREFORM5A,0
LKREFORM6
	.long	LKREFORM6A,0


LKFIRE1
	.long	LKFIRE1A,LKFIRE1B,LKFIRE1C,LKFIRE1D,0
LKFIRE2
	.long	LKFIRE2A,LKFIRE2B,LKFIRE2C,0
LKFIRE3
	.long	LKFIRE3A,LKFIRE3B,LKFIRE3C,0
LKFIRE4
	.long	LKFIRE4A,LKFIRE4B,0
LKFIRE5
	.long	LKFIRE5A,LKFIRE5B,LKFIRE5C,0
LKFIRE6
	.long	LKFIRE6A,LKFIRE6B,LKFIRE6C,0
LKFIRE7
	.long	LKFIRE7A,0
LKFIRE8
	.long	LKFIRE8A,0
LKFIRE9
	.long	LKFIRE9A,0
LKFIRE10
	.long	LKFIRE10A,0
LKFIRE11
	.long	LKFIRE11A,0

;**********************************

;***************************************************************

a_jade_shook
	.long	ani_offset_xy
	.word	->83,->18
	.long	LUFLIPPED1
	.long	ani_offset_xy
	.word	->80,>0a 
	.long	LUSTUMBLE1
	.long	ani_offset_xy
	.word	->6d,>24
	.long	LUKNOCKDOWN2
	.long	ani_offset_xy
	.word	->80,>0a 
	.long	LUSTUMBLE1
	.long	ani_jump,a_jade_shook

;***************************************************************
;********************************************************************
a_back_break
	.long	LUBACKBREAK1
	.long	0
	
LUBACKBREAK1
	.long	LUBACKBREAK3B,LUBACKBREAK3C,0

;********************************************************************
a_baby
	.long	BABKANG
	.long	0
	
;********************************************************************
a_big_head
	.long	BHLIU1
	.long	BHLIU2
	.long	BHLIU3
	.long	BHLIU4
	.long	BHLIU5
	.long	0
;********************************************************************
a_half_cutup
	.long	HALF_LUCUTUP1
	.long	0
	
HALF_LUCUTUP1
	.long	LUCUTUP1D,LUCUTUP1C,0
;********************************************************************
a_cutup
	.long	LUCUTUP1
	.long	0
	
LUCUTUP1
	.long	LUCUTUP1A,LUCUTUP1B,LUCUTUP1C,LUCUTUP1D,0
;********************************************************************
a_float
	.long	LUFLOAT	
	.long	0
	
LUFLOAT	
	.long	BHLIU1,BHLIU2,BHLIU3,BHLIU4,BHLIU5,0
;********************************************************************
a_pounded
	.long	LUNAIL1
	.long	0

;********************************************************************
a_reach
	.long	ani_adjustxy
	.word	0,0
	.long	LUMOUTH3
	.long	LUMOUTH4
	.long	LUMOUTH5
	.long	LUMOUTH6
	.long	LUMOUTH8
	.long	0

LUMOUTH3	.long	LUMOUTH3A,LUSKELEG1A,LUSKELEG1B,LUSKELEG1C,0
LUMOUTH4	.long	LUMOUTH4A,LUSKELEG1A,LUSKELEG1B,LUSKELEG1C,0
LUMOUTH5	.long	LUMOUTH5A,LUSKELEG1A,LUSKELEG1B,LUSKELEG1C,0
LUMOUTH6	.long	LUMOUTH6A,LUMOUTH6B,LUMOUTH6C,0
LUMOUTH8	.long	LUMOUTH8A,0
;********************************************************************
a_skin_rip
	.long	LURIP1
	.long	0
LURIP1	.long	LURIP1A,LURIP1B,0
;********************************************************************
a_stretch
	.long	GROLIU2
	.long	GROLIU4
	.long	GROLIU5
	.long	0
GROLIU2
	.long	GROLIU2A,GROLIU2B,0
GROLIU4
	.long	GROLIU4A,GROLIU4B,0
GROLIU5
	.long	GROLIU5A,GROLIU5B,0
;********************************************************************
a_suk
	.long	SUKLIU1
	.long	SUKLIU3
	.long	SUKLIU4
	.long	SUKLIU5
	.long	SUKLIU6
	.long	0

SUKLIU1
	.long	SUKLIU1A,SUKLIU1B,0
SUKLIU3
	.long	SUKLIU3A,SUKLIU3B,0
SUKLIU4
	.long	SUKLIU4A,0
SUKLIU5
	.long	SUKLIU5A,0
SUKLIU6
	.long	SUKLIU6A,0
;********************************************************************
a_shocked
	.long	LUBZZ1
	.long	LUBZZ2
	.long	LUBZZ3
	.long	LUBZZ4
	.long	0
LUBZZ1	.long	LUBUZZ1,0
LUBZZ2	.long	LUBUZZ2,0
LUBZZ3	.long	LUBUZZ3,0
LUBZZ4	.long	LUBUZZ4,0
;********************************************************************
a_shredded
	.long	ani_adjustxy
	.word	6,6
	.long	LUSTUMBLE1

	.long	ani_adjustxy
	.word	-6,-6
	.long	LUSTUMBLE2

	.long	ani_adjustxy
	.word	6,6
	.long	LUSTUMBLE3

	.long	ani_adjustxy
	.word	-6,-6
	.long	LUSTUMBLE2

	.long	ani_jump,a_shredded

	.end
