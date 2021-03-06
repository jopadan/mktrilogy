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

/* FEMALE NINJAS */
	.align 2
	.globl kitana_pieces	
kitana_pieces:	
	.half	0x5d,0x3d+30,0x135,0x3d+30
	.word VKITGRAY1A,0
	.word VKITGRAY1B,0
	.word VKITGRAY1C,0
	.word VKITFLESH1A,0
	.word VKITFLESH1B,0
	.word VKITFLESH1C,0
	.word VKITFLESH1D,0
	.word VKITFLESH1E,0
	.word VKITFLESH1F,0
	.word VKITFLESH1G,0
	.word VKITBLUE1A,KTBLUE2_P
	.word VKITBLUE1B,KTBLUE2_P
	.word VKITBLUE1C,KTBLUE2_P
	.word VKITBLUE1D,KTBLUE2_P
	.word VKITBLUE1E,KTBLUE2_P
	.word	0
	
	.globl jade_pieces
jade_pieces:
	.half	0x5d,0x3d+30,0x135,0x3d+30
	.word VJADFGRAY1A,0
	.word VJADFGRAY1B,0
	.word VJADFGRAY1C,0
	.word VJADFGRAY1D,0
	.word VJADFGRAY1E,0
	.word VJADFGRAY1F,0
	.word VJADFGRAY1G,0
	.word VJADFLESH1A,0
	.word VJADFLESH1B,0
	.word VJADFLESH1C,0
	.word VJADFLESH1D,0
	.word VJADFLESH1E,0
	.word VJADFLESH1F,0
	.word VJADFLESH1G,0
	.word VJADFLESH1H,0
	.word VJADFLESH1I,0
	.word VJADGREEN1A,JDGRN2_P
	.word VJADGREEN1B,JDGRN2_P
	.word VJADGREEN1C,JDGRN2_P
	.word VJADGREEN1D,JDGRN2_P
	.word VJADGREEN1E,JDGRN2_P
	.word VJADGREEN1F,JDGRN2_P
	.word 0
	
	.globl mileena_pieces
mileena_pieces:
	.half	0x5d,0x3d+29,0x135,0x3d+29
	.word VJADFGRAY1A,0
	.word VJADFGRAY1B,0
	.word VJADFGRAY1C,0
	.word VJADFGRAY1D,0
	.word VJADFGRAY1E,0
	.word VJADFGRAY1F,0
	.word VJADFGRAY1G,0
	.word VMILFLESH1A,0
	.word VMILFLESH1B,0
	.word VMILFLESH1C,0
	.word VMILFLESH1D,0
	.word VMILFLESH1E,0
	.word VMILFLESH1F,0
	.word VMILFLESH1G,0
	.word VMILFLESH1H,0
	.word VMILFLESH1I,0
	.word VMILGREEN1A,MLPURP2_P
	.word VMILGREEN1B,MLPURP2_P
	.word VMILGREEN1C,MLPURP2_P
	.word VMILGREEN1D,MLPURP2_P
	.word VMILGREEN1E,MLPURP2_P
	.word VMILGREEN1F,MLPURP2_P
	.word 0

	.globl kamel_pieces
kamel_pieces:
	.half	0x5d,0x3d+29,0x135,0x3d+29
	.word VJADFGRAY1A,0
	.word VJADFGRAY1B,0
	.word VJADFGRAY1C,0
	.word VJADFGRAY1D,0
	.word VJADFGRAY1E,0
	.word VJADFGRAY1F,0
	.word VJADFGRAY1G,0
	.word VMILFLESH1A,JDFLESH_P
	.word VMILFLESH1B,JDFLESH_P
	.word VMILFLESH1C,JDFLESH_P
	.word VMILFLESH1D,JDFLESH_P
	.word VMILFLESH1E,JDFLESH_P
	.word VMILFLESH1F,JDFLESH_P
	.word VMILFLESH1G,JDFLESH_P
	.word VMILFLESH1H,JDFLESH_P
	.word VMILFLESH1I,JDFLESH_P
	.word VKAMGREEN1A,0
	.word VKAMGREEN1B,0
	.word VKAMGREEN1C,0
	.word VKAMGREEN1D,0
	.word VKAMGREEN1E,0
	.word VKAMGREEN1F,0
	.word 0
	
	
VKITGRAY1A:
	.word KITGRAY1A
	.word 0
VKITGRAY1B:
	.word KITGRAY1B
	.word 0
VKITGRAY1C:
	.word KITGRAY1C
	.word 0
VKITFLESH1A:
	.word KITFLESH1A
	.word 0
VKITFLESH1B:
	.word KITFLESH1B
	.word 0
VKITFLESH1C:
	.word KITFLESH1C
	.word 0
VKITFLESH1D:
	.word KITFLESH1D
	.word 0
VKITFLESH1E:
	.word KITFLESH1E
	.word 0
VKITFLESH1F:
	.word KITFLESH1F
	.word 0
VKITFLESH1G:
	.word KITFLESH1G
	.word 0
VKITBLUE1A:
	.word KITBLUE1A
	.word 0
VKITBLUE1B:
	.word KITBLUE1B
	.word 0
VKITBLUE1C:
	.word KITBLUE1C
	.word 0
VKITBLUE1D:
	.word KITBLUE1D
	.word 0
VKITBLUE1E:
	.word KITBLUE1E
	.word 0
VJADFGRAY1A:
	.word JADFGRAY1A
	.word 0
VJADFGRAY1B:
	.word JADFGRAY1B
	.word 0
VJADFGRAY1C:
	.word JADFGRAY1C
	.word 0
VJADFGRAY1D:
	.word JADFGRAY1D
	.word 0
VJADFGRAY1E:
	.word JADFGRAY1E
	.word 0
VJADFGRAY1F:
	.word JADFGRAY1F
	.word 0
VJADFGRAY1G:
	.word JADFGRAY1G
	.word 0
VJADFLESH1A:
	.word JADFLESH1A
	.word 0
	.word 0
VJADFLESH1B:
	.word JADFLESH1B
	.word 0
VJADFLESH1C:
	.word JADFLESH1C
	.word 0
VJADFLESH1D:
	.word JADFLESH1D
	.word 0
VJADFLESH1E:
	.word JADFLESH1E
	.word 0
VJADFLESH1F:
	.word JADFLESH1F
	.word 0
VJADFLESH1G:
	.word JADFLESH1G
	.word 0
VJADFLESH1H:
	.word JADFLESH1H
	.word 0
VJADFLESH1I:
	.word JADFLESH1I
	.word 0
VMILFLESH1A:
	.word MILFLESH1A
	.word 0
VMILFLESH1B:
	.word MILFLESH1B
	.word 0
VMILFLESH1C:
	.word MILFLESH1C
	.word 0
VMILFLESH1D:
	.word MILFLESH1D
	.word 0
VMILFLESH1E:
	.word MILFLESH1E
	.word 0
VMILFLESH1F:
	.word MILFLESH1F
	.word 0
VMILFLESH1G:
	.word MILFLESH1G
	.word 0
VMILFLESH1H:
	.word MILFLESH1H
	.word 0
VMILFLESH1I:
	.word MILFLESH1I
	.word 0
VJADGREEN1A:
	.word JADGREEN1A
	.word 0
VJADGREEN1B:
	.word JADGREEN1B
	.word 0
VJADGREEN1C:
	.word JADGREEN1C
	.word 0
VJADGREEN1D:
	.word JADGREEN1D
	.word 0
VJADGREEN1E:
	.word JADGREEN1E
	.word 0
VJADGREEN1F:
	.word JADGREEN1F
	.word 0
VMILGREEN1A:
	.word MILGREEN1A
	.word 0
VMILGREEN1B:
	.word MILGREEN1B
	.word 0
VMILGREEN1C:
	.word MILGREEN1C
	.word 0
VMILGREEN1D:
	.word MILGREEN1D
	.word 0
VMILGREEN1E:
	.word MILGREEN1E
	.word 0
VMILGREEN1F:
	.word MILGREEN1F
	.word 0

VKAMGREEN1A:
	.word KAMGREEN1A
	.word 0
VKAMGREEN1B:
	.word KAMGREEN1B
	.word 0
VKAMGREEN1C:
	.word KAMGREEN1C
	.word 0
VKAMGREEN1D:
	.word KAMGREEN1D
	.word 0
VKAMGREEN1E:
	.word KAMGREEN1E
	.word 0
VKAMGREEN1F:
	.word KAMGREEN1F
	.word 0
	
KITGRAY1A:
	.word 0x00000000
	.half 141, 86, 92, -22
	.word   KTGRAY_P
KITGRAY1B:
	.word 0x00001358
	.half 139, 15, 6, -24
	.word   KTGRAY_P
KITGRAY1C:
	.word 0x000016C8
        .half 164, 42, -9, 1
	.word   KTGRAY_P
KITFLESH1A:
	.word 0x00001CFC
        .half 20, 18, 55, -24
	.word   KTFLESH_P
KITFLESH1B:
	.word 0x00001DA4
	.half 23, 22, 37, -22
	.word   KTFLESH_P
KITFLESH1C:
	.word 0x00001E8C
	.half 22, 26, 12, -33
	.word   KTFLESH_P
KITFLESH1D:
	.word 0x00001FD0
	.half 26, 26, 36, -137
	.word   KTFLESH_P
KITFLESH1E:
	.word 0x00002188
	.half 71, 27, -25, -65
	.word   KTFLESH_P
KITFLESH1F:
	.word 0x000024B4
	.half 50, 34, -18, -9
	.word   KTFLESH_P
KITFLESH1G:
	.word 0x000027E4
	.half 89, 26, -3, -74
	.word   KTFLESH_P
KITBLUE1A:
	.word 0x00002BF0
        .half 9, 39, 28, -20
	.word   KTBLUE1_P
KITBLUE1B:
	.word 0x00002C80
	.half 51, 33, 22, -93
	.word   KTBLUE1_P
KITBLUE1C:
	.word 0x00002F68
	.half 8, 7, -8, -53
	.word   KTBLUE1_P
KITBLUE1D:
	.word 0x00002F9C
	.half 47, 11, -26, -61
	.word   KTBLUE1_P
KITBLUE1E:
	.word 0x000030DC
        .half 24, 33, -18, -34
	.word   KTBLUE1_P
JADFGRAY1A:
	.word 0x000032A0
	.half 34, 61, 60, -19
	.word   JDGRAY_P
JADFGRAY1B:
	.word 0x00003514
	.half 54, 27, 36, -110
	.word   JDGRAY_P
JADFGRAY1C:
	.word 0x00003614
        .half 94, 22, 9, -70
	.word   JDGRAY_P
JADFGRAY1D:
	.word 0x000037AC
	.half 17, 18, -32, -105
	.word   JDGRAY_P
JADFGRAY1E:
	.word 0x00003860
	.half 54, 35, -49, -97
	.word   JDGRAY_P
JADFGRAY1F:
	.word 0x00003A5C
        .half 3, 15, -28, -27
	.word   JDGRAY_P
JADFGRAY1G:
	.word 0x00003A78
	.half 146, 41, -2, 0
	.word   JDGRAY_P
MILFLESH1A:
	.word 0x00003EA4
	.half 22, 15, 68, -22
	.word   MILFLESH_P
MILFLESH1B:
	.word 0x00003F64
	.half 31, 22, 53, -19
	.word   MILFLESH_P
MILFLESH1C:
	.word 0x000040A0
	.half 40, 32, 25, -35
	.word   MILFLESH_P
MILFLESH1D:
	.word 0x00004364
	.half 32, 30, 47, -132
	.word   MILFLESH_P
MILFLESH1E:
	.word 0x00004574
        .half 20, 11, -2, -144
	.word   MILFLESH_P
MILFLESH1F:
	.word 0x000045DC
	.half 45, 34, -9, -10
	.word   MILFLESH_P
MILFLESH1G:
	.word 0x00004888
	.half 44, 19, -27, -65
	.word   MILFLESH_P
MILFLESH1H:
	.word 0x00004A4C
	.half 32, 26, -35, -119
	.word   MILFLESH_P
MILFLESH1I:
	.word 0x00004BF0
	.half 64, 23, 1, -69
	.word   MILFLESH_P
JADFLESH1A:
	.word 0x00003EA4
	.half 22, 15, 68, -22
	.word   JDFLESH_P
JADFLESH1B:
	.word 0x00003F64
	.half 31, 22, 53, -19
	.word   JDFLESH_P
JADFLESH1C:
	.word 0x000040A0
	.half 40, 32, 25, -35
	.word   JDFLESH_P
JADFLESH1D:
	.word 0x00004364
	.half 32, 30, 47, -132
	.word   JDFLESH_P
JADFLESH1E:
	.word 0x00004574
        .half 20, 11, -2, -144
	.word   JDFLESH_P
JADFLESH1F:
	.word 0x000045DC
	.half 45, 34, -9, -10
	.word   JDFLESH_P
JADFLESH1G:
	.word 0x00004888
	.half 44, 19, -27, -65
	.word   JDFLESH_P
JADFLESH1H:
	.word 0x00004A4C
	.half 32, 26, -35, -119
	.word   JDFLESH_P
JADFLESH1I:
	.word 0x00004BF0
	.half 64, 23, 1, -69
	.word   JDFLESH_P
	
JADGREEN1A:
	.word 0x00004F1C
	.half 7, 39, 45, -17
	.word JDGRN1_P	
JADGREEN1B:
	.word 0x00004FB4
	.half 26, 32, -12, -30
	.word JDGRN1_P	
JADGREEN1C:
	.word 0x00005170
	.half 15, 7, -59, -122
	.word JDGRN1_P	
JADGREEN1D:
	.word 0x000051C8
	.half 65, 25, -10, -70
	.word JDGRN1_P	
JADGREEN1E:
	.word 0x00005388
        .half 11, 9, -1, -131
	.word JDGRN1_P	
JADGREEN1F:
	.word 0x000053D4
	.half 85, 39, 28, -54
	.word JDGRN1_P	
	
MILGREEN1A:
	.word 0x00004F1C
	.half 7, 39, 45, -17
	.word   MLPURP1_P
MILGREEN1B:
	.word 0x00004FB4
	.half 26, 32, -12, -30
	.word   MLPURP1_P
MILGREEN1C:
	.word 0x00005170
	.half 15, 7, -59, -122
	.word   MLPURP1_P
MILGREEN1D:
	.word 0x000051C8
	.half 65, 25, -10, -70
	.word   MLPURP1_P
MILGREEN1E:
	.word 0x00005388
        .half 11, 9, -1, -131
	.word   MLPURP1_P
MILGREEN1F:
	.word 0x000053D4
	.half 85, 39, 28, -54
	.word   MLPURP1_P
	
KAMGREEN1A:
	.word 0x00004F1C
	.half 7, 39, 45, -17
	.word   KAMGREY_P
KAMGREEN1B:
	.word 0x00004FB4
	.half 26, 32, -12, -30
	.word   KAMGREY_P
KAMGREEN1C:
	.word 0x00005170
	.half 15, 7, -59, -122
	.word   KAMGREY_P
KAMGREEN1D:
	.word 0x000051C8
	.half 65, 25, -10, -70
	.word   KAMGREY_P
KAMGREEN1E:
	.word 0x00005388
        .half 11, 9, -1, -131
	.word   KAMGREY_P
KAMGREEN1F:
	.word 0x000053D4
	.half 85, 39, 28, -54
	.word   KAMGREY_P
	
	.align 2
	.globl fninja_dict
fninja_dict:	
#include "fninja.dct"

