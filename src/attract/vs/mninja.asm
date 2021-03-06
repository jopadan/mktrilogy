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

mninja_list
;scorpion
	.long	VSCORPGRAY1A
	.long	VSCORPGRAY1B
	.long	VSCORPGRAY1C
	.long	VSCORPGRAY1D
	.long	VSCORPGRAY1E
	.long	VSCORPGRAY1F
	.long	VSCORPGRAY1G
	.long	VSCORPGRAY1H
	.long	VSCORPFLESH1A
	.long	VSCORPFLESH1B
	.long	VSCORPFLESH1C
	.long	VSCORPFLESH1D
	.long	VSCORPFLESH1E
	.long	VSCORPYELO1A
	.long	VSCORPYELO1B
	.long	VSCORPYELO1C
	.long	VSCORPYELO1D
	.long	VSCORPYELO1E
;reptile
	.long	VREPGRAY1A
	.long	VREPGRAY1B
	.long	VREPGRAY1C
	.long	VREPGRAY1D
	.long	VREPFLESH1A
	.long	VREPFLESH1B
	.long	VREPFLESH1C
	.long	VREPFLESH1D
	.long	VREPGREEN1A
	.long	VREPGREEN1B
	.long	VREPGREEN1C
	.long	VREPGREEN1D
	.long	VREPGREEN1E

;ermac (REPTILE)
;oldsz (REPTILE)
;oldsmoke (SCORP)
;noob (SCORP)
;rain


VSCORPGRAY1A
	.long	SCORPGRAY1A,0
VSCORPGRAY1B
	.long	SCORPGRAY1B,0
VSCORPGRAY1C
	.long	SCORPGRAY1C,0
VSCORPGRAY1D
	.long	SCORPGRAY1D,0
VSCORPGRAY1E
	.long	SCORPGRAY1E,0
VSCORPGRAY1F
	.long	SCORPGRAY1F,0
VSCORPGRAY1G
	.long	SCORPGRAY1G,0
VSCORPGRAY1H
	.long	SCORPGRAY1H,0
VSCORPFLESH1A
	.long	SCORPFLESH1A,0
VSCORPFLESH1B
	.long	SCORPFLESH1B,0
VSCORPFLESH1C
	.long	SCORPFLESH1C,0
VSCORPFLESH1D
	.long	SCORPFLESH1D,0
VSCORPFLESH1E
	.long	SCORPFLESH1E,0
VSCORPYELO1A	
	.long	SCORPYELO1A,0
VSCORPYELO1B	
	.long	SCORPYELO1B,0
VSCORPYELO1C	
	.long	SCORPYELO1C,0
VSCORPYELO1D	
	.long	SCORPYELO1D,0
VSCORPYELO1E
	.long	SCORPYELO1E,0


VREPGRAY1A	
	.long	REPGRAY1A,0
VREPGRAY1B	
	.long	REPGRAY1B,0
VREPGRAY1C	
	.long	REPGRAY1C,0
VREPGRAY1D	
	.long	REPGRAY1D,0
VREPFLESH1A	
	.long	REPFLESH1A,0
VREPFLESH1B	
	.long	REPFLESH1B,0
VREPFLESH1C	
	.long	REPFLESH1C,0
VREPFLESH1D	
	.long	REPFLESH1D,0
VREPGREEN1A	
	.long	REPGREEN1A,0
VREPGREEN1B	
	.long	REPGREEN1B,0
VREPGREEN1C	
	.long	REPGREEN1C,0
VREPGREEN1D	
	.long	REPGREEN1D,0
VREPGREEN1E	
	.long	REPGREEN1E,0

	.end
	