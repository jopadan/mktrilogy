#include <regdef.h>

	.option	pic0

	.set noreorder
	.data

/*											  
;******************************************************************************
; File: artverse.s
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Verse Art Textures
;******************************************************************************
*/

/* MNINJA */
	.align 2
	.globl scorpion_pieces
scorpion_pieces:
	.half 0x5d,0x3d+25,0x135,0x3d+25
	.word VSCORPGRAY1A,0
	.word VSCORPGRAY1B,0
	.word VSCORPGRAY1C,0
	.word VSCORPGRAY1D,0
	.word VSCORPGRAY1E,0
	.word VSCORPGRAY1F,0
	.word VSCORPGRAY1G,0
	.word VSCORPGRAY1H,0
	.word VSCORPFLESH1A,0
	.word VSCORPFLESH1B,0
	.word VSCORPFLESH1C,0
	.word VSCORPFLESH1D,0
	.word VSCORPFLESH1E,0
	.word VSCORPYELO1A,SCYELO2_P
	.word VSCORPYELO1B,SCYELO2_P
	.word VSCORPYELO1C,SCYELO2_P
	.word VSCORPYELO1D,SCYELO2_P
	.word VSCORPYELO1E,SCYELO2_P
	.word	0
	
	.align 2
	.globl rain_pieces
rain_pieces:
	.half	0x5d,0x30+29,0x135,0x30+29
	.word VREPGRAY1A,0
	.word VREPGRAY1B,0
	.word VREPGRAY1C,0
	.word VREPGRAY1D,0
	.word VREPFLESH1A,0
	.word VREPFLESH1B,0
	.word VREPFLESH1C,0
	.word VREPFLESH1D,0
	.word VRAINGREEN1A,SCORPRAIN2_PAL
	.word VRAINGREEN1B,SCORPRAIN2_PAL
	.word VRAINGREEN1C,SCORPRAIN2_PAL
	.word VRAINGREEN1D,SCORPRAIN2_PAL
	.word VRAINGREEN1E,SCORPRAIN2_PAL
	.word	0
		
	.globl oldsmoke_pieces
oldsmoke_pieces:
	.half	0x5d,0x3d+25,0x135,0x3d+25
	.word VSCORPGRAY1A,0
	.word VSCORPGRAY1B,0
	.word VSCORPGRAY1C,0
	.word VSCORPGRAY1D,0
	.word VSCORPGRAY1E,0
	.word VSCORPGRAY1F,0
	.word VSCORPGRAY1G,0
	.word VSCORPGRAY1H,0
	.word VSCORPFLESH1A,0
	.word VSCORPFLESH1B,0
	.word VSCORPFLESH1C,0
	.word VSCORPFLESH1D,0
	.word VSCORPFLESH1E,0
	.word VOSMYELO1A,HOSMA_P
	.word VOSMYELO1B,HOSMA_P
	.word VOSMYELO1C,HOSMA_P
	.word VOSMYELO1D,HOSMA_P
	.word VOSMYELO1E,HOSMA_P
	.word	0
	
	.globl noob_pieces
noob_pieces:
	.half	0x5d,0x3d+25,0x135,0x3d+25
	.word VSCORPGRAY1A,SHADOW_P
	.word VSCORPGRAY1B,SHADOW_P
	.word VSCORPGRAY1C,SHADOW_P
	.word VSCORPGRAY1D,SHADOW_P
	.word VSCORPGRAY1E,SHADOW_P
	.word VSCORPGRAY1F,SHADOW_P
	.word VSCORPGRAY1G,SHADOW_P
	.word VSCORPGRAY1H,SHADOW_P
	.word VNOOBFLESH1A,0
	.word VNOOBFLESH1B,0
	.word VNOOBFLESH1C,0
	.word VNOOBFLESH1D,0
	.word VNOOBFLESH1E,0
	.word VNOOBYELO1A,SHADOW_P
	.word VNOOBYELO1B,SHADOW_P
	.word VNOOBYELO1C,SHADOW_P
	.word VNOOBYELO1D,SHADOW_P
	.word VNOOBYELO1E,SHADOW_P
	.word	0
	
	.globl ermac_pieces
ermac_pieces:
	.half	0x5d,0x30+29,0x135,0x30+29
	.word VREPGRAY1A,0
	.word VREPGRAY1B,0
	.word VREPGRAY1C,0
	.word VREPGRAY1D,0
	.word VREPFLESH1A,0
	.word VREPFLESH1B,0
	.word VREPFLESH1C,0
	.word VREPFLESH1D,0
	.word VERMGREEN1A,RPRED2_P
	.word VERMGREEN1B,RPRED2_P
	.word VERMGREEN1C,RPRED2_P
	.word VERMGREEN1D,RPRED2_P
	.word VERMGREEN1E,RPRED2_P
	.word	0

	.globl reptile_pieces
reptile_pieces:
	.half	0x5d,0x30+29,0x135,0x30+29
	.word VREPGRAY1A,0
	.word VREPGRAY1B,0
	.word VREPGRAY1C,0
	.word VREPGRAY1D,0
	.word VREPFLESH1A,0
	.word VREPFLESH1B,0
	.word VREPFLESH1C,0
	.word VREPFLESH1D,0
	.word VREPGREEN1A,RPGRN2_P
	.word VREPGREEN1B,RPGRN2_P
	.word VREPGREEN1C,RPGRN2_P
	.word VREPGREEN1D,RPGRN2_P
	.word VREPGREEN1E,RPGRN2_P
	.word	0
	
	.globl oldsz_pieces
oldsz_pieces:
	.half	0x5d,0x30+29,0x135,0x30+29
	.word VREPGRAY1A,0
	.word VREPGRAY1B,0
	.word VREPGRAY1C,0
	.word VREPGRAY1D,0
	.word VREPFLESH1A,0
	.word VREPFLESH1B,0
	.word VREPFLESH1C,0
	.word VREPFLESH1D,0
	.word VOSZGREEN1A,SCBLUE2_P
	.word VOSZGREEN1B,SCBLUE2_P
	.word VOSZGREEN1C,SCBLUE2_P
	.word VOSZGREEN1D,SCBLUE2_P
	.word VOSZGREEN1E,SCBLUE2_P
	.word	0
	
VSCORPGRAY1A:
	.word SCORPGRAY1A
	.word 0
VSCORPGRAY1B:
	.word SCORPGRAY1B
	.word 0
VSCORPGRAY1C:
	.word SCORPGRAY1C
	.word 0
VSCORPGRAY1D:
	.word SCORPGRAY1D
	.word 0
VSCORPGRAY1E:
	.word SCORPGRAY1E
	.word 0
VSCORPGRAY1F:
	.word SCORPGRAY1F
	.word 0
VSCORPGRAY1G:
	.word SCORPGRAY1G
	.word 0
VSCORPGRAY1H:
	.word SCORPGRAY1H
	.word 0
VSCORPFLESH1A:
	.word SCORPFLESH1A
	.word 0
VSCORPFLESH1B:
	.word SCORPFLESH1B
	.word 0
VSCORPFLESH1C:
	.word SCORPFLESH1C
	.word 0
VSCORPFLESH1D:
	.word SCORPFLESH1D
	.word 0
VSCORPFLESH1E:
	.word SCORPFLESH1E
	.word 0

VNOOBFLESH1A:
	.word NOOBFLESH1A
	.word 0
VNOOBFLESH1B:
	.word NOOBFLESH1B
	.word 0
VNOOBFLESH1C:
	.word NOOBFLESH1C
	.word 0
VNOOBFLESH1D:
	.word NOOBFLESH1D
	.word 0
VNOOBFLESH1E:
	.word NOOBFLESH1E
	.word 0


	
VSCORPYELO1A:
	.word SCORPYELO1A
	.word 0
VSCORPYELO1B:
	.word SCORPYELO1B
	.word 0
VSCORPYELO1C:
	.word SCORPYELO1C
	.word 0
VSCORPYELO1D:
	.word SCORPYELO1D
	.word 0
VSCORPYELO1E:
	.word SCORPYELO1E
	.word 0
	
VNOOBYELO1A:
	.word NOOBYELO1A
	.word 0
VNOOBYELO1B:
	.word NOOBYELO1B
	.word 0
VNOOBYELO1C:
	.word NOOBYELO1C
	.word 0
VNOOBYELO1D:
	.word NOOBYELO1D
	.word 0
VNOOBYELO1E:
	.word NOOBYELO1E
	.word 0
	
VOSMYELO1A:
	.word OSMYELO1A
	.word 0
VOSMYELO1B:
	.word OSMYELO1B
	.word 0
VOSMYELO1C:
	.word OSMYELO1C
	.word 0
VOSMYELO1D:
	.word OSMYELO1D
	.word 0
VOSMYELO1E:
	.word OSMYELO1E
	.word 0
	
VREPGRAY1A:
	.word REPGRAY1A
	.word 0
VREPGRAY1B:
	.word REPGRAY1B
	.word 0
VREPGRAY1C:
	.word REPGRAY1C
	.word 0
VREPGRAY1D:
	.word REPGRAY1D
	.word 0
VREPFLESH1A:
	.word REPFLESH1A
	.word 0
VREPFLESH1B:
	.word REPFLESH1B
	.word 0
VREPFLESH1C:
	.word REPFLESH1C
	.word 0
VREPFLESH1D:
	.word REPFLESH1D
	.word 0
VREPGREEN1A:
	.word REPGREEN1A
	.word 0
VREPGREEN1B:
	.word REPGREEN1B
	.word 0
VREPGREEN1C:
	.word REPGREEN1C
	.word 0
VREPGREEN1D:
	.word REPGREEN1D
	.word 0
VREPGREEN1E:
	.word REPGREEN1E
	.word 0
VERMGREEN1A:
	.word ERMGREEN1A
	.word 0
VERMGREEN1B:
	.word ERMGREEN1B
	.word 0
VERMGREEN1C:
	.word ERMGREEN1C
	.word 0
VERMGREEN1D:
	.word ERMGREEN1D
	.word 0
VERMGREEN1E:
	.word ERMGREEN1E
	.word 0
VOSZGREEN1A:
	.word OSZGREEN1A
	.word 0
VOSZGREEN1B:
	.word OSZGREEN1B
	.word 0
VOSZGREEN1C:
	.word OSZGREEN1C
	.word 0
VOSZGREEN1D:
	.word OSZGREEN1D
	.word 0
VOSZGREEN1E:
	.word OSZGREEN1E
	.word 0
	
VRAINGREEN1A:
	.word RAINGREEN1A
	.word 0
VRAINGREEN1B:
	.word RAINGREEN1B
	.word 0
VRAINGREEN1C:
	.word RAINGREEN1C
	.word 0
VRAINGREEN1D:
	.word RAINGREEN1D
	.word 0
VRAINGREEN1E:
	.word RAINGREEN1E
	.word 0
	
	
	
	
	
	
SCORPGRAY1A:
	.word 0x00000000
	.half 44, 22, 65, -57
	.word   SCGRAY_P
SCORPGRAY1B:
	.word 0x000000B8
	.half 48, 27, 46, -119
	.word   SCGRAY_P
SCORPGRAY1C:
	.word 0x000001F8
	.half 67, 30, -58, -75
	.word   SCGRAY_P
SCORPGRAY1D:
	.word 0x00000388
	.half 24, 6, -52, -117
	.word   SCGRAY_P
SCORPGRAY1E:
	.word 0x000003DC
	.half 94, 30, -37, 0
	.word   SCGRAY_P
SCORPGRAY1F:
	.word 0x00000564
	.half 123, 50, 30, -14
	.word   SCGRAY_P
SCORPGRAY1G:
	.word 0x000009D8
	.half 128, 20, -20, 0
	.word   SCGRAY_P
SCORPGRAY1H:
	.word 0x00000CCC
        .half 30, 34, 2, -137
	.word   SCGRAY_P

SCORPFLESH1A:
	.word 0x00000DC8
	.half 50, 39, 64, -24
	.word   SCFLESH_P
SCORPFLESH1B:
	.word 0x000010FC
	.half 24, 16, 37, -95
	.word   SCFLESH_P
SCORPFLESH1C:
	.word 0x0000120C
	.half 18, 25, -30, -25
	.word   SCFLESH_P
SCORPFLESH1D:
	.word 0x0000135C
        .half 26, 17, -70, -69
	.word   SCFLESH_P
SCORPFLESH1E:
	.word 0x00001494
	.half 60, 29, -37, -77
	.word   SCFLESH_P



NOOBFLESH1A:
	.word 0x00000DC8
	.half 50, 39, 64, -24
	.word	NFLESH_P
NOOBFLESH1B:
	.word 0x000010FC
	.half 24, 16, 37, -95
	.word	NFLESH_P
NOOBFLESH1C:
	.word 0x0000120C
	.half 18, 25, -30, -25
	.word	NFLESH_P
NOOBFLESH1D:
	.word 0x0000135C
    .half 26, 17, -70, -69
	.word	NFLESH_P
NOOBFLESH1E:
	.word 0x00001494
	.half 60, 29, -37, -77
	.word	NFLESH_P

NOOBYELO1A:
	.word 0x000017C8
	.half 51, 22, -65, -79
	.word   SHADOW_P
NOOBYELO1B:
	.word 0x00001944
	.half 20, 10, -55, -112
	.word   SHADOW_P
NOOBYELO1C:
	.word 0x000019BC
	.half 51, 26, 63, -64
	.word   SHADOW_P
NOOBYELO1D:
	.word 0x00001C7C
	.half 127, 66, -4, -30
	.word   SHADOW_P
NOOBYELO1E:
	.word 0x00002524
        .half 162, 47, 39, -5
	.word   SHADOW_P

OSMYELO1A:
	.word 0x000017C8
	.half 51, 22, -65, -79
	.word   SCORPG_P
OSMYELO1B:
	.word 0x00001944
	.half 20, 10, -55, -112
	.word   SCORPG_P
OSMYELO1C:
	.word 0x000019BC
	.half 51, 26, 63, -64
	.word   SCORPG_P
OSMYELO1D:
	.word 0x00001C7C
	.half 127, 66, -4, -30
	.word   SCORPG_P
OSMYELO1E:
	.word 0x00002524
    .half 162, 47, 39, -5
	.word   SCORPG_P
		
SCORPYELO1A:
	.word 0x000017C8
	.half 51, 22, -65, -79
	.word   SCYELO1_P
SCORPYELO1B:
	.word 0x00001944
	.half 20, 10, -55, -112
	.word   SCYELO1_P
SCORPYELO1C:
	.word 0x000019BC
	.half 51, 26, 63, -64
	.word   SCYELO1_P
SCORPYELO1D:
	.word 0x00001C7C
	.half 127, 66, -4, -30
	.word   SCYELO1_P
SCORPYELO1E:
	.word 0x00002524
        .half 162, 47, 39, -5
	.word   SCYELO1_P

RAINYELO1A:
	.word 0x000017C8
	.half 51, 22, -65, -79
	.word   SCORPRAIN1_PAL
RAINYELO1B:
	.word 0x00001944
	.half 20, 10, -55, -112
	.word   SCORPRAIN1_PAL
RAINYELO1C:
	.word 0x000019BC
	.half 51, 26, 63, -64
	.word   SCORPRAIN1_PAL
RAINYELO1D:
	.word 0x00001C7C
	.half 127, 66, -4, -30
	.word   SCORPRAIN1_PAL
RAINYELO1E:
	.word 0x00002524
        .half 162, 47, 39, -5
	.word   SCORPRAIN1_PAL
		
REPGRAY1A:
	.word 0x0000312C
	.half 37, 60, 74, 0
	.word   RPGRAY_P
REPGRAY1B:
	.word 0x000032F8
        .half 116, 46, 41, -54
	.word   RPGRAY_P
REPGRAY1C:
	.word 0x00003550
	.half 68, 34, -54, -94
	.word   RPGRAY_P
REPGRAY1D:
	.word 0x000036E4
	.half 147, 42, -5, -23
	.word   RPGRAY_P
REPFLESH1A:
	.word 0x00003AF4
	.half 75, 77, 74, -5
	.word   RPFLESH_P
REPFLESH1B:
	.word 0x000040EC
	.half 18, 27, -20, -50
	.word   RPFLESH_P
REPFLESH1C:
	.word 0x00004238
	.half 71, 39, -38, -93
	.word   RPFLESH_P
REPFLESH1D:
	.word 0x0000467C
	.half 26, 21, -77, -93
	.word   RPFLESH_P
REPGREEN1A:
	.word 0x00004780
        .half 36, 38, 68, 1
	.word   RPGRN1_P
REPGREEN1B:
	.word 0x000048B4
        .half 22, 18, 31, 0
	.word   RPGRN1_P
REPGREEN1C:
	.word 0x00004940
	.half 142, 38, 40, -33
	.word   RPGRN1_P
REPGREEN1D:
	.word 0x00005378
        .half 43, 28, -56, -107
	.word   RPGRN1_P
REPGREEN1E:
	.word 0x000054F0
        .half 128, 67, 3, -47
	.word   RPGRN1_P
	
OSZGREEN1A:
	.word 0x00004780
        .half 36, 38, 68, 1
	.word	SCBLUE1_P
OSZGREEN1B:
	.word 0x000048B4
        .half 22, 18, 31, 0
	.word	SCBLUE1_P
OSZGREEN1C:
	.word 0x00004940
	.half 142, 38, 40, -33
	.word	SCBLUE1_P
OSZGREEN1D:
	.word 0x00005378
        .half 43, 28, -56, -107
	.word	SCBLUE1_P
OSZGREEN1E:
	.word 0x000054F0
    .half 128, 67, 3, -47
	.word	SCBLUE1_P

RAINGREEN1A:
	.word 0x00004780
        .half 36, 38, 68, 1
	.word	SCORPRAIN1_PAL
RAINGREEN1B:
	.word 0x000048B4
        .half 22, 18, 31, 0
	.word	SCORPRAIN1_PAL
RAINGREEN1C:
	.word 0x00004940
	.half 142, 38, 40, -33
	.word	SCORPRAIN1_PAL
RAINGREEN1D:
	.word 0x00005378
        .half 43, 28, -56, -107
	.word	SCORPRAIN1_PAL
RAINGREEN1E:
	.word 0x000054F0
    .half 128, 67, 3, -47
	.word	SCORPRAIN1_PAL
	
ERMGREEN1A:
	.word 0x00004780
        .half 36, 38, 68, 1
	.word	RPRED1_P
ERMGREEN1B:
	.word 0x000048B4
        .half 22, 18, 31, 0
	.word	RPRED1_P
ERMGREEN1C:
	.word 0x00004940
	.half 142, 38, 40, -33
	.word	RPRED1_P
ERMGREEN1D:
	.word 0x00005378
        .half 43, 28, -56, -107
	.word	RPRED1_P
ERMGREEN1E:
	.word 0x000054F0
    .half 128, 67, 3, -47
	.word	RPRED1_P

	.align 2
	.globl mninja_dict
mninja_dict:
#include "mninja.dct"

