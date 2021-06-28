/******************************************************************************
 File: oslibmain.c

 Date: Jan 1996

 (C) Williams Entertainment

 Mortal Kombat III U64 SPECIFIC ROUTINES
******************************************************************************/

#define VID_TRACK_EVENTS	0

/* INCLUDES */
#include "oslibmain.h"
#include "sys_defs.h"

#include "romcopy.h"
#include "gamepad.h"

#include "mkbkgd.h"
#include "mkobj.h"
#include "mkos.h"
#include "mkgame.h"
#include "mkpal.h"
#include "mkmain.h"
#include "mkinit.h"
#include "mkutil.h"
#include "mkjoy.h"
#include "mkguys.h"
#include "mkdma.h"
#include "bench.h"
#include "inflate.h"

#include "wessapi.h"	// audio stuff...
#include "seqload.h"
#include "mksound.h"

//******************************************************************************
//******************************************************************************
//			Ultra 64 Startup Code (Begin)
//******************************************************************************
//******************************************************************************
#if SYS_DEBUG
	#define WAIT_FOR_DUBUGGER_TO_START_MAIN_THREAD		0
#else
	#define WAIT_FOR_DUBUGGER_TO_START_MAIN_THREAD		SYS_DEBUG
#endif

extern char _kernelSegmentStart[], _kernelSegmentEnd[];
extern char _initSegmentStart[];

extern u16 cfb[2][BUFFER_WIDTH*BUFFER_HEIGHT];
extern OSTask	vid_rsptask;

//========================================================================================
// Public variables:

u64 boot_stack[ SYS_BOOT_STACKSIZE/8 ];

int audio_init=0;

//========================================================================================
// Private variables:

static OSThread	idle_thread;
static u64		idle_stack[ SYS_IDLE_STACKSIZE/8 ];

#if SYS_DEBUG
static OSThread	rmon_thread;
static u64		rmon_stack[ 2*RMON_STACKSIZE/8 ];
#endif

static OSThread	main_thread;
static u64		main_stack[ SYS_MAIN_STACKSIZE/8 ];

static OSMesg		msgbuf_Pi[ SYS_MSGBUF_SIZE_PI ];
static OSMesgQueue	msgque_Pi;

static OSThread vid_vbi_thread;
static u64 vid_vbi_stack[ SYS_VBI_STACKSIZE/8 ];


OSTask *vid_next_atask;		// audio task to be started on next VBI
OSTask *vid_atask_ready;		// audio task ready for submission
OSTask *vid_rsp_atask;		// audio task being processed by RSP
volatile short gfx_yielded;	// 1=gfx task yeild request has been sent to rsp
short vid_rsp_atask_submitted;	// 1=audio task has been submitted to RSP

//========================================================================================
// Prototypes:

void main( void *arg );
static void idle( void *arg );
void mk3_main(short);
void init_audio(void);

void kickstart_event( void );
void rsp_event( void );
void rdp_event( void );
void vbi_event( void );
void kickstart_event( void );
void prenmi_event( void );
void kickstart( void );
void start_rsp( OSTask *task );
void init_rsp_packet( int dindex );

void dict_uncompress_64_final(uchar *src, uchar *dst, uchar *dict);
void new_dict_uncompress_64(BYTE *src, BYTE *dst, BYTE *dict);
void dict_uncompress_32_final(uchar *src, uchar *dst, uchar *dict);
void new_dict_uncompress_32(BYTE *src, BYTE *dst, BYTE *dict);
void uncompress_16(BYTE *src, BYTE *dst);
void uncompress_8(BYTE *src, BYTE *dst);
void NHunsimpleRLE(uchar *src, uchar *dst);

//========================================================================================
// Public functions:
static int debug_flag=0;
int mk_dbug=0;

static long ecs_imask;
void EnterCriticalSection(void) 
{
	ecs_imask=sys_disable_ints();
	return;
}

void ExitCriticalSection(void) 
{
	sys_restore_ints(ecs_imask);
	return;
}


//////////////////////////////////////////////////////////////////////////////////////////
// kstart_entry - kernel entry called by the U64 bootstrap loader upon power-up.
//
// Performs the following:
//     1) initializes the U64 operating system,
//     3) creates and starts the idle thread
//////////////////////////////////////////////////////////////////////////////////////////
void kstart_entry( void ) 
{
	int i;
    char *ap;
    u32 *argp;
    u32 argbuf[16];
	

//----------------------------------------------------------------------------------------
// Re-initialize U64 operating system...

	osInitialize();


//----------------------------------------------------------------------------------------
// Parse Any Arguments
#if SYS_DEBUG==1
    argp = (u32 *)RAMROM_APP_WRITE_ADDR;
    for (i=0; i<sizeof(argbuf)/4; i++, argp++) {
	osPiRawReadIo((u32)argp, &argbuf[i]); /* Assume no DMA */
    }
    /* Parse the options */
    ap = (char *)argbuf;
    while (*ap != '\0') {
	while (*ap == ' ')
	    ap++;
	if ( *ap == '-' && *(ap+1) == 'd') {
	    debug_flag = 1;
	    ap += 2;
	}
	}
#endif

//----------------------------------------------------------------------------------------
// Create and start idle thread...

	osCreateThread(
		&idle_thread,
		SYS_THREAD_ID_IDLE,
		idle,
		0,
		idle_stack + SYS_IDLE_STACKSIZE/8,
		0
	);

	osStartThread( &idle_thread );
}


//////////////////////////////////////////////////////////////////////////////////////////
// idle - idle thread created and started by kstart_entry.
//
// Always begins with these:
//     1) creates and starts the Vi manager and inits the video mode,
//     2) initializes the Pi manager.
//
// If SYS_DEBUG, performs these next:
//     1) creates and starts the rmon thread,
//     2) creates the main thread,
//     3) sleeps until the debugger starts the main thread manually.
//
// If !SYS_DUBUG, performs these next:
//     1) creates and starts the main thread.
//
//////////////////////////////////////////////////////////////////////////////////////////
static void idle( void *arg ) 
{

//----------------------------------------------------------------------------------------
// Create and start the Pi manager...

	osCreatePiManager( (OSPri)OS_PRIORITY_PIMGR, &msgque_Pi, msgbuf_Pi, SYS_MSGBUF_SIZE_PI );

//----------------------------------------------------------------------------------------
// DEBUG ONLY: Create and start rmon thread...

#if SYS_DEBUG
	osCreateThread(
		&rmon_thread,
		SYS_THREAD_ID_RMON,
		rmonMain,
		(void *)0,
		rmon_stack + 2*RMON_STACKSIZE/8,
		OS_PRIORITY_RMON
	);

	osStartThread( &rmon_thread );
#endif

//----------------------------------------------------------------------------------------
// Create main thread...

	osCreateThread(
		&main_thread,
		SYS_THREAD_ID_MAIN,
		main,
		0,
		main_stack + SYS_MAIN_STACKSIZE/8,
		SYS_MAIN_THREAD_PRIORITY
	);
//----------------------------------------------------------------------------------------
// RETAIL ONLY: Start main thread...

#if SYS_DEBUG==1
	if (debug_flag==0)
		osStartThread( &main_thread );
#else		
		osStartThread( &main_thread );
#endif

//----------------------------------------------------------------------------------------
// Idle loop...

	for(;;);
}


//////////////////////////////////////////////////////////////////////////////////////////
// main - kernel main thread called by kstart.
//
// Performs the following:
//   1) initializes the system memory map
//	 2) prints startup info,
//   3) loads and executes the kernel initialization overlay,
//   4) unloads the kernel initialization overlay and jumps to cusa_main
//
// If SYS_DEBUG, performs these next:
//   1) lowers the main thread's priority to zero,
//   2) pauses the U64 operating system,
//   3) exits
//////////////////////////////////////////////////////////////////////////////////////////
void main( void *arg ) 
{
	u32 ovhandle;

	printf(("MORTAL KOMBAT TRILOGY (U64) LIVES! %x\n",main_stack));
	
//----------------------------------------------------------------------------------------
// Create and start romcopy thread...

	osCreateMesgQueue( &romcopy_msgque, &romcopy_msgbuf, 1 );

	osCreateThread(
		&romcopy_thread,
		SYS_THREAD_ID_ROMCOPY,
		romcopy_wait_thread,
		(void *)0,
		romcopy_stack + SYS_ROMCOPY_STACKSIZE/8,
		SYS_ROMCOPY_THREAD_PRIORITY
	);
	osStartThread( &romcopy_thread );		// will return immediately

//----------------------------------------------------------------------------------------
// Initialize kernel...
	init_hardware_system();
//----------------------------------------------------------------------------------------
// Jump to main loop...
	mk3_main(mk_dbug);				// can return only in DEBUG mode

//----------------------------------------------------------------------------------------
// DEBUG ONLY: Exit from executable...

#if SYS_DEBUG
	osSetThreadPri( 0, 0 );		// lower current thread's priority to zero
	osExit();
#endif
}

extern u64 gfx_ybuf[];

OSTask	vid_rsptask =						/* Task descriptor */
{
    M_GFXTASK,			/* task type */
    OS_TASK_DP_WAIT,		/* task flags */
    (u64 *)rspbootTextStart,		/* boot ucode pointer */
    0,	/* boot ucode size */
    (u64 *)gspFast3DTextStart,		/* task ucode pointer */
    SP_UCODE_SIZE,		/* task ucode size */
    (u64 *)gspFast3DDataStart,			/* task ucode data pointer */
    SP_UCODE_DATA_SIZE,		/* task ucode data size */
    sys_rcp_stack,		/* task dram stack pointer */
    SP_DRAM_STACK_SIZE8,	/* task dram stack size */
    NULL,		/* task output buffer ptr (not always used) */
    0,			/* task output buffer size ptr */
    NULL,			/* task data pointer (fill in later) */
    0,				/* task data size (fill in later) */
    gfx_ybuf,			/* task yield buffer ptr (not used here) */
    OS_YIELD_DATA_SIZE			/* task yield buffer size (not used here) */
};

/******************************************************************************
 Function: void init_hardware_system(void)

 By: David Schwartz

 Date: Aug 9, 1994

 Parameters: None

 Returns: None

 Description:	VBLANK ROUTINE
******************************************************************************/
void init_hardware_system(void)
{
	int i, j;

	/* init joy remap stuff */
	game_map_tbl[0]=pad1_map_tbl[0]=pad2_map_tbl[0]=0x0004;				//r1,run
	game_map_tbl[1]=pad1_map_tbl[1]=pad2_map_tbl[1]=0x0008;				//l1,block

	game_map_tbl[2]=0x0008;			//r2,run
	game_map_tbl[3]=0x0004;			//l2,block
	pad1_map_tbl[2]=pad2_map_tbl[2]=0x0010;			//r2,run
	pad1_map_tbl[3]=pad2_map_tbl[3]=0x0080;			//l2,block

	game_map_tbl[4]=0x0010;			//triangle, hk
	pad1_map_tbl[4]=pad2_map_tbl[4]=0x0008;			//triangle, hk
	
	game_map_tbl[5]=pad1_map_tbl[5]=pad2_map_tbl[5]=0x0020;			//circle, lk
	game_map_tbl[6]=pad1_map_tbl[6]=pad2_map_tbl[6]=0x0040;			//x, lp
	
	game_map_tbl[7]=0x0080;			//square, hp
	pad1_map_tbl[7]=pad2_map_tbl[7]=0x0004;			//square, hp
	
	game_map_tbl[8]=pad1_map_tbl[8]=pad2_map_tbl[8]=0x0100;			//coll box, (SELECT BUTTON)
	game_map_tbl[9]=pad1_map_tbl[9]=pad2_map_tbl[9]=0;				// unused
	game_map_tbl[10]=pad1_map_tbl[10]=pad2_map_tbl[10]=0;			// unused
	game_map_tbl[11]=pad1_map_tbl[11]=pad2_map_tbl[11]=0x0800;		//start

	game_map_tbl[12]=pad1_map_tbl[12]=pad2_map_tbl[12]=0x1000;		//up
	game_map_tbl[13]=pad1_map_tbl[13]=pad2_map_tbl[13]=0x2000;		//right
	game_map_tbl[14]=pad1_map_tbl[14]=pad2_map_tbl[14]=0x4000;		//down
	game_map_tbl[15]=pad1_map_tbl[15]=pad2_map_tbl[15]=0x8000;		//left

//----------------------------------------------------------------------------------------
// Initialize vpipe structures...

	for( i=0; i<SYS_NUM_DLBUFS; i++ ) 
	{
		dpipe[i].dbuf = glist[i];	//(Gfx *)OS_PHYSICAL_TO_K0( glist[i] );
		dpipe[i].idcmp_base=(BYTE*)image_dcomp_buffer[i];			// setup base decomp buffers
		dpipe[i].idle = 1;
	}
	
	for( i=0; i<SYS_NUM_FRAMEBUFS; i++ ) 
	{
		vpipe[i].fbuf = (unsigned short *)cfb[i];	//OS_PHYSICAL_TO_K1( cfb[i] );
		vpipe[i].free = 1;
	}

	dpipe[0].idle = 0;
#if 1	
	vid_dpipe_free = 0;
#else	
	vid_dpipe_avail=1;
#endif	
	vid_dpipe_writing = -1;
	vid_dpipe_dataready = -1;
	vid_dpipe_reading = -1;

	vid_vpipe_writing = -1;
	vid_vpipe_dataready = -1;
	vid_vpipe_committed = -1;
	vid_vpipe_onscreen = -1;

//----------------------------------------------------------------------------------------
// Create and start the Vi manager and init the video mode...

	osCreateViManager( OS_PRIORITY_VIMGR );
	
//**********BS N64 PATCH 
	if (osTvType==0)
		osViSetMode( &osViModeTable[OS_VI_PAL_LPN1] );	
	else osViSetMode( &osViModeTable[OS_VI_NTSC_LPN1] );	
//**********BS N64 PATCH 
	
	osViSetSpecialFeatures(OS_VI_GAMMA_OFF);	
	osViBlack(1);

//----------------------------------------------------------------------------------------
// Initialize gamepad...

	gamepad_rescan_count = GAMEPAD_RESCAN_COUNT_INIT;
	gamepad_vbi_to_start_delay = GAMEPAD_TIMER_DELAY_MAX;

	osCreateMesgQueue( &sys_msgque_ser, sys_msgbuf_ser, SYS_MSGBUF_SIZE_SER );
	osSetEventMesg( OS_EVENT_SI, &sys_msgque_ser, 0 );

	for( j=0; j<SYS_GAMEPAD_RETRY; j++ ) {
		osContInit( &sys_msgque_ser, &gamepad_bit_pattern, gamepad_status );
		for( i=0; i<MAXCONTROLLERS; i++ ) {
			if( gamepad_status[i].errno == CONT_OVERRUN_ERROR ) break;
		}
		if( i==MAXCONTROLLERS ) break;
	}

	gamepad_update();

	for( i=0; i<SYS_NUM_GAMEPADS; i++ ) {
		gamepad_center[i][0] = SYS_GAMEPAD_CENTER_X;
		gamepad_center[i][1] = SYS_GAMEPAD_CENTER_Y;
		gamepad_deadzone[i] = SYS_GAMEPAD_DEADZONE;
	}

//----------------------------------------------------------------------------------------
// Setup message queues and event triggering...
	/* Serial/Joy queue */
	osCreateMesgQueue( &sys_msgque_joy, sys_msgbuf_joy, SYS_MSGBUF_SIZE_JOY );
	osSetEventMesg( OS_EVENT_SI, &sys_msgque_joy, 0 );

	/* VBI queue */
	osCreateMesgQueue( &sys_msgque_vbi, sys_msgbuf_vbi, SYS_MSGBUF_SIZE_VID );
	osSetEventMesg( OS_EVENT_PRENMI, &sys_msgque_vbi, (OSMesg)VID_MSG_PRENMI );
	osSetEventMesg( OS_EVENT_SP, &sys_msgque_vbi, (OSMesg)VID_MSG_RSP );
	osSetEventMesg( OS_EVENT_DP, &sys_msgque_vbi, (OSMesg)VID_MSG_RDP );
	osViSetEvent( &sys_msgque_vbi, (OSMesg)VID_MSG_VBI, 1 );	// last parm: 2 indicates 30 FPS (1=60)
	
	/* Timer queue */
	osCreateMesgQueue( &sys_msgque_tmr, sys_msgbuf_tmr, SYS_MSGBUF_SIZE_TMR );

//----------------------------------------------------------------------------------------
// Create and start video vbi thread...

	osCreateThread(
		&vid_vbi_thread,
		SYS_THREAD_ID_VBI,
		vid_vbi_wait_thread,
		(void *)0,
		vid_vbi_stack + SYS_VBI_STACKSIZE/8,
		SYS_VBI_THREAD_PRIORITY
	);
	osStartThread( &vid_vbi_thread );		// will return immediately

//----------------------------------------------------------------------------------------
// Create and start gamepad wait thread...
	osCreateThread(
		&gamepad_thread,
		SYS_THREAD_ID_GAMEPAD,
		gamepad_wait_thread,
		(void *)0,
		gamepad_stack + SYS_GAMEPAD_STACKSIZE/8,
		SYS_GAMEPAD_THREAD_PRIORITY
	);
	osStartThread( &gamepad_thread );		// will return immediately

//----------------------------------------------------------------------------------------
// Create and start timer wait thread...
	osCreateThread(
		&gamepad_timer_thread,
		SYS_THREAD_ID_GTIMER,
		gamepad_timer_wait_thread,
		(void *)0,
		gamepad_timer_stack + SYS_GTIMER_STACKSIZE/8,
		SYS_GTIMER_THREAD_PRIORITY
	);
	osStartThread( &gamepad_timer_thread );	// will return immediately

//----------------------------------------------------------------------------------------
// Initialize video buffers...

//----------------------------------------------------------------------------------------
// Clear Frame Buffers  & Setup Double Buffer System
	vpipe[0].free = 0;
	for( i=0; i<SYS_NUM_FRAMEBUFS; i++ ) {
		sys_aligned_memclear( (int *)vpipe[i].fbuf, SYS_FBUF_SIZE / sizeof(int) );
	}
	vid_vpipe_committed = 0;
	osViSwapBuffer( vpipe[0].fbuf );
	vid_sync();
	osViBlack(0);
	
	DISPLAY_OFF;
	
	tmem_palptr=tmem_imgptr=NULL;								// no initial graphics or palettes 
	
	init_vram_cache();

#if 1	//ENABLE_AUDIO
//----------------------------------------------------------------------------------------
// Initialize sound system...

	init_audio();
	f_music_vol=65;
	f_sfx_vol=115;
	sound_reset();
//	sound_driver_config();

#endif

	return;
}

//******************************************************************************
//******************************************************************************
//			Ultra 64 Startup Code (End)
//******************************************************************************
//******************************************************************************

/*
 * MODULE PROTOTYPES
 */

//////////////////////////////////////////////////////////////////////////////////////////
// vid_get_dbuf - get an available display-list buffer.
//
// Sets up Glp, Mlp, Vlp, and Plp pointing to empty buffers. vid_dpipe_writing is also set
// up to index into the allocated dpipe buffer. If successful, 0 is returned. If no buffers
// are free, 1 is returned.
//////////////////////////////////////////////////////////////////////////////////////////
int vid_get_dbuf( void ) 
{
#if 0
	CRITICAL_DEFS;
	int i;

	ENTER_CRITICAL;
	if( vid_dpipe_avail ) 
	{
		vid_dpipe_avail--;
		LEAVE_CRITICAL;

		for( i=0; i<SYS_NUM_DLBUFS; i++ ) 
		{
			if( dpipe[i].idle ) 
			{
				dpipe[i].idle = 0;
				Glp = dpipe[i].dbuf;
				(BYTE *)idcomp_ptr=dpipe[i].idcmp_base;					// reset compress area
				tmem_palptr=NULL;
	
				dpipe[i].frame = Frame;
				vid_dpipe_writing = i;
				return( 0 );
			}
		}
	}
	LEAVE_CRITICAL;
#else
	if( vid_dpipe_free >= 0 ) {
		Glp = dpipe[vid_dpipe_free].dbuf;
		(BYTE *)idcomp_ptr=dpipe[vid_dpipe_free].idcmp_base;					// reset compress area
		tmem_palptr=NULL;

		dpipe[vid_dpipe_free].frame = Frame;
		vid_dpipe_writing = vid_dpipe_free;
		vid_dpipe_free = -1;
		return( 0 );
	}
#endif
	return( 1 );
}

//////////////////////////////////////////////////////////////////////////////////////////
// vid_process_gfx - process the current display-list and display it.
//
// Returns immediately.
//////////////////////////////////////////////////////////////////////////////////////////
void vid_process_gfx( void ) 
{
	CRITICAL_DEFS;
	int i;
	u32 gc;

	Gframe++;

#if BENCH
	bench_total_dlists++;
#endif

	gc = (u32)Glp - (u32)dpipe[vid_dpipe_writing].dbuf;

#if SYS_DEBUG
	if( gc > GLIST_LEN*sizeof(Gfx)) {
		printf(( " <<<< WARNING: Display-list buffer overflow >>>>\n" ));
		printf(( "               buffer size: %d bytes\n", GLIST_LEN*sizeof(Gfx) ));
		printf(( "               Gfx size:    %d bytes\n", gc ));
	}
#endif

	dpipe[vid_dpipe_writing].gfx_bytes = gc;

	ENTER_CRITICAL;
	if( vid_dpipe_dataready >= 0 ) 				// replace dlist with the one ready for RSP processing...
	{			
		init_rsp_packet( vid_dpipe_writing );
		dpipe[vid_dpipe_dataready].idle = 1;
		vid_dpipe_dataready = vid_dpipe_writing;
		vid_dpipe_writing = -1;
		Vid_displaying_frame = dpipe[vid_dpipe_dataready].frame;
		LEAVE_CRITICAL;
	} 
	else 
	{									// submit new dlist...
		vid_dpipe_dataready = vid_dpipe_writing;
		vid_dpipe_writing = -1;
		LEAVE_CRITICAL;
		kickstart();
	}
}

//////////////////////////////////////////////////////////////////////////////////////////
// vid_sync - returns when all submitted display lists have been displayed. Returns
//            the vpipe index of the on-screen display list.
//////////////////////////////////////////////////////////////////////////////////////////
int vid_sync( void ) 
{
	while( vid_dpipe_dataready >= 0
		|| vid_dpipe_reading >= 0
		|| vid_vpipe_writing >= 0
		|| vid_vpipe_dataready >= 0
		|| vid_vpipe_committed >= 0
	);

	return( vid_vpipe_onscreen );
}

//////////////////////////////////////////////////////////////////////////////////////////
// vid_vbi_wait_thread - An independent thread used to catch vertical retraces.
//
// IMPORTANT: This function is internally called and managed by the kernel. It should
//            not be called.
//////////////////////////////////////////////////////////////////////////////////////////
void vid_vbi_wait_thread( void *arg ) 
{
	int vbi_msg;
	
	for(;;) 
	{
		osRecvMesg( &sys_msgque_vbi,(OSMesg *)&vbi_msg, OS_MESG_BLOCK );		// wait for event

		switch (vbi_msg)
		{
			case VID_MSG_RSP:				// end of signal processing
				rsp_event();
				break;
			case VID_MSG_RDP:				// end of display processing
				rdp_event();
				break;
			case VID_MSG_VBI:
				vbi_event();
				break;
			case VID_MSG_KICKSTART:
				kickstart_event();
				break;
			case VID_MSG_PRENMI:
				prenmi_event();
				break;
			default:
				printf(("VBI_MSG %d",vbi_msg));
				break;
		}
	}
}

//******************************************************************************
//******************************************************************************
// RSP Service Routine
void rsp_event(void) 
{
#if BENCH			
	bench_start(BENCHSW_RSP_IDLE);
#endif				

#if 0
	if (vid_prenmi_flag)  
	{
//		return;
	}
#endif
	
	if( vid_rsp_atask ) 
	{
		/* RSP Audio Completed */
		if( vid_rsp_atask_submitted ) 
		{
#if VID_TRACK_EVENTS
			printf(( "rsp a\n" ));
#endif
		
#if BENCH
			bench_stop( BENCHSW_RSP_WORKING_AUD );
#endif
			vid_rsp_atask = 0;
			kickstart();
		} 
		else 
		{
			/* Gfx Yielded */
#if VID_TRACK_EVENTS
			printf(( "rsp graphics yield\n" ));
#endif

#if BENCH
			bench_stop( BENCHSW_RSP_WORKING_GFX );
#endif
			if( !osSpTaskYielded( &vid_rsptask ) ) 
			{
#if VID_TRACK_EVENTS
				printf(( "no yield\n" ));
#endif
				gfx_yielded = 0;
				dpipe[vid_dpipe_reading].idle = 1;
				vid_dpipe_reading = -1;
			}
			
#if VID_TRACK_EVENTS
			printf(( "start a2\n" ));
			
			if (vid_rsp_atask==0)
				printf(("INVALID AUD\n"));
			
#endif
			start_rsp( vid_rsp_atask );
			vid_rsp_atask_submitted = 1;
		}
	} 
	else 
	{
		/* Gfx Completed */
#if VID_TRACK_EVENTS
		printf(( "rsp g\n" ));
#endif

#if BENCH
		bench_stop( BENCHSW_RSP_WORKING_GFX );
#endif
		dpipe[vid_dpipe_reading].idle = 1;
		vid_dpipe_reading = -1;
		kickstart();
	}
}

//******************************************************************************
//******************************************************************************
// RDP Service Routine
//******************************************************************************
void rdp_event(void) 
{
	int i;
	
#if BENCH			
	bench_stop(BENCHSW_RDP_WORKING);
	bench_start(BENCHSW_RDP_IDLE);
#endif				

#if VID_TRACK_EVENTS
	printf(("rdp\n"));
#endif

	i = vid_vpipe_writing;
	vid_vpipe_writing = -1;

	if( vid_vpipe_committed >= 0 ) {
		vid_vpipe_dataready = i;
	} else {
		vid_vpipe_committed = i;
		osViSwapBuffer( vpipe[i].fbuf );
	}

	kickstart();
}

//******************************************************************************
// VBI Service Routine
static WORD irq_tick;
void vbi_event(void) 
{
	int i;
	int frame_on_screen, current_fbuf;
	
	/* vblank book keeping */
	irq_timer++;
	Frame++;
	
	if ( f_pause<PAUSE_OFF ) 
		irq_tick++;
		
	tick=(irq_tick*55)/60;

	/* audio task release */
	if( vid_next_atask ) 
	{
		vid_atask_ready = vid_next_atask;
		vid_next_atask = 0;
		kickstart_event();	// kickstart now
	}
	
	current_fbuf = (int)osViGetCurrentFramebuffer();
	if( current_fbuf == (int)vpipe[0].fbuf ) 
	{
		frame_on_screen = 0;
	} 
	else {
		if( current_fbuf == (int)vpipe[1].fbuf ) 
		{
			frame_on_screen = 1;
		} 
		else 
		{
			frame_on_screen = -1;
		}
	}
	
	if( frame_on_screen != vid_vpipe_onscreen ) 
	{
		if( vid_vpipe_onscreen >= 0 ) 
			vpipe[vid_vpipe_onscreen].free = 1;
			
		vid_vpipe_onscreen = frame_on_screen;

		if( vid_vpipe_dataready >= 0 ) 
		{
			vid_vpipe_committed = vid_vpipe_dataready;
			vid_vpipe_dataready = -1;
			osViSwapBuffer( vpipe[vid_vpipe_committed].fbuf );
		} 
		else 
		{
			vid_vpipe_committed = -1;
		}

		kickstart();

#if BENCH
		bench_displayed_frames++;
#endif
	}
	
#if 1
	if( vid_dpipe_free == -1 ) 
	{
		for( i=0; i<SYS_NUM_DLBUFS; i++ ) 
		{
			if( dpipe[i].idle ) 
			{
				dpipe[i].idle = 0;
				vid_dpipe_free = i;
				break;
			}
		}
	}
#else
	if( ++vid_dpipe_avail > SYS_NUM_DLBUFS ) vid_dpipe_avail=SYS_NUM_DLBUFS;
#endif

	/* next audio function task */
#if 0
	if (vid_prenmi_flag) 
	{
//		return;
	}
	else 
	{
		if (audio_init!=0)
			vid_next_atask=wess_work();
	}
#else	
	if (audio_init!=0)
		vid_next_atask=wess_work();
#endif	

	gamepad_fps_vbi();			// controller setup
	
	return;
}

//////////////////////////////////////////////////////////////////////////////////////////
// kickstart_event - handles kickstart messages.
//////////////////////////////////////////////////////////////////////////////////////////
void kickstart_event( void ) {
	int i;

	if( vid_rsp_atask ) return;		// exit if the RSP is working on an audio task

	if( vid_atask_ready ) 
	{
//if( vid_dpipe_reading >= 0 ) return;
		vid_rsp_atask = vid_atask_ready;
		vid_atask_ready = 0;

		if( vid_dpipe_reading >= 0 ) 
		{
			gfx_yielded = 1;
			vid_rsp_atask_submitted = 0;
#if VID_TRACK_EVENTS
			printf(( "yield g\n" ));
#endif
			osSpTaskYield();
		} else 
		{
			vid_rsp_atask_submitted = 1;
#if VID_TRACK_EVENTS
			printf(( "start a1\n" ));
#endif
			start_rsp( vid_rsp_atask );
		}
	} 
	else 
	{
		if( gfx_yielded ) 
		{
			gfx_yielded = 0;
#if VID_TRACK_EVENTS
			printf(( "start yg\n" ));
#endif
			start_rsp( &vid_rsptask );
		} 
		else 
		{
			if( vid_vpipe_writing<0 && vid_dpipe_reading<0 && vid_dpipe_dataready>=0 ) 
			{
				for( i=0; i<SYS_NUM_FRAMEBUFS; i++ ) 
				{
					if( vpipe[i].free ) 
					{
						vpipe[i].free = 0;
						vid_dpipe_reading = vid_dpipe_dataready;
						vid_vpipe_writing = i;
						vid_dpipe_dataready = -1;

						vid_rsptask.t.flags = OS_TASK_DP_WAIT;
						init_rsp_packet( vid_dpipe_reading );

#if VID_TRACK_EVENTS
						printf(( "start g\n" ));
#endif
#if BENCH
						bench_stop( BENCHSW_RDP_IDLE );
						bench_start( BENCHSW_RDP_WORKING );
#endif
						start_rsp( &vid_rsptask );
						break;
					}
				}
			}
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////////////
// prenmi_event - handles the pre-NMI event.
//////////////////////////////////////////////////////////////////////////////////////////
void prenmi_event( void ) 
{
	vid_prenmi_flag=1;
	wess_seq_stopall();
}

//////////////////////////////////////////////////////////////////////////////////////////
// kickstart - checks whether an audio or gfx task can be given to the RSP and, if so,
//             does it. This should be called whenever there's a possibility that the RSP
//             (for audio/gfx) or the RDP (gfx) has become idle.
//////////////////////////////////////////////////////////////////////////////////////////
void kickstart( void ) 
{
#if VID_TRACK_EVENTS
			printf(( "kickstart\n" ));
#endif
	osSendMesg( &sys_msgque_vbi, (OSMesg)VID_MSG_KICKSTART, OS_MESG_BLOCK );	// should never block
}

//////////////////////////////////////////////////////////////////////////////////////////
// start_rsp - flushes the data cache, and sends the task structure to the RSP.
//////////////////////////////////////////////////////////////////////////////////////////
void start_rsp( OSTask *task ) 
{
	osWritebackDCacheAll();

//	if( vid_prenmi_flag ) return;

#if BENCH
	bench_stop( BENCHSW_RSP_IDLE );

	if( task->t.type == M_GFXTASK ) {
		bench_start( BENCHSW_RSP_WORKING_GFX );
	} else {
		bench_start( BENCHSW_RSP_WORKING_AUD );
	}
#endif

	osSpTaskStart( task );
}

void init_rsp_packet( int dindex ) 
{
	gSPSegment( dpipe[dindex].dbuf, SYS_RSPSEG_FBUF, cfb[vid_vpipe_writing] );
	vid_rsptask.t.ucode_boot_size=(int)rspbootTextEnd - (int)rspbootTextStart;	// set ucode size (waste but who cares)
	vid_rsptask.t.data_ptr = (u64 *)dpipe[dindex].dbuf;
	vid_rsptask.t.data_size = dpipe[dindex].gfx_bytes;
}

/******************************************************************************
 Function: void stack_switch_bits(LONG swstate,WORD swoffset)

 By: David Schwartz

 Date: Aug 9, 1994

 Parameters: swstate = bits to add to switch state
			 swoffset = base offset into table

 Returns: None

 Description:	This routine will add an entry to the switch stack for each
				bit set in the swstate.  These switches are then retrieved in the
				exec(main) loop and joystick processes are setup.
******************************************************************************/
void stack_switch_bits(LONG swstate,WORD swoffset)
{
	LONG sw0;
	WORD i=0;

	while (swstate)
	{
		if ((sw0=swstate & 1))			/* is lowest bit set, if so add to switch stack */
		{
			if (swstack>=&swstmn[SWSTCK_SIZE])	/* check if we have gone past end of stack */
				return;

			*swstack=i+swoffset;		/* push switch number onto stack (0-31)+OFFSET */
			swstack++;
		}

		i++;							/* next bit position */

		swstate=(0xfffffffe & swstate)>>1;	/* remove bit and shift next bit down */
	}

	return;
}

/******************************************************************************
 Function: WORD joy_remap(WORD input,WORD *tbl)

 By: David Schwartz

 Date: Jan 1995

 Parameters: input - input bit pattern from joystick
			 tbl - convert table lookup maps input to output

 Returns: remapped joystick buttons

 Description:	This routine will remap the joystick values, based on the user selctions
******************************************************************************/
WORD joy_remap(WORD input,WORD *tbl)
{
	short i;
	WORD output=0;

	for (i=0;i<MAP_TBL_ENTRIES;i++)
	{
		if (input & 1)
		{
			/* bit set, remap */
			output|=*(tbl+i);		// map table entry contains correct bit to set in output
		}

		input>>=1;					// shift down next bit
	}

	return(output);
}

//******************************************************************************
//******************************************************************************
//		UNCOMPRESS ROUTINES
//******************************************************************************
//******************************************************************************

/******************************************************************************
 Function: BYTE *uncompress_image(BYTE *src)

 By: David Schwartz

 Date: Jan 1995

 Parameters: src - src address compressed image
 			 dict - ptr to dictionary (if used)

			 Each image has a 32 bit header:
				bits [31..24] = compression type (0=None, 1=64 RLE, 2=256 RLE)
				bits [23..0] = # of bytes in src compress data + 4 bytes for header

 Returns: dest - dest decompression buffer area

 Description:	This routine will uncompress data via the correct routine.  The results
				will be dumped to the current decompress buffer
******************************************************************************/
#if SYS_DEBUG
void size_check(BYTE *ptr,LONG size,BYTE *src) 
{
#if 0
	ADDRESS length;
	
	length=(ADDRESS)ptr+size;
	
	if (length>=(ADDRESS)(((BYTE *)dpipe[vid_dpipe_writing].idcmp_base)+DECOMP_BUFFER_SIZE))
	{
		printf(("WE ARE GOING TO EXCEED SIZE\n"));
		printf(("LENGTH NEEDED %x\n",size));
		
		printf(("SRC=%x P1=%x P2=%x\n",src,p1_heap,p2_heap));
	}
#endif		
	return;	
}
#endif

BYTE *uncompress_image(BYTE *src,BYTE *dict)
{
	BYTE *dest;
	BYTE *start;
	BYTE *startt;
	WORD i;
	LONG before; 
	LONG after;
	LONG nsize;

	nsize=((*( (LONG *)src)))&0x00ffffff;
	
	switch (((*( (LONG *)src)) >>24)&0x3f)
	{
		case 0:		// no compression
			start=src+sizeof(LONG);		// skip header block
			break;
		case 7:		// 64 color dictionary compression
			start=dest=(BYTE *)idcomp_ptr;
#if SYS_DEBUG
			size_check(dest,nsize,src);			
#endif
			dict_uncompress_64(src,&dest,dict);
			idcomp_ptr=(LONG *)(((LONG)(dest+7)) & (~7));		// 8 byte align for u64
			break;
		case 8:		// 32 color dictionary compression
			start=dest=(BYTE *)idcomp_ptr;
#if SYS_DEBUG
			size_check(dest,nsize,src);			
#endif
			dict_uncompress_32(src,&dest,dict);
			idcomp_ptr=(LONG *)(((LONG)(dest+7)) & (~7));		// 8 byte align for u64
			break;
		case 9:		// background zip files
		case 18:		// background zip files
			start=dest=(BYTE *)idcomp_ptr;
			if ((LONG)dict==1) 
				after=inflate(src,&dest,(src+40*1024),60*1024);
			else after=inflate(src,&dest,(BYTE *)&player_heap[((PLAYER_HEAP_SIZE-300*1024)/sizeof(long long))],300*1024);
#if SYS_DEBUG
			if (after!=0)
				printf(("AFTER ERROR=%d\n",after));
#endif			
			idcomp_ptr=(LONG *)(((LONG)(dest+7)) & (~7));		// 8 byte align for u64
			break;
			
		case 13:			// new 64 dict uncompess with new headers
			start=dest=(BYTE *)idcomp_ptr;
#if SYS_DEBUG
			size_check(dest,nsize,src);			
#endif
			new_dict_uncompress_64(src,dest,dict);
			idcomp_ptr=(LONG *)(((LONG)((start+nsize)+7)) & (~7));		// 8 byte align for u64
			break;

		case 14:			// new 32 dict uncompess with new headers
		case 19:			// new 32 dict uncompess with new headers with slight mod
			start=dest=(BYTE *)idcomp_ptr;
#if SYS_DEBUG
			size_check(dest,nsize,src);			
#endif
			new_dict_uncompress_32(src,dest,dict);
			idcomp_ptr=(LONG *)(((LONG)((start+nsize)+7)) & (~7));		// 8 byte align for u64
			break;
		case 22:			// new 32 dict uncompess with new headers with slight mod 2
		case 23:			// new 32 dict uncompess with new headers with slight mod 2
		case 24:			// new 32 dict uncompess with new headers with slight mod 2
			start=dest=(BYTE *)idcomp_ptr;
#if SYS_DEBUG
			size_check(dest,nsize,src);			
#endif
			dict_uncompress_32_final(src,dest,dict);
			idcomp_ptr=(LONG *)(((LONG)((start+nsize)+7)) & (~7));		// 8 byte align for u64
			break;

		case 25:			// new 64 dict uncompess with new headers with slight mod 2
			start=dest=(BYTE *)idcomp_ptr;
#if SYS_DEBUG
			size_check(dest,nsize,src);			
#endif
			dict_uncompress_64_final(src,dest,dict);
			idcomp_ptr=(LONG *)(((LONG)((start+nsize)+7)) & (~7));		// 8 byte align for u64
			break;

		case 16:			// new 16 RLE Compression with new header
			start=dest=(BYTE *)idcomp_ptr;
#if SYS_DEBUG
			size_check(dest,nsize,src);			
#endif
			uncompress_16(src,dest);
			idcomp_ptr=(LONG *)(((LONG)((start+nsize)+7)) & (~7));		// 8 byte align for u64
			break;
			
		case 15:			// new 8 RLE Compression with new header
			start=dest=(BYTE *)idcomp_ptr;
#if SYS_DEBUG
			size_check(dest,nsize,src);			
#endif
			uncompress_8(src,dest);
			idcomp_ptr=(LONG *)(((LONG)((start+nsize)+7)) & (~7));		// 8 byte align for u64
			break;
		case 20:			// simple rle with new header
			start=dest=(BYTE *)idcomp_ptr;
#if SYS_DEBUG
			size_check(dest,nsize,src);			
#endif
			NHunsimpleRLE(src,dest);
			idcomp_ptr=(LONG *)(((LONG)((start+nsize)+7)) & (~7));		// 8 byte align for u64
			break;
		default:
			printf(("NEED COMPRESSION TYPE %d\n",((*( (LONG *)src)) >>24)&0x3f));
			break;
	}

	return(start);
}

/* expander for compression method 25 */

void dict_uncompress_64_final(uchar *src, uchar *dst, uchar *dict)
{
	uchar *final_dst, *flip_data;
	ulong flip_len;
	int sw, bit_count;
	uchar ch, flip;

	final_dst = dst + (*(long *)src & 0x00FFFFFF);
	src += sizeof(long);
	flip_len = *src++;
	if (flip_len & 0x80)
		flip_len = ((flip_len & 0x7F) << 8) | *src++;
	flip_data = src;
	src += flip_len;
	bit_count = 4;
	flip = *flip_data++;
	while (dst < final_dst) {
		ch = *src++;
		sw = ch >> 6;
		ch &= 0x3F;
		switch (sw) {
		case 1:
			*dst++ = ch;
			/* fall thru */
		case 0:
			*dst++ = ch;
			break;
		case 2: {
			uchar *dict_ptr;
			int index;
			
			index = ((ch & 0x3F) | (flip & 0x40)) << 1;
			if (flip & 0x80) {
				dict_ptr = dict + index + 1;
				*dst++ = *dict_ptr--;
				*dst++ = *dict_ptr;
			} else {
				dict_ptr = dict + index;
				*dst++ = *dict_ptr++;
				*dst++ = *dict_ptr;
			}
			if (--bit_count == 0) {
				flip = *flip_data++;
				bit_count = 4;
			} else {
				flip <<= 2;
			}
		}
			break;
		case 3: {
			int cnt;
			
			for (cnt = *src++; cnt > 0; cnt--)
				*dst++ = ch;
		}
			break;
		}
	}
}  /* dict_uncompress_64 */


/* compressor 20 : new header simple RLE */

void NHunsimpleRLE(uchar *src, uchar *dst)
{
	int i;
	signed char *s, *d, *final_dst, ch;

	s = (signed char *)src + sizeof(long);
	d = (signed char *)dst;
	final_dst = d + (*(long *)src & 0x00FFFFFF);
	while (d < final_dst)
		if ((i = *s++) < 0) {				/* if < 0 then zero based count */
			for (ch = *s++; i <= 0; i++)
				*d++ = ch;
		} else
			for (; i >= 0; i--)
				*d++ = *s++;				/* zero based bytes of data */
}  /* NHunsimpleRLE */

/* compressor type 7 */
void dict_uncompress_64(BYTE *src, BYTE **dst, BYTE *dict)
{
	long src_bytes;
	int sw;
	BYTE ch;
	BYTE *buffer;

	src_bytes = (*(long *)src & 0x00FFFFFF) - (sizeof(long));
	src += sizeof(long);
	buffer=*dst;
	while (src_bytes-- > 0) {
		ch = *src++;
		sw = ch >> 6;
		ch &= 0x3F;
		switch (sw) {
		case 1:
			*buffer++ = ch;
			/* fall thru */
		case 0:
			*buffer++ = ch;
			break;
		case 2: {
			BYTE *dict_ptr;
			
			dict_ptr = dict + ((ch & 0x3F) << 1);
			*buffer++ = *dict_ptr++;
			*buffer++ = *dict_ptr;
		}
			break;
		case 3: {
			int cnt;
			
			for (cnt = *src++, src_bytes--; cnt > 0; cnt--)
				*buffer++ = ch;
		}
			break;
		}
	}
	
	*dst=buffer;
}  /* dict_uncompress_64 */


/* compressor type 8 */
void dict_uncompress_32(BYTE *src, BYTE **dst, BYTE *dict)
{
	long src_bytes;
	BYTE ch;
	BYTE *buffer;

	src_bytes = (*(long *)src & 0x00FFFFFF) - (sizeof(long));
	src += sizeof(long);
	buffer=*dst;
	while (src_bytes-- > 0) {
		ch = *src++;
		if (ch & 0x80) {
			BYTE *dict_ptr;
			
			dict_ptr = dict + ((ch & 0x7F) << 1);
			*buffer++ = *dict_ptr++;
			*buffer++ = *dict_ptr;
		} else {
			int sw;
			
			sw = ch >> 5;
			ch &= 0x1F;
			switch (sw) {
			case 3: {
				int cnt;
				
				for (cnt = *src++, src_bytes--; cnt > 0; cnt--)
					*buffer++ = ch;
			}
				break;
			case 2: {
				int cnt;
				
				for (cnt = ch + 3; cnt > 0; cnt--)
					*buffer++ = 0;
			}
				break;
			case 1:
				*buffer++ = ch;
				/* fall thru */
			case 0:
				*buffer++ = ch;
				break;
			}
		}
	}
	
	*dst=buffer;
}  /* dict_uncompress_32 */

#if 1
/* compression methods 22, 23, 24 */
void dict_uncompress_32_final(uchar *src, uchar *dst, uchar *dict)
{
	ulong flip_len;
	uchar *final_dst, *top_four_mini, *flip_data;
	uchar mini_pix, ch, flip;
	int bit_count;

	final_dst = dst + (*(long *)src & 0x00FFFFFF);
	if (*src == 24) {								/* new mini span method */
		top_four_mini = src + sizeof(long);
		flip_data = src + sizeof(long) + sizeof(uchar) * 4;/* the header and the mini span pixels */
	} else if (*src == 23) {
		top_four_mini = NULL;
		mini_pix = src[4];
		flip_data = src + sizeof(long) + sizeof(uchar);/* the header and the mini span pixel */
	} else {	/* *src == 22 */
		top_four_mini = NULL;
		mini_pix = 0;
		flip_data = src + sizeof(long);				/* the header */
	}

	flip_len = *flip_data++;
	if (flip_len & 0x80)
		flip_len = ((flip_len & 0x7F) << 8) | *flip_data++;
	src = flip_data + flip_len;
	bit_count = 8;
	flip = *flip_data++;

	while (dst < final_dst) {
		ch = *src++;
		if (ch & 0x80) {
			uchar *dict_ptr;
			
			if (flip & 0x80) {
				dict_ptr = dict + ((ch & 0x7F) << 1) + 1;
				*dst++ = *dict_ptr--;
				*dst++ = *dict_ptr;
			} else {
				dict_ptr = dict + ((ch & 0x7F) << 1);
				*dst++ = *dict_ptr++;
				*dst++ = *dict_ptr;
			}
			if (--bit_count == 0) {
				flip = *flip_data++;
				bit_count = 8;
			} else {
				flip <<= 1;
			}
		} else {
			int sw;
			
			sw = ch >> 5;
			ch &= 0x1F;
			switch (sw) {
			case 3: {
				int cnt;
				
				for (cnt = *src++; cnt > 0; cnt--)
					*dst++ = ch;
			}
				break;
			case 2: {
				int cnt;
				
				if (top_four_mini == NULL) {
					for (cnt = ch + 3; cnt > 0; cnt--)
						*dst++ = mini_pix;
				} else {
					cnt = (ch & 0x07) + 3;
					ch = top_four_mini[(ch >> 3) & 0x03];
					for (; cnt > 0; cnt--)
						*dst++ = ch;
				}
			}
				break;
			case 1:
				*dst++ = ch;
				/* fall thru */
			case 0:
				*dst++ = ch;
				break;
			}
		}
	}
}  /* dict_uncompress_32_final */
#endif

/* compression methods 14, 19, and 22 */
void new_dict_uncompress_32(uchar *src, uchar *dst, uchar *dict)
{
	uchar *final_dst, *top_four_mini;
	uchar mini_pix, ch;

	final_dst = dst + (*(long *)src & 0x00FFFFFF);
	if (*src == 22) {								/* new mini span method */
		top_four_mini = src + sizeof(long);
		src += sizeof(long) + sizeof(uchar) * 4;	/* the header and the mini span pixels */
	} else if (*src == 19) {
		top_four_mini = NULL;
		mini_pix = src[4];
		src += sizeof(long) + sizeof(uchar);		/* the header and the mini span pixel */
	} else {
		top_four_mini = NULL;
		mini_pix = 0;
		src += sizeof(long);						/* the header */
	}
	while (dst < final_dst) {
		ch = *src++;
		if (ch & 0x80) {
			uchar *dict_ptr;
			
			dict_ptr = dict + ((ch & 0x7F) << 1);
			*dst++ = *dict_ptr++;
			*dst++ = *dict_ptr;
		} else {
			int sw;
			
			sw = ch >> 5;
			ch &= 0x1F;
			switch (sw) {
			case 3: {
				int cnt;
				
				for (cnt = *src++; cnt > 0; cnt--)
					*dst++ = ch;
			}
				break;
			case 2: {
				int cnt;
				
				if (top_four_mini == NULL) {
					for (cnt = ch + 3; cnt > 0; cnt--)
						*dst++ = mini_pix;
				} else {
					cnt = (ch & 0x07) + 3;
					ch = top_four_mini[(ch >> 3) & 0x03];
					for (; cnt > 0; cnt--)
						*dst++ = ch;
				}
			}
				break;
			case 1:
				*dst++ = ch;
				/* fall thru */
			case 0:
				*dst++ = ch;
				break;
			}
		}
	}
}  /* dict_uncompress_32 */


/* compressor 18 : new header inflate data */



/* compressor 13 : new header 64 color dictionary RLE */
void new_dict_uncompress_64(BYTE *src, BYTE *dst, BYTE *dict)
{
	BYTE *final_dst;
	int sw;
	BYTE ch;

	final_dst = dst + (*(long *)src & 0x00FFFFFF);
	src += sizeof(long);
	while (dst < final_dst) {
		ch = *src++;
		sw = ch >> 6;
		ch &= 0x3F;
		switch (sw) {
		case 1:
			*dst++ = ch;
			/* fall thru */
		case 0:
			*dst++ = ch;
			break;
		case 2: {
			BYTE *dict_ptr;
			
			dict_ptr = dict + ((ch & 0x3F) << 1);
			*dst++ = *dict_ptr++;
			*dst++ = *dict_ptr;
		}
			break;
		case 3: {
			int cnt;
			
			for (cnt = *src++; cnt > 0; cnt--)
				*dst++ = ch;
		}
			break;
		}
	}
}  /* dict_uncompress_64 */

/* compressor 16 : new header 16 color RLE */
void uncompress_16(BYTE *src, BYTE *dst)
{
	BYTE *final_dst;
	BYTE ch;

	final_dst = dst + (*(long *)src & 0x00FFFFFF);
	src += sizeof(long);
	while (dst < final_dst) {
		ch = *src++;
		if (ch & 0x80) {		/* 7 to 134 zeros */
			int cnt;
			
			for (cnt = (ch & 0x7F) + 7; cnt > 0; cnt--)
				*dst++ = 0;
		} else {
			int sw;
			
			sw = ch >> 4;
			ch &= 0x0F;
			switch (sw) {
			case 0:				/* long run lengths of all colors */
				for (sw = *src++; sw > 0; sw--)
					*dst++ = ch;
				break;
			case 7:				/* uncompress data */
				for (sw = ch + 3; sw > 0; ) {
					ch = *src++;
					*dst++ = ch >> 4;
					sw--;
					if (!sw)
						break;
					*dst++ = ch & 0x0F;
					sw--;
				}
				break;
			case 6:				/* six pixels */
				*dst++ = ch;
				/* fall thru */
			case 5:				/* five pixels */
				*dst++ = ch;
				/* fall thru */
			case 4:				/* four pixels */
				*dst++ = ch;
				/* fall thru */
			case 3:				/* three pixels */
				*dst++ = ch;
				/* fall thru */
			case 2:				/* two pixels */
				*dst++ = ch;
				/* fall thru */
			case 1:				/* one pixel */
				*dst++ = ch;
				break;
			}
		}
	}
}  /* uncompress_16 */

/* compressor 15 : new header 8 color RLE */
void uncompress_8(BYTE *src, BYTE *dst)
{
	BYTE *final_dst;
	BYTE ch;

	final_dst = dst + (*(long *)src & 0x00FFFFFF);
	src += sizeof(long);
	while (dst < final_dst) {
		ch = *src++;
		if (ch & 0x80) {		/* 1 to 128 zeros */
			int cnt;
			
			for (cnt = (ch & 0x7F) + 1; cnt > 0; cnt--)
				*dst++ = 0;
		} else if (ch & 0x40) {	/* one or two pixels */
			*dst++ = (ch >> 3) & 0x07;
			if (dst < final_dst)
				*dst++ = ch & 0x07;
		} else {				/* runs of pixels other than zero */
			int cnt;
			BYTE pix;
			
			pix = ch & 0x07;
			if (pix == 0) {		/* extended run length */
				pix = (ch >> 3) & 0x07;
				for (cnt = *src++; cnt > 0; cnt--)
					*dst++ = pix;
			} else {			/* mini runs, 3 to 10 pixels */
				for (cnt = ((ch >> 3) & 0x07) + 3; cnt > 0; cnt--)
					*dst++ = pix;
			}
		}
	}
}  /* uncompress_8 */

//******************************************************************************
//******************************************************************************
//		MISC ROUTINES
//******************************************************************************
//******************************************************************************

/******************************************************************************
 Function: void ermac(WORD error)

 By: David Schwartz

 Date: Aug 9, 1994

 Parameters: error #

 Returns: None

 Description:	Report to terminal an error an lock

 System Errors:
  1 = 1 player state has 2 players active (THIS IS NOT GOOD)
  2 = winner_status bad (JOY)
  3 = exobj_er (MKUTIL)
  4 = exprc_er (MKUTIL)
  5 = object_setup could not get an object (mkutil)
  6 = decomp buffer outage
  7 =
  8 = swpal ran out of pals
  9 = rgbstuff could not find a pal
 10 = rgbstuff could not find a pal
 11 = color cycler could not find a pal
 12 = scroll error
 13 = reached code that was not expected to execute (mkutil, frame_a9)
 14 = delobj, cant find object to delete (mkobj)
 15 = alloc_vram_perm, cant alloc cache entry for perm image (mkutil.c)
 16 = no more process left to allocate, (mkos.c)
******************************************************************************/
#if SYS_DEBUG
extern WORD pmax;
extern WORD pcount;
#endif
void ermac(WORD error)
{
	int wait=0;

#if 0
	switch (error)
	{
		case 1:
			printf(("1 player state has 2 players active (THIS IS NOT GOOD)\n"));
			break;
		case 2:
			printf(("winner_status bad (MKJOY)\n"));
			break;
		case 3:
			printf(("exobj_er (MKUTIL)\n"));
			break;
		case 4:
			printf(("exprc_er (MKUTIL)\n"));
			break;
		case 5:
			printf(("object_setup could not get an object (mkutil)\n"));
			break;
		case 6:
			printf(("ran out of image decomp buffer, (mksony.c)\n"));
			break;
		case 7:
			break;
		case 8:
			printf(("swpal ran out of pals\n"));
			break;
		case 9:
			printf((" rgbstuff could not find a pal\n"));
			break;
		case 10:
			printf(("rgbstuff could not find a pal\n"));
			break;
		case 11:
			printf(("color cycler could not find a pal\n"));
			break;
		case 12:
			printf(("scroll error\n"));
			break;
		case 13:
			printf(("frame_a9 code wasn't to be executed (mkutil)\n"));
			break;
		case 14:
			printf(("delobj, object could not be found (mkobj)\n"));
			break;
		case 15:
			printf(("alloc_vram_perm, can't alloca vram cache entry (mkutil.c)\n"));
			break;
		case 16:
			printf(("process_create, no more process left to allocate (mkos.c)\n"));
			printf(("PCOUNT=%d PMAX=%d\n",pcount,pmax));
			printf(("FREE HEAD %x\n",free_head));
			break;
		default:
			printf(("UNKNOWN ERROR\n"));
	}
#endif

	while(wait==0)
		POLLING;
	return;
}


/* This function is to place the u64 joystick data into the same format as the sony
	This is the lazy way of doing things, but heck, it makes life easier.
	
	David
*/
#define MASK_JBLOCK1		0x0002
#define MASK_JRUN1			0x0001
static WORD u64_sony_map_tbl[]= 
//	SONY VALUE		U64 VALUE
{
	0,				// Remap nothing	0
	MASK_JLOK,		// Button_F			1
	MASK_JHIP,		// Button_C			2
	MASK_JLOP,		// Button_D			3
	MASK_JHIK,		// Button_E			4
	MASK_JBLOCK1,	// Button_A			5
	MASK_JRUN1,		// Button_B			6
	0,				// None				7
	0,				// None				8
	MASK_JRIGHT,	// Button_Right		9
	MASK_JLEFT,		// Button_Left		10
	MASK_JDOWN,		// Button_Down		11
	MASK_JUP,		// Button_Up		12
	MASK_START,		// Button_Start,	13
	MASK_SELECT,	// Button_G(Z)		14
	MASK_JRUN,		// Button_L			15
	MASK_JBLOCK,	// Button_R			16
	MASK_JUP,		// Button_Up		17
	MASK_JDOWN,		// Button_Down		18
	MASK_JLEFT,		// Button_Left		19
	MASK_JRIGHT,	// Button_Right		20
};
void map_u64_to_sony(void) 
{
	int i=0;
	int bit;
	LONG u64_button;
	WORD *swpad;
	
	swcurr.padvalue=0;
	
	while (i<gamepad_count && i<2)
	{
		bit=0;
		u64_button=pad[i].b & 0xfffff;
		swpad=(i==0)?(WORD *)&swcurr.u.p1pad : (WORD *)&swcurr.u.p2pad;
		*swpad=0;
		
		bit=1;
		while (u64_button)
		{
			if (u64_button & 1)
			{
				*swpad|=u64_sony_map_tbl[bit];		// perform remap
			
			}
			
			u64_button>>=1;				// next bit	
			bit++;
		}
		
		i++;
	}
	
	return;
}


extern char _wess_wmdSegmentRomStart[], _wess_wmdSegmentRomEnd[];
extern char _wess_wddSegmentRomStart[], _wess_wddSegmentRomEnd[];
extern char _wess_wsdSegmentRomStart[], _wess_wsdSegmentRomEnd[];


#if ENABLE_AUDIO
#define AUDIO_HEAP_SIZE	(330*1024)
u64 audio_heap[AUDIO_HEAP_SIZE/sizeof(u64)];

void error_callback_routine(char *msg,int err1,int err2);


int mydecomp( unsigned char decomp_type,
	      char          *fileref,
	      unsigned long file_offset,
	      char          *ramdest,
	      unsigned long uncompressed_size )
{
	WORD after;
	
    after=inflate_cart((char *)((unsigned long)fileref + file_offset),
		    &ramdest,
			(BYTE *)dpipe[(vid_dpipe_writing==-1)?0:vid_dpipe_writing].idcmp_base,
			(vid_dpipe_writing==-1)?240*1024:120*1024);

	if (after!=0)
    {
		return(-1);
    }
} 

void init_audio( void ) {
	u8 *audioHeapEnd;
    int wmdlength;
    WessConfig wess_config;
    int loaded;
    int modulesize;
    int seqsize;
	int seqtblsize;
    char *moduleptr;
    char *seqptr;
	char *seqtblptr;
	u32 old_ovmemptr;
	void *tempram;
	WessTweakAttr tweak;
	
	audio_init=0;
	
    alHeapInit( &sys_aheap, (BYTE *)audio_heap, AUDIO_HEAP_SIZE );    

	wess_set_error_callback(error_callback_routine);

	/* tweak audio */
	wess_get_tweaks(&tweak);
	tweak.dma_buffers+=12;
	tweak.dma_messages+=24;
	tweak.dma_buffer_length=0x500;
	tweak.updates+=24;
	tweak.tracks+=5;
	tweak.voices+=4;
	tweak.extra_samples=170;
	
	tweak.mask=TWEAK_DMA_BUFFERS+TWEAK_DMA_MESSAGES+TWEAK_DMA_BUFFER_LENGTH|TWEAK_UPDATES|TWEAK_TRACKS+TWEAK_VOICES+TWEAK_EXTRA_SAMPLES;
	wess_set_tweaks(&tweak);

	/* init audio */
    wess_config.audioframerate = SYS_FRAMES_PER_SEC;
    wess_config.outputsamplerate = 22050;
    wess_config.maxACMDSize=1024*3;
    wess_config.heap_ptr = &sys_aheap;
	wess_config.wdd_location=_wess_wddSegmentRomStart;
	wess_config.reverb_id=WESS_REVERB_NONE;	//WESS_REVERB_BIGROOM
	wess_config.revtbl_ptr=0;
	
    wess_init( &wess_config );
}

void init_audio_part2(void)
{
	u8 *audioHeapEnd;
    int wmdlength;
    WessConfig wess_config;
    int loaded;
    int modulesize;
    int seqsize;
	int seqtblsize;
    char *moduleptr;
    char *seqptr;
	char *seqtblptr;
	u32 old_ovmemptr;
	void *tempram;
	WessTweakAttr tweak;

    wess_set_decomp_callback(mydecomp);

	// now we load the .wmd image into a temporary ram space
    modulesize = wess_size_module(_wess_wmdSegmentRomStart );
    moduleptr = alHeapAlloc( &sys_aheap, 1, modulesize );
    loaded = wess_load_module( _wess_wmdSegmentRomStart, moduleptr, modulesize);

	seqtblsize=wess_seq_loader_sizeof(wess_get_master_status(),_wess_wsdSegmentRomStart);
	seqtblptr=alHeapAlloc(&sys_aheap,1,seqtblsize);

    wess_seq_loader_init(wess_get_master_status(),_wess_wsdSegmentRomStart,NoOpenSeqHandle,seqtblptr,seqtblsize);

    seqsize = wess_seq_range_sizeof(0,SOUND_FIRST_MUSIC_SEQ_NUM);
    seqptr = alHeapAlloc(&sys_aheap, 1, seqsize);
    seqsize = wess_seq_range_load(0,SOUND_FIRST_MUSIC_SEQ_NUM,seqptr);
	sys_music_buf = alHeapAlloc(&sys_aheap, 1, SOUND_MUSIC_SEQ_BUFFER_SIZE);
    /*
        alHeapAlloc is used one last time to see how much of the heap has been used.

        alHeapAlloc seems to allocate a minimum of 16 bytes.
    */
    audioHeapEnd = alHeapAlloc(&sys_aheap,1,4);
    audioHeapEnd += 16;

	printf(("MUSIC BUFFER SIZE %x\n",(ADDRESS)audioHeapEnd-(ADDRESS)audio_heap));
}
#endif


