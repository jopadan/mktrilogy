//////////////////////////////////////////////////////////////////////////////////////////
// bench.h
//
// Author: David Schwartz
//////////////////////////////////////////////////////////////////////////////////////////
// THIS CODE IS PROPRIETARY PROPERTY OF WILLIAMS ENTERTAINMENT.
//
// The contents of this file may not be disclosed to third
// parties, copied or duplicated in any form, in whole or in part,
// without the prior written permission of Williams Entertainment.
//////////////////////////////////////////////////////////////////////////////////////////

#ifndef BENCH_H
#define BENCH_H 0

#include "stopwatch.h"


//========================================================================================
// Public definitions:

#define BENCH		0		// 1=print system benchmarks, 0=no system benchmarking
#define BENCHGFX	0		// 1=print gfx benchmarks (BENCH must be 1 also), 0=no gfx benchmarking


#if BENCH

enum BENCH_SW {
	BENCHSW_RSP_WORKING_GFX,		// RSP is processing GFX data
	BENCHSW_RSP_WORKING_AUD,		// RSP is processing audio data
	BENCHSW_RSP_IDLE,				// RSP is waiting idle
	BENCHSW_RDP_WORKING,			// RDP is processing GFX data
	BENCHSW_RDP_IDLE,				// RDP is waiting idle
	BENCHSW_CPU_WORKING,			// CPU is filling the GFX list
	BENCHSW_CPU_IDLE,				// CPU is waiting for the next display list buffer

	BENCHSW_MAX
};

extern struct stopwatch benchsw[BENCHSW_MAX];
extern float bench_displayed_frames;
extern float bench_total_dlists;
extern int bench_online;


//========================================================================================
// Private definitions:

#define BENCH_PRINT_SECS			5
#define BENCH_SECS_TO_ONLINE		5

#define BENCH_PRINT_TICKS			(BENCH_PRINT_SECS * SYS_FRAMES_PER_SEC)
#define BENCH_TICKS_TO_ONLINE		(BENCH_SECS_TO_ONLINE * SYS_FRAMES_PER_SEC)


//========================================================================================
// Public functions:

//////////////////////////////////////////////////////////////////////////////////////////
// bench_reset - resets the specified benchmark time to zero.
//////////////////////////////////////////////////////////////////////////////////////////
extern void bench_reset( int bench );


//////////////////////////////////////////////////////////////////////////////////////////
// bench_reset_all - resets all benchmark times to zero.
//////////////////////////////////////////////////////////////////////////////////////////
extern void bench_reset_all( void );


//////////////////////////////////////////////////////////////////////////////////////////
// bench_start - starts the specified benchmark time.
//////////////////////////////////////////////////////////////////////////////////////////
extern void bench_start( int bench );


//////////////////////////////////////////////////////////////////////////////////////////
// bench_stop - stops the benchmark and adds the delta time since it was started.
//////////////////////////////////////////////////////////////////////////////////////////
extern void bench_stop( int bench );


//////////////////////////////////////////////////////////////////////////////////////////
// bench_val - returns the specified benchmark time in seconds (or 0 if none).
//////////////////////////////////////////////////////////////////////////////////////////
extern double bench_val( int bench );


//////////////////////////////////////////////////////////////////////////////////////////
// bench_reset_gfx - resets the gfx benchmark counters.
//////////////////////////////////////////////////////////////////////////////////////////
extern void bench_reset_gfx( void );


#if BENCHGFX
//////////////////////////////////////////////////////////////////////////////////////////
// bench_gfx - walks the specified gfx list and collects statistics.
//
// g must be a KSEG0 address.
//////////////////////////////////////////////////////////////////////////////////////////
extern void bench_gfx( Gfx *g );
#endif


//////////////////////////////////////////////////////////////////////////////////////////
// bench_print - prints the benchmark results every BENCH_PRINT_SECS seconds.
//////////////////////////////////////////////////////////////////////////////////////////
extern void bench_print( void );


#endif
#endif
