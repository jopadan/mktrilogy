**************************************************************************
*											     *
*  mk3 - VS Stuff
*											     *
**************************************************************************
	.FILE	'mkst.asm'
	.WIDTH	132
	.OPTION	B,D,L,T
	.MNOLIST

	.include mainequ.asm
	.include imgtbl.glo
	.include sysequ.asm
	.include shang.tbl
	.text

fninja_list
;kitana_list
	.long	VKITGRAY1A
	.long	VKITGRAY1B
	.long	VKITGRAY1C
	.long	VKITFLESH1A
	.long	VKITFLESH1B
	.long	VKITFLESH1C
	.long	VKITFLESH1D
	.long	VKITFLESH1E
	.long	VKITFLESH1F
	.long	VKITFLESH1G
	.long	VKITBLUE1A
	.long	VKITBLUE1B
	.long	VKITBLUE1C
	.long	VKITBLUE1D
	.long	VKITBLUE1E
;jade_list
	.long	VJADFGRAY1A
	.long	VJADFGRAY1B
	.long	VJADFGRAY1C
	.long	VJADFGRAY1D
	.long	VJADFGRAY1E
	.long	VJADFGRAY1F
	.long	VJADFGRAY1G
	.long	VJADFLESH1A
	.long	VJADFLESH1B
	.long	VJADFLESH1C
	.long	VJADFLESH1D
	.long	VJADFLESH1E
	.long	VJADFLESH1F
	.long	VJADFLESH1G
	.long	VJADFLESH1H
	.long	VJADFLESH1I
	.long	VJADGREEN1A
	.long	VJADGREEN1B
	.long	VJADGREEN1C
	.long	VJADGREEN1D
	.long	VJADGREEN1E
	.long	VJADGREEN1F
;mil USES JADE WITH SPECIFIC PALETTE CHANGES

VKITGRAY1A	
	.long	KITGRAY1A,0
VKITGRAY1B	
	.long	KITGRAY1B,0
VKITGRAY1C
	.long	KITGRAY1C,0
VKITFLESH1A	
	.long	KITFLESH1A,0
VKITFLESH1B	
	.long	KITFLESH1B,0
VKITFLESH1C	
	.long	KITFLESH1C,0
VKITFLESH1D	
	.long	KITFLESH1D,0
VKITFLESH1E	
	.long	KITFLESH1E,0
VKITFLESH1F	
	.long	KITFLESH1F,0
VKITFLESH1G	
	.long	KITFLESH1G,0
VKITBLUE1A	
	.long	KITBLUE1A,0
VKITBLUE1B	
	.long	KITBLUE1B,0
VKITBLUE1C	
	.long	KITBLUE1C,0
VKITBLUE1D	
	.long	KITBLUE1D,0
VKITBLUE1E
	.long	KITBLUE1E,0
	
VJADFGRAY1A
	.long	JADFGRAY1A,0
VJADFGRAY1B
	.long	JADFGRAY1B,0
VJADFGRAY1C
	.long	JADFGRAY1C,0
VJADFGRAY1D
	.long	JADFGRAY1D,0
VJADFGRAY1E
	.long	JADFGRAY1E,0
VJADFGRAY1F
	.long	JADFGRAY1F,0
VJADFGRAY1G
	.long	JADFGRAY1G,0
VJADFLESH1A
	.long	JADFLESH1A,0
VJADFLESH1B
	.long	JADFLESH1B,0
VJADFLESH1C
	.long	JADFLESH1C,0
VJADFLESH1D
	.long	JADFLESH1D,0
VJADFLESH1E
	.long	JADFLESH1E,0
VJADFLESH1F
	.long	JADFLESH1F,0
VJADFLESH1G
	.long	JADFLESH1G,0
VJADFLESH1H
	.long	JADFLESH1H,0
VJADFLESH1I
	.long	JADFLESH1I,0
VJADGREEN1A
	.long	JADGREEN1A,0
VJADGREEN1B
	.long	JADGREEN1B,0
VJADGREEN1C
	.long	JADGREEN1C,0
VJADGREEN1D
	.long	JADGREEN1D,0
VJADGREEN1E
	.long	JADGREEN1E,0
VJADGREEN1F
	.long  	JADGREEN1F,0

	.end
	