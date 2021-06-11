#include <regdef.h>
#include "mkchar.inc"

	.option	pic0
	.set	noreorder
	.data

anj_anitab1:
	.word a_vomit
	
a_vomit:
	.word ACIDVOMIT1
	.word ACIDVOMIT5
	.word ACIDVOMIT9
	.word ACIDVOMIT11
	.word 0
	.word ACIDVOMIT15
	.word ACIDVOMIT19
	.word ACIDVOMIT21
	.word ACIDVOMIT25
	.word 0
	
ACIDVOMIT1:
	.word ACIDVOMIT1_SUB, 0
ACIDVOMIT1_SUB:
	.word ACIDVOMIT1_IMG
	.half 11, 15, -26, -1
	.word RPACID_P
ACIDVOMIT5:
	.word ACIDVOMIT5_SUB, 0
ACIDVOMIT5_SUB:
	.word ACIDVOMIT5_IMG
	.half 50, 86, -31, 24
ACIDVOMIT9:
	.word ACIDVOMIT9_SUB, 0
ACIDVOMIT9_SUB:
	.word ACIDVOMIT9_IMG
	.half 104, 56, -57, 11
ACIDVOMIT11:
	.word ACIDVOMIT11_SUB, 0
ACIDVOMIT11_SUB:
	.word ACIDVOMIT11_IMG
	.half 125, 65, -48, 6
ACIDVOMIT15:
	.word ACIDVOMIT15_SUB, 0
ACIDVOMIT15_SUB:
	.word ACIDVOMIT15_IMG
	.half 124, 94, -34, 0
ACIDVOMIT19:
	.word ACIDVOMIT19_SUB, 0
ACIDVOMIT19_SUB:
	.word ACIDVOMIT19_IMG
	.half 123, 111, -26, -1
ACIDVOMIT21:
	.word ACIDVOMIT21_SUB, 0
ACIDVOMIT21_SUB:
	.word ACIDVOMIT21_IMG
	.half 124, 118, -23, -1
ACIDVOMIT25:
	.word ACIDVOMIT25_SUB, 0
ACIDVOMIT25_SUB:
	.word ACIDVOMIT25_IMG
	.half 32, 118, -23, -93
	
	.align 2
#include "rpf264.att" 