**************************************************************************
*											     *
*  mk3 - Shao Kahn										*
*											     *
**************************************************************************
	.FILE	'mksk.asm'
	.WIDTH	132
	.OPTION	B,D,L,T
	.MNOLIST

	.include mainequ.asm
	.include imgtbl.glo
	.include sysequ.asm
	.include mksk.tbl
	.include mksk2.tbl

	.text

sk_anitab1
sk_anitab2
	.long	a_stance	;  0 - stance
	.long	a_walkf		;  1 - walk forward
	.long	a_walkb		;  2 - walk backward
	.long	a_turn		;  3 - turn around (standing)
	.long	a_dummy		;    - duck turnaround
	.long	a_dummy		;  5 - duck turnaround
	.long	a_dying		;  6 - dying shake thingy
	.long	a_dummy		;  7 - duck hit
	.long	a_dummy		;  8 - duck punch
	.long	a_dummy		;  9 - duck high kick
	.long	a_dummy		;  a - duck low kick
	.long	a_sk_laugh  	;  b - laugh
	.long	a_block		;  c - block (standing)
	.long	a_victory	;  d - victory
	.long	a_punch		;  e - punch high
	.long	a_dummy		;  f - punch low
	.long	a_dummy		; 10
	.long	a_kick		; 11
	.long	a_dummy		; 12
	.long	a_dummy		; 13
	.long	a_air_charge	; 14
	.long	a_dummy		; 15
	.long	a_jump		; 16
	.long	a_sk_projectile	; 17 - shao kahn projectile
	.long	a_sk_talk	; 18 - shao kahn the blabber mouth
	.long	a_charge	; 19
	.long	a_hammer	; 1a - HAMMER the other guy
	.long	a_dummy		; 1b
	.long	a_hit		; 1c - hit hit
	.long	a_hit		; 1d - hit lo
	.long	a_knockdown	; 1e
	.long	a_dummy		; 1f
	.long	a_stumble	; 20
	.long	a_getup		; 21
	.long	a_dummy		; 22 -
	.long	a_throw		; 23 -
	.long	a_zap		; 24 - 
	.long	a_dummy		; 25 -


;*************************************************************************

a_jump	.long	BGJUMP1
	.long	BGJUMP2
	.long	BGJUMP3
	.long	0

	.long	BGJUMP2
	.long	BGJUMP1
	.long	0


BGJUMP1	.long	BGJUMP1A,BGJUMP1B,BGJUMP1C,0
BGJUMP2	.long	BGJUMP2A,BGJUMP2B,BGJUMP2C,0
BGJUMP3	.long	BGJUMP3A,BGJUMP3B,BGJUMP3C,0

;*************************************************************************

a_grab_hit
a_sweep_kick
a_hop
a_throw
a_dummy

a_stance
	.long	BGSTANCE1
	.long	BGSTANCE2
	.long	BGSTANCE3
	.long	BGSTANCE4
	.long	BGSTANCE5
	.long	BGSTANCE6
	.long	BGSTANCE7
	.long	ani_jump,a_stance

BGSTANCE1
	.long	BGSTANCE1A,BGSTANCE1B,0
BGSTANCE2
	.long	BGSTANCE2A,BGSTANCE2B,0
BGSTANCE3
	.long	BGSTANCE3A,BGSTANCE3B,BGSTANCE3C,0
BGSTANCE4
	.long	BGSTANCE4A,BGSTANCE4B,BGSTANCE4C,0
BGSTANCE5
	.long	BGSTANCE5A,BGSTANCE5B,BGSTANCE5C,0
BGSTANCE6
	.long	BGSTANCE6A,BGSTANCE6B,BGSTANCE6C,0
BGSTANCE7
	.long	BGSTANCE7A,BGSTANCE7B,0

;*************************************************************************

a_walkf
	.long	BGWALK1
	.long	BGWALK2
	.long	BGWALK3
	.long	BGWALK4
	.long	BGWALK5
	.long	BGWALK6
	.long	BGWALK7
	.long	BGWALK8
	.long	BGWALK9
	.long	ani_jump,a_walkf

a_walkb
	.long	BGWALK9
	.long	BGWALK8
	.long	BGWALK7
	.long	BGWALK6
	.long	BGWALK5
	.long	BGWALK4
	.long	BGWALK3
	.long	BGWALK2
	.long	BGWALK1
	.long	ani_jump,a_walkb

BGWALK1	.long	BGWALKTORSO1,BGWALKLEG1A,BGWALKLEG1B,0
BGWALK2	.long	BGWALKTORSO2,BGWALKLEG2A,BGWALKLEG2B,0
BGWALK3	.long	BGWALKTORSO3,BGWALKLEG3A,BGWALKLEG3B,0
BGWALK4	.long	BGWALKTORSO4,BGWALKLEG4A,0
BGWALK5	.long	BGWALKTORSO5,BGWALKLEG5A,BGWALKLEG5B,0
BGWALK6	.long	BGWALKTORSO6,BGWALKLEG6A,BGWALKLEG6B,0
BGWALK7	.long	BGWALKTORSO7,BGWALKLEG7A,BGWALKLEG7B,0
BGWALK8	.long	BGWALKTORSO8,BGWALKLEG8A,BGWALKLEG8B,0
BGWALK9	.long	BGWALKTORSO9,BGWALKLEG9A,BGWALKLEG9B,0

;*************************************************************************

a_turn
	.long	BGTURN1
	.long	BGTURN2
	.long	ani_flip
	.long	BGTURN1
	.long	0

BGTURN1	.long	BGTURN1A,BGTURN1B,BGTURN1C,0
BGTURN2	.long	BGTURN2A,BGTURN2B,0

;*************************************************************************

a_punch
;	.long	BGPUNCH1
	.long	BGPUNCH2
	.long	BGPUNCH2
	.long	BGPUNCH3
	.long	BGPUNCH4
	.long	ani_nosleep
	.long	BGPUNCH5
	.long	0

	.long	BGPUNCH4
	.long	BGPUNCH3
	.long	BGPUNCH2
	.long	0

;BGPUNCH1	.long	BGPUNCH1A,BGPUNCH1B,BGPUNCH1C,0
BGPUNCH2	.long	BGPUNCH2A,BGPUNCH2B,0
BGPUNCH3	.long	BGPUNCH3A,BGPUNCH3B,0
BGPUNCH4	.long	BGPUNCH4A,BGPUNCH4B,BGPUNCH4C,0
BGPUNCH5	.long	BGPUNCH5A,BGPUNCH5B,BGPUNCH5C,0

;************************************************************************

a_victory
	.long	BGLAFF1
	.long	0

a_sk_laugh
	.long	BGLAFF1
	.long	BGLAFF2
	.long	BGLAFF3
	.long	BGLAFF4
	.long	BGLAFF3
	.long	BGLAFF2
	.long	ani_jump,a_sk_laugh

BGLAFF1	.long	BGLAFFLEG1A,BGLAFFLEG1B,BGLAFF1A,BGLAFF1B,0
BGLAFF2	.long	BGLAFFLEG1A,BGLAFFLEG1B,BGLAFF2A,BGLAFF2B,BGLAFF2C,BGLAFF2D,0
BGLAFF3	.long	BGLAFFLEG1A,BGLAFFLEG1B,BGLAFF3A,BGLAFF3B,BGLAFF3C,BGLAFF3D,0
BGLAFF4	.long	BGLAFFLEG1A,BGLAFFLEG1B,BGLAFF4A,BGLAFF4B,BGLAFF4C,BGLAFF4D,0

;************************************************************************

a_kick
	.long	BGKICK1
	.long	BGKICK2
	.long	BGKICK3
	.long	BGKICK4
	.long	BGKICK5
	.long	0
	.long	BGKICK4
	.long	BGKICK3
	.long	BGKICK2
	.long	BGKICK1
	.long	0

BGKICK1	.long	BGKICK1A,BGKICK1B,BGKICK1C,0
BGKICK2	.long	BGKICK2A,BGKICK2B,BGKICK2C,0
BGKICK3	.long	BGKICK3A,BGKICK3B,BGKICK3C,BGKICK3D,0
BGKICK4	.long	BGKICK4A,BGKICK4B,0
BGKICK5	.long	BGKICK5A,BGKICK5B,BGKICK5C,0

;************************************************************************

a_charge
	.long	BGCHARGE1
	.long	BGCHARGE2
	.long	BGCHARGE3
	.long	BGCHARGE4
	.long	0
	.long	BGCHARGE3
	.long	BGCHARGE2
	.long	BGCHARGE1
	.long	0

BGCHARGE1
	.long	BGCHARGE1A,BGCHARGE1B,BGCHARGE1C,0
BGCHARGE2
	.long	BGCHARGE2A,BGCHARGE2B,BGCHARGE2C,0
BGCHARGE3
	.long	BGCHARGE3A,BGCHARGE3B,BGCHARGE3C,0
BGCHARGE4
	.long	BGCHARGE4A,BGCHARGE4B,BGCHARGE4C,0

;************************************************************************

a_block
	.long	BGBLOCK1
	.long	BGBLOCK2
	.long	BGBLOCK3
	.long	0
	.long	BGBLOCK2
	.long	BGBLOCK1
	.long	0

BGBLOCK1	.long	BGBLOCK1A,BGBLOCK1B,BGBLOCK1C,0
BGBLOCK2	.long	BGBLOCK2A,BGBLOCK2B,0
BGBLOCK3	.long	BGBLOCK3A,BGBLOCK3B,0

;************************************************************************

;BGJUMP1	.long	BGJUMP1A,BGJUMP1B,BGJUMP1C,0
;BGJUMP2	.long	BGJUMP2A,BGJUMP2B,BGJUMP2C,0
;BGJUMP3	.long	BGJUMP3A,BGJUMP3B,BGJUMP3C,0

;************************************************************************

a_knockdown
	.long	BGKNOCKDOWN1
	.long	BGKNOCKDOWN2
	.long	BGKNOCKDOWN3
	.long	BGKNOCKDOWN4
	.long	BGKNOCKDOWN5
	.long	BGKNOCKDOWN6
	.long	BGKNOCKDOWN7
	.long	0
	.long	BGKNOCKDOWN8
	.long	BGKNOCKDOWN9
	.long	0

BGKNOCKDOWN1
	.long	BGKNOCKDOWN1A,BGKNOCKDOWN1B,BGKNOCKDOWN1C,0
BGKNOCKDOWN2
	.long	BGKNOCKDOWN2A,BGKNOCKDOWN2B,BGKNOCKDOWN2C,BGKNOCKDOWN2D,0
BGKNOCKDOWN3
	.long	BGKNOCKDOWN3A,BGKNOCKDOWN3B,BGKNOCKDOWN3C,BGKNOCKDOWN3D,0
BGKNOCKDOWN4
	.long	BGKNOCKDOWN4A,BGKNOCKDOWN4B,BGKNOCKDOWN4C,BGKNOCKDOWN4D,0
BGKNOCKDOWN5
	.long	BGKNOCKDOWN5A,BGKNOCKDOWN5B,BGKNOCKDOWN5C,0
BGKNOCKDOWN6
	.long	BGKNOCKDOWN6A,BGKNOCKDOWN6B,BGKNOCKDOWN6C,BGKNOCKDOWN6D,0
BGKNOCKDOWN7
	.long	BGKNOCKDOWN7A,BGKNOCKDOWN7B,BGKNOCKDOWN7C,BGKNOCKDOWN7D,0
BGKNOCKDOWN8
	.long	BGKNOCKDOWN8A,BGKNOCKDOWN8B,BGKNOCKDOWN8C,BGKNOCKDOWN8D,0
BGKNOCKDOWN9
	.long	BGKNOCKDOWN9A,BGKNOCKDOWN9B,BGKNOCKDOWN9C,0

;************************************************************************

a_stumble
	.long	BGSTUMBLE1
	.long	BGSTUMBLE2
	.long	BGSTUMBLE3
	.long	BGSTUMBLE4
	.long	BGSTUMBLE5
	.long	BGSTUMBLE6
	.long	BGSTUMBLE7
	.long	0

j_stumble
	.long	BGSTUMBLE1
	.long	BGSTUMBLE2
	.long	BGSTUMBLE3
	.long	BGSTUMBLE4
	.long	BGSTUMBLE5
	.long	BGSTUMBLE6
	.long	BGSTUMBLE7
	.long	ani_jump,j_stumble

BGSTUMBLE1
	.long	BGSTUMBLE1A,BGSTUMBLE1B,0
BGSTUMBLE2
	.long	BGSTUMBLE2A,BGSTUMBLE2B,BGSTUMBLE2C,0
BGSTUMBLE3
	.long	BGSTUMBLE3A,BGSTUMBLE3B,BGSTUMBLE3C,0
BGSTUMBLE4
	.long	BGSTUMBLE4A,BGSTUMBLE4B,0
BGSTUMBLE5
	.long	BGSTUMBLE5A,BGSTUMBLE5B,0
BGSTUMBLE6
	.long	BGSTUMBLE6A,BGSTUMBLE6B,0
BGSTUMBLE7
	.long	BGSTUMBLE7A,BGSTUMBLE7B,0

;************************************************************************

a_hammer
	.long	SHAHEADHAM2
	.long	SHAHEADHAM4
	.long	SHAHEADHAM5
	.long	SHAHEADHAM6
	.long	SHAHEADHAM7
	.long	SHAHEADHAM8
	.long	0
	.long	SHAHEADHAM7
	.long	SHAHEADHAM6
	.long	SHAHEADHAM5
	.long	SHAHEADHAM4
	.long	SHAHEADHAM2
	.long	0

SHAHEADHAM2
	.long	SHAHEADHAM2A,SHAHEADHAM2B,0
SHAHEADHAM4
	.long	SHAHEADHAM4A,SHAHEADHAM4B,0
SHAHEADHAM5
	.long	SHAHEADHAM5A,SHAHEADHAM5B,0
SHAHEADHAM6
	.long	SHAHEADHAM6A,SHAHEADHAM6B,0
SHAHEADHAM7
	.long	SHAHEADHAM7A,SHAHEADHAM7B,SHAHEADHAM7C,0
SHAHEADHAM8
	.long	SHAHEADHAM8A,SHAHEADHAM8B,SHAHEADHAM8C,0

;************************************************************************

;BGBIGPOW1
;	.long	BGBIGPOW1A,BGBIGPOW1B,BGBIGPOW1C,0
;BGBIGPOW2
;	.long	BGBIGPOW2A,BGBIGPOW2B,BGBIGPOW2C,0
;BGBIGPOW3
;	.long	BGBIGPOW3A,BGBIGPOW3B,BGBIGPOW3C,0
;BGBIGPOW4
;	.long	BGBIGPOW4A,BGBIGPOW4B,BGBIGPOW4C,0
;BGBIGPOW5
;	.long	BGBIGPOW5A,BGBIGPOW5B,BGBIGPOW5C,BGBIGPOW5D
;	.long	0
;BGBIGPOW6
;	.long	BGBIGPOW6A,BGBIGPOW6B,BGBIGPOW6C,0
;BGBIGPOW7
;	.long	BGBIGPOW7A,BGBIGPOW7B,BGBIGPOW7C,0
;BGBIGPOW8
;	.long	BGBIGPOW8A,BGBIGPOW8B,BGBIGPOW8C,0
;BGBIGPOW9
;	.long	BGBIGPOW9A,BGBIGPOW9B,0

;**********************************************************

a_sk_talk
	.long	BGTALK1
j_sktu	.long	BGTALK2
	.long	BGTALK3
	.long	BGTALK4
	.long	BGTALK5
	.long	0

	.long	BGTALK4
	.long	BGTALK3
	.long	ani_jump,j_sktu
	.long	0

	.long	BGTALK4
	.long	BGTALK3
	.long	BGTALK2
	.long	BGTALK1
	.long	0

BGTALK1	.long	BGTALKLEG1A,BGTALKLEG1B
	.long	BGTALK1A,BGTALK1B,0

BGTALK2	.long	BGTALKLEG1A,BGTALKLEG1B
	.long	BGTALK2A,BGTALK2B,0

BGTALK3	.long	BGTALKLEG1A,BGTALKLEG1B
	.long	BGTALK3A,BGTALK3B,0

BGTALK4	.long	BGTALKLEG1A,BGTALKLEG1B
	.long	BGTALK4A,BGTALK4B,0

BGTALK5	.long	BGTALKLEG1A,BGTALKLEG1B
	.long	BGTALK5A,BGTALK5B,0

;***********************************************************8



BGTAWNT1
	.long	BGTAWNT1A,BGTAWNT1B,BGTAWNT1C,0
BGTAWNT2
	.long	BGTAWNT2A,BGTAWNT2B,BGTAWNT2C,0
BGTAWNT3
	.long	BGTAWNT3A,BGTAWNT3B,BGTAWNT3C,0
BGTAWNT4
	.long	BGTAWNT4A,BGTAWNT4B,BGTAWNT4C,0

BGLAFFLEG1
	.long	BGLAFFLEG1A,BGLAFFLEG1B,0

;*************************************************************

a_hit	.long	BGHIT2
	.long	BGHIT3
	.long	BGHIT2
	.long	BGHIT1
	.long	0

BGHIT1	.long	BGHIT1A,BGHIT1B,BGHIT1C,0
BGHIT2	.long	BGHIT2A,BGHIT2B,0
BGHIT3	.long	BGHIT3A,BGHIT3B,0

;*************************************************************

BGSWEEPHIT1
	.long	BGSWEEPHIT1A,BGSWEEPHIT1B,BGSWEEPHIT1C,BGSWEEPHIT1D
	.long	0
BGSWEEPHIT2
	.long	BGSWEEPHIT2A,BGSWEEPHIT2B,BGSWEEPHIT2C,BGSWEEPHIT2D
	.long	0

;*************************************************************

a_getup
	.long	BGGETUP1
	.long	BGGETUP2
	.long	BGGETUP3
	.long	BGGETUP4
	.long	BGGETUP5
	.long	BGGETUP6
	.long	BGGETUP7
	.long	0

BGGETUP1
	.long	BGGETUP1A,BGGETUP1B,BGGETUP1C,BGGETUP1D
	.long	BGGETUP1E,0
BGGETUP2
	.long	BGGETUP2A,BGGETUP2B,BGGETUP2C,BGGETUP2D
	.long	BGGETUP2E,0
BGGETUP3
	.long	BGGETUP3A,BGGETUP3B,BGGETUP3C,0
BGGETUP4
	.long	BGGETUP4A,BGGETUP4B,BGGETUP4C,0
BGGETUP5
	.long	BGGETUP5A,BGGETUP5B,BGGETUP5C,0
BGGETUP6
	.long	BGGETUP6A,BGGETUP6B,0
BGGETUP7
	.long	BGGETUP7A,BGGETUP7B,BGGETUP7C,0

;*************************************************************

a_dying
	.long	SHADEAD3
	.long	SHADEAD4
	.long	SHADEAD5
	.long	SHADEAD4
	.long	ani_jump,a_dying
	.long	0

	.long	SHADEAD5
	.long	ani_sladd,SHDEATH1
	.long	ani_slani_sleep,SHDEATH1
	.long	ani_slani_sleep,SHDEATH2
	.long	ani_slani_sleep,SHDEATH3
	.long	ani_slani_sleep,SHDEATH4
;	.long	ani_slani_sleep,SHDEATH5
	.long	ani_slani_sleep,SHDEATH6
	.long	ani_slani_sleep,SHDEATH7
;	.long	ani_slani_sleep,SHDEATH8
	.long	ani_slani_sleep,SHDEATH9
	.long	0

	.long	ani_swpal
	.long	SHDEATH1			; borrow this palette

j_skcycle
	.long	SHACYCLE1
	.long	SHACYCLE2
	.long	SHACYCLE3
	.long	SHACYCLE4
	.long	SHACYCLE5
	.long	SHACYCLE6
	.long	SHACYCLE7
	.long	SHACYCLE8
	.long	SHACYCLE9
	.long	SHACYCLE10
	.long	ani_jump,j_skcycle




SHADEAD3
	.long	SHADEAD3A,SHADEAD3B,0
SHADEAD4
	.long	SHADEAD4A,SHADEAD4B,0
SHADEAD5
	.long	SHADEAD5A,SHADEAD5B,0


SHDEATH1
	.long	SHDEATH1A,0
SHDEATH2
	.long	SHDEATH2A,SHDEATH2B,SHDEATH2C,0
SHDEATH3
	.long	SHDEATH3A,SHDEATH3B,SHDEATH3C,SHDEATH3D
	.long	0
SHDEATH4
	.long	SHDEATH4A,SHDEATH4B,SHDEATH4B,SHDEATH4C,0
SHDEATH5
	.long	SHDEATH5A,SHDEATH5B,SHDEATH5B,SHDEATH5C,SHDEATH5C,0
SHDEATH6
	.long	SHDEATH6A,SHDEATH6B,SHDEATH6C,SHDEATH6D
	.long	SHDEATH6E,0
SHDEATH7
	.long	SHDEATH7A,SHDEATH7B,SHDEATH7C,SHDEATH7D
	.long	SHDEATH7E,SHDEATH7F,0
SHDEATH8
	.long	SHDEATH8A,SHDEATH8B,SHDEATH8C,SHDEATH8D
	.long	SHDEATH8E,SHDEATH8F,SHDEATH8G,SHDEATH8H
	.long	0
SHDEATH9
	.long	SHDEATH9A,SHDEATH9B,SHDEATH9C,SHDEATH9D
	.long	SHDEATH9E,SHDEATH9F,SHDEATH9G,SHDEATH9H
	.long	0

SHABEAM2
	.long	SHABEAM2A,0
SHABEAM4
	.long	SHABEAM4A,SHABEAM4B,0
SHABEAM5
	.long	SHABEAM5A,SHABEAM5B,0
SHABEAM6
	.long	SHABEAM6A,SHABEAM6B,0
SHABEAM7
	.long	SHABEAM7A,SHABEAM7B,0

;**********************

SHACYCLE1
	.long	SHABEAM1B,SHABEAM2A,SHABEAM3A,SHABEAM4A
	.long	SHABEAM5B,SHABEAM6B,SHABEAM7A
	.long	SHACYCLE1A,SHACYCLE1B,0
SHACYCLE2
	.long	SHABEAM1B,SHABEAM2A,SHABEAM3B,SHABEAM4B
	.long	SHABEAM5B,SHABEAM6B,SHABEAM7B
	.long	SHACYCLE2A,SHACYCLE2B,0
SHACYCLE3
	.long	SHABEAM1B,SHABEAM2A,SHABEAM3A,SHABEAM4A
	.long	SHABEAM5B,SHABEAM6B,SHABEAM7A
	.long	SHACYCLE3A,SHACYCLE3B,0
SHACYCLE4
	.long	SHABEAM1B,SHABEAM2A,SHABEAM3B,SHABEAM4B
	.long	SHABEAM5B,SHABEAM6B,SHABEAM7B
	.long	SHACYCLE4A,SHACYCLE4B,0
SHACYCLE5
	.long	SHABEAM1B,SHABEAM2A,SHABEAM3A,SHABEAM4A
	.long	SHABEAM5B,SHABEAM6B,SHABEAM7A
	.long	SHACYCLE5A,SHACYCLE5B,0
SHACYCLE6
	.long	SHABEAM1B,SHABEAM2A,SHABEAM3B,SHABEAM4B
	.long	SHABEAM5B,SHABEAM6B,SHABEAM7B
	.long	SHACYCLE1A,SHACYCLE1B,0
SHACYCLE7
	.long	SHABEAM1B,SHABEAM2A,SHABEAM3A,SHABEAM4A
	.long	SHABEAM5B,SHABEAM6B,SHABEAM7A
	.long	SHACYCLE2A,SHACYCLE2B,0
SHACYCLE8
	.long	SHABEAM1B,SHABEAM2A,SHABEAM3B,SHABEAM4B
	.long	SHABEAM5B,SHABEAM6B,SHABEAM7B
	.long	SHACYCLE3A,SHACYCLE3B,0
SHACYCLE9
	.long	SHABEAM1B,SHABEAM2A,SHABEAM3A,SHABEAM4A
	.long	SHABEAM5B,SHABEAM6B,SHABEAM7A
	.long	SHACYCLE4A,SHACYCLE4B,0
SHACYCLE10
	.long	SHABEAM1B,SHABEAM2A,SHABEAM3B,SHABEAM4B
	.long	SHABEAM5B,SHABEAM6B,SHABEAM7B
	.long	SHACYCLE5A,SHACYCLE5B,0

;*************************************************

SHASIDEHAM2
	.long	SHASIDEHAM2A,SHASIDEHAM2B,0
SHASIDEHAM3
	.long	SHASIDEHAM3A,SHASIDEHAM3B,0
SHASIDEHAM4
	.long	SHASIDEHAM4A,0
SHASIDEHAM5
	.long	SHASIDEHAM5A,SHASIDEHAM5B,0
SHASIDEHAM6
	.long	SHASIDEHAM6A,0
SHASIDEHAM7
	.long	SHASIDEHAM7A,0
SHASIDEHAM8
	.long	SHASIDEHAM8A,SHASIDEHAM8B,0
HAMMERGLOWB2
	.long	HAMMERGLOWB2A,HAMMERGLOWB2B,HAMMERGLOWB2C,0
HAMMERGLOWB3
	.long	HAMMERGLOWB3A,HAMMERGLOWB3B,0


a_zap
	.long	SHABLO2
	.long	SHABLO3
	.long	SHABLO4
	.long	SHABLO8
	.long	ani_sladd,KAHNGLOW
	.long	0

	.long	SHABLO4
	.long	SHABLO3
	.long	SHABLO2
	.long	0

SHABLO2	.long	SHABLO2A,SHABLO2B,SHABLO2C,0
SHABLO3	.long	SHABLO3A,SHABLO3B,SHABLO3C,0
SHABLO4	.long	SHABLO4A,SHABLO4B,SHABLO4C,0
SHABLO8	.long	SHABLO8A,SHABLO8B,0
KAHNGLOW	.long	KAHNGLOWA


a_sk_projectile
	.long	SKPRO1
	.long	SKPRO2
	.long	SKPRO3
	.long	SKPRO4
	.long	SKPRO5
	.long	SKPRO6
	.long	SKPRO7
	.long	SKPRO8
	.long	SKPRO9
	.long	SKPRO10
	.long	SKPRO11
	.long	ani_jump,a_sk_projectile

SKPRO1	.long	KAHNPRO1,0
SKPRO2	.long	KAHNPRO2,0
SKPRO3	.long	KAHNPRO3,0
SKPRO4	.long	KAHNPRO4,0
SKPRO5	.long	KAHNPRO5,0
SKPRO6	.long	KAHNPRO6,0
SKPRO7	.long	KAHNPRO7,0
SKPRO8	.long	KAHNPRO8,0
SKPRO9	.long	KAHNPRO9,0
SKPRO10	.long	KAHNPRO10,0
SKPRO11	.long	KAHNPRO11,0
SKPRO12	.long	KAHNPRO12,0

;************************************************************************

a_air_charge
	.long	BGJUMPFLY1
	.long	BGJUMPFLY2
	.long	BGJUMPFLY3
	.long	0
	.long	BGJUMP2
	.long	0

BGJUMPFLY1
	.long	BGJUMPFLY1A,BGJUMPFLY1B,0
BGJUMPFLY2
	.long	BGJUMPFLY2A,BGJUMPFLY2B,0
BGJUMPFLY3
	.long	BGJUMPFLY3A,BGJUMPFLY3B,BGJUMPFLY3C,0

;************************************************************************

	.end
