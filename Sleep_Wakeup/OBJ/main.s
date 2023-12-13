;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduchar
	extern	__divuchar
	extern	_clear_ram
	extern	_multi_16b
	extern	_T0MD
	extern	_PCON1
	extern	_CMPCR
	extern	_BODCON
	extern	_PS0CV
	extern	_APHCON
	extern	_IOSTB
	extern	_IOSTA
	extern	_PWM5RH
	extern	_PWM5DUTY
	extern	_P5CR1
	extern	_PWM4DUTY
	extern	_P4CR1
	extern	_PS3CV
	extern	_PWM3DUTY
	extern	_T3CR2
	extern	_T3CR1
	extern	_TMR3
	extern	_OSCCR
	extern	_PWM2DUTY
	extern	_P2CR1
	extern	_TBHD
	extern	_TBHP
	extern	_IRCR
	extern	_BZ1CR
	extern	_PS1CV
	extern	_PWM1DUTY
	extern	_T1CR2
	extern	_T1CR1
	extern	_TMR1
	extern	_TM34RH
	extern	_TMRH
	extern	_PCHBUF
	extern	_STATUS
	extern	_PCL
	extern	_TMR0
	extern	_INTE2bits
	extern	_RFCbits
	extern	_INTEDGbits
	extern	_AWUCONbits
	extern	_INTFbits
	extern	_INTEbits
	extern	_BPHCONbits
	extern	_ABPLCONbits
	extern	_BWUCONbits
	extern	_PCONbits
	extern	_PORTBbits
	extern	_PORTAbits
	extern	__gptrget1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_main
	extern	_app_display_all
	extern	_get_cap
	extern	_is_chg_or_dischg
	extern	_get_p_ext_int_status
	extern	_init_ip53xs
	extern	_ip55xs_read4Bytes
	extern	_ip55xs_write4Bytes
	extern	_ip53xs_readByte
	extern	_ip53xs_writeByte
	extern	_i2c_readByte
	extern	_i2c_writeByte
	extern	_i2c_send_nack
	extern	_i2c_send_ack
	extern	_i2c_chk_ack
	extern	_i2c_stop
	extern	_i2c_start
	extern	_gpioKeyScan
	extern	__dly_us
	extern	_disable_breathing_mode
	extern	_enable_breathing_mode
	extern	_isr
	extern	_RESPIRATION_LAMP_TABLE
	extern	_DispTable
	extern	_INTE2
	extern	_RFC
	extern	_INTEDG
	extern	_AWUCON
	extern	_INTF
	extern	_INTE
	extern	_BPHCON
	extern	_ABPLCON
	extern	_BWUCON
	extern	_PCON
	extern	_PORTB
	extern	_PORTA
	extern	_gSysTick
	extern	_timer_slice_10ms
	extern	_displayDigit
	extern	_displayDecade
	extern	_displayHundred
	extern	_displayData
	extern	_forceDispTimer
	extern	_IP_DATA
	extern	_respiration_lamp_timer
	extern	_gpioKeyState
	extern	_gpioKeyWaitTimer
	extern	_skipGetCapTimer
	extern	_timer_slice_16ms
	extern	_bat_level_buf
	extern	_delaySleepTimer
	extern	_displayTimer
	extern	_underVoltageDispTimer
	extern	_indicator_light_mode
	extern	_always_light_timer_shadow
	extern	_always_light_timer
	extern	_moto_work_mode
	extern	_vFlag_1
	extern	_vFlag_0
	extern	_io_led_scan

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00

.segment "share_bank"
PSAVE:
	.res 1
.segment "share_bank"
SSAVE:
	.res 1
.segment "share_bank"
WSAVE:
	.res 1
.segment "share_bank"
STK12:
	.res 1
.segment "share_bank"
STK11:
	.res 1
.segment "share_bank"
STK10:
	.res 1
.segment "share_bank"
STK09:
	.res 1
.segment "share_bank"
STK08:
	.res 1
.segment "share_bank"
STK07:
	.res 1
.segment "share_bank"
STK06:
	.res 1
.segment "share_bank"
STK05:
	.res 1
.segment "share_bank"
STK04:
	.res 1
.segment "share_bank"
STK03:
	.res 1
.segment "share_bank"
STK02:
	.res 1
.segment "share_bank"
STK01:
	.res 1
.segment "share_bank"
STK00:
	.res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_vFlag_0:
	.res 1
	.debuginfo complex-type (symbol "_vFlag_0" 1 global "main.c" 36 (basetype 1 unsigned))

.segment "uninit"
_vFlag_1:
	.res 1
	.debuginfo complex-type (symbol "_vFlag_1" 1 global "main.c" 46 (basetype 1 unsigned))

.segment "uninit"
_moto_work_mode:
	.res 1
	.debuginfo complex-type (symbol "_moto_work_mode" 1 global "main.c" 56 (basetype 1 unsigned))

.segment "uninit"
_always_light_timer:
	.res 1
	.debuginfo complex-type (symbol "_always_light_timer" 1 global "main.c" 58 (basetype 1 unsigned))

.segment "uninit"
_always_light_timer_shadow:
	.res 1
	.debuginfo complex-type (symbol "_always_light_timer_shadow" 1 global "main.c" 59 (basetype 1 unsigned))

.segment "uninit"
_indicator_light_mode:
	.res 1
	.debuginfo complex-type (symbol "_indicator_light_mode" 1 global "main.c" 60 (basetype 1 unsigned))

.segment "uninit"
_underVoltageDispTimer:
	.res 1
	.debuginfo complex-type (symbol "_underVoltageDispTimer" 1 global "main.c" 61 (basetype 1 unsigned))

.segment "uninit"
_displayTimer:
	.res 1
	.debuginfo complex-type (symbol "_displayTimer" 1 global "main.c" 62 (basetype 1 unsigned))

.segment "uninit"
_delaySleepTimer:
	.res 1
	.debuginfo complex-type (symbol "_delaySleepTimer" 1 global "main.c" 63 (basetype 1 unsigned))

.segment "uninit"
_bat_level_buf:
	.res 1
	.debuginfo complex-type (symbol "_bat_level_buf" 1 global "main.c" 65 (basetype 1 unsigned))

.segment "uninit"
_timer_slice_16ms:
	.res 1
	.debuginfo complex-type (symbol "_timer_slice_16ms" 1 global "main.c" 66 (basetype 1 unsigned))

.segment "uninit"
_skipGetCapTimer:
	.res 1
	.debuginfo complex-type (symbol "_skipGetCapTimer" 1 global "main.c" 67 (basetype 1 unsigned))

.segment "uninit"
_gpioKeyWaitTimer:
	.res 1
	.debuginfo complex-type (symbol "_gpioKeyWaitTimer" 1 global "main.c" 68 (basetype 1 unsigned))

.segment "uninit"
_gpioKeyState:
	.res 1
	.debuginfo complex-type (symbol "_gpioKeyState" 1 global "main.c" 69 (basetype 1 unsigned))

.segment "uninit"
_respiration_lamp_timer:
	.res 1
	.debuginfo complex-type (symbol "_respiration_lamp_timer" 1 global "main.c" 72 (basetype 1 unsigned))

.segment "uninit"
_IP_DATA:
	.res 4
	.debuginfo complex-type (symbol "_IP_DATA" 4 global "main.c" 75 (array 4 (basetype 1 unsigned)))

.segment "uninit"
_forceDispTimer:
	.res 1
	.debuginfo complex-type (symbol "_forceDispTimer" 1 global "main.c" 76 (basetype 1 unsigned))

.segment "uninit"
_displayData:
	.res 1
	.debuginfo complex-type (symbol "_displayData" 1 global "main.c" 78 (basetype 1 unsigned))

.segment "uninit"
_displayHundred:
	.res 1
	.debuginfo complex-type (symbol "_displayHundred" 1 global "main.c" 79 (basetype 1 unsigned))

.segment "uninit"
_displayDecade:
	.res 1
	.debuginfo complex-type (symbol "_displayDecade" 1 global "main.c" 80 (basetype 1 unsigned))

.segment "uninit"
_displayDigit:
	.res 1
	.debuginfo complex-type (symbol "_displayDigit" 1 global "main.c" 81 (basetype 1 unsigned))

.segment "uninit"
_timer_slice_10ms:
	.res 1
	.debuginfo complex-type (symbol "_timer_slice_10ms" 1 global "main.c" 82 (basetype 1 unsigned))

.segment "uninit"
_gSysTick:
	.res 1
	.debuginfo complex-type (symbol "_gSysTick" 1 global "main.c" 84 (basetype 1 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x101B:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x101C:
	.res	1
.segment "uninit"
r0x101D:
	.res	1
.segment "uninit"
r0x101E:
	.res	1
.segment "uninit"
r0x101F:
	.res	1
.segment "uninit"
r0x1020:
	.res	1
.segment "uninit"
r0x1021:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x102F:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
_isr_timerCnt_65536_5:
	.res	1
	.debuginfo complex-type (symbol "_isr_timerCnt_65536_5" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_isr_respiration_lamp_series_65536_5:
	.res	1
	.debuginfo complex-type (symbol "_isr_respiration_lamp_series_65536_5" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_isr_led_lamp_65536_5:
	.res	1
	.debuginfo complex-type (symbol "_isr_led_lamp_65536_5" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_fsr:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_fsr" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk00:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk00" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
___sdcc_saved_stk01:
	.res	1
	.debuginfo complex-type (symbol "___sdcc_saved_stk01" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_get_p_ext_int_status_counter_65536_116:
	.res	1
	.debuginfo complex-type (symbol "_get_p_ext_int_status_counter_65536_116" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_is_chg_or_dischg_counter_65536_126:
	.res	1
	.debuginfo complex-type (symbol "_is_chg_or_dischg_counter_65536_126" 1 global "" 0 (basetype 1 unsigned))
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_io_led_scan_indexScan_65536_31:
	.debuginfo complex-type (symbol "_io_led_scan_indexScan_65536_31" 1 local "main.c" 310 (basetype 1 unsigned))

	dw	0x00	; 0


.segment "code"
_DispTable:
	retia 0x3f	; 63
	retia 0x06	; 6
	retia 0x5b	; 91
	retia 0x4f	; 79	'O'
	retia 0x66	; 102	'f'
	retia 0x6d	; 109	'm'
	retia 0x7d	; 125
	retia 0x07	; 7
	retia 0x7f	; 127
	retia 0x6f	; 111	'o'
	retia 0x79	; 121	'y'
	retia 0x50	; 80	'P'
	retia 0x76	; 118	'v'
	retia 0x00	; 0

.segment "code"
_RESPIRATION_LAMP_TABLE:
	retia 0x01	; 1
	retia 0x01	; 1
	retia 0x01	; 1
	retia 0x01	; 1
	retia 0x01	; 1
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x02	; 2
	retia 0x03	; 3
	retia 0x03	; 3
	retia 0x03	; 3
	retia 0x03	; 3
	retia 0x03	; 3
	retia 0x04	; 4
	retia 0x04	; 4
	retia 0x04	; 4
	retia 0x05	; 5
	retia 0x05	; 5
	retia 0x05	; 5
	retia 0x06	; 6
	retia 0x06	; 6
	retia 0x06	; 6
	retia 0x07	; 7
	retia 0x07	; 7
	retia 0x08	; 8
	retia 0x09	; 9
	retia 0x09	; 9
	retia 0x0a	; 10
	retia 0x0b	; 11
	retia 0x0b	; 11
	retia 0x0c	; 12
	retia 0x0d	; 13
	retia 0x0e	; 14
	retia 0x0f	; 15
	retia 0x10	; 16
	retia 0x11	; 17
	retia 0x12	; 18
	retia 0x14	; 20
	retia 0x15	; 21
	retia 0x17	; 23
	retia 0x18	; 24
	retia 0x1a	; 26
	retia 0x1c	; 28
	retia 0x1e	; 30
	retia 0x20	; 32
	retia 0x22	; 34
	retia 0x25	; 37
	retia 0x27	; 39
	retia 0x2a	; 42
	retia 0x2d	; 45
	retia 0x30	; 48	'0'
	retia 0x34	; 52	'4'
	retia 0x38	; 56	'8'
	retia 0x3c	; 60
	retia 0x40	; 64
	retia 0x44	; 68	'D'
	retia 0x49	; 73	'I'
	retia 0x4f	; 79	'O'
	retia 0x54	; 84	'T'
	retia 0x5a	; 90	'Z'
	retia 0x61	; 97	'a'
	retia 0x68	; 104	'h'
	retia 0x6f	; 111	'o'
	retia 0x77	; 119	'w'
	retia 0x80	; 128
	retia 0x89	; 137
	retia 0x93	; 147
	retia 0x9d	; 157
	retia 0xa8	; 168
	retia 0xb4	; 180
	retia 0xc1	; 193
	retia 0xcf	; 207
	retia 0xde	; 222
	retia 0xee	; 238
	retia 0xff	; 255
	retia 0xff	; 255
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _io_led_scan
;   __gptrget1
;   _io_led_scan
;   __gptrget1
;4 compiler assigned registers:
;   STK00
;   STK01
;   r0x1033
;   r0x1034
;; Starting pCode block
_isr:
; 0 exit points
	.line	190, "main.c"; 	void isr(void) __interrupt(0) // 64us  8MHz 2T
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	BANKSEL	___sdcc_saved_stk00
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	BANKSEL	___sdcc_saved_stk01
	MOVAR	___sdcc_saved_stk01
	.line	196, "main.c"; 	if (TM0IF)
	BTRSS	_INTFbits,0
	MGOTO	_02034_DS_
	.line	198, "main.c"; 	TM0IF = 0;
	MOVIA	0xfe
	MOVAR	(_INTFbits + 0)
	.line	203, "main.c"; 	timerCnt++;
	BANKSEL	_isr_timerCnt_65536_5
	INCR	_isr_timerCnt_65536_5,F
	.line	205, "main.c"; 	if (!(timerCnt & 0x0F))
	MOVR	_isr_timerCnt_65536_5,W
	ANDIA	0x0f
	BTRSS	STATUS,2
	MGOTO	_00015_DS_
	.line	209, "main.c"; 	bFlag_gSysTick_Change = 1; // 1ms
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,0
	.line	211, "main.c"; 	if (!(timerCnt))
	BANKSEL	_isr_timerCnt_65536_5
	MOVR	_isr_timerCnt_65536_5,W
	BTRSS	STATUS,2
	MGOTO	_00015_DS_
	.line	214, "main.c"; 	bFlag_slice_16ms = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,1
_00015_DS_:
	.line	218, "main.c"; 	if (!(timerCnt & 0x07))
	BANKSEL	_isr_timerCnt_65536_5
	MOVR	_isr_timerCnt_65536_5,W
	ANDIA	0x07
	BTRSC	STATUS,2
	.line	220, "main.c"; 	io_led_scan();
	MCALL	_io_led_scan
	.line	223, "main.c"; 	if (bFlag_is_breathing_mode) // 100us
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,0
	MGOTO	_02034_DS_
	.line	225, "main.c"; 	respiration_lamp_timer++;
	BANKSEL	_respiration_lamp_timer
	MOVR	_respiration_lamp_timer,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
	INCR	r0x1033,W
	BANKSEL	_respiration_lamp_timer
	MOVAR	_respiration_lamp_timer
	.line	227, "main.c"; 	if (!(respiration_lamp_timer))
	MOVR	_respiration_lamp_timer,W
	BTRSS	STATUS,2
	MGOTO	_02021_DS_
	.line	229, "main.c"; 	if (bFlag_inc_or_dec)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,1
	MGOTO	_02018_DS_
	.line	231, "main.c"; 	if (!(--respiration_lamp_series))
	BANKSEL	_isr_respiration_lamp_series_65536_5
	DECRSZ	_isr_respiration_lamp_series_65536_5,F
	MGOTO	_02019_DS_
	.line	233, "main.c"; 	bFlag_inc_or_dec = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,1
	.line	235, "main.c"; 	if (++indicator_light_mode > 2)
	BANKSEL	_indicator_light_mode
	INCR	_indicator_light_mode,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BANKSEL	_indicator_light_mode
	MOVAR	_indicator_light_mode
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x3=3), size=1
	MOVIA	0x03
	BANKSEL	r0x1033
	SUBAR	r0x1033,W
	BTRSS	STATUS,0
	MGOTO	_02019_DS_
	.line	237, "main.c"; 	indicator_light_mode = 0;
	BANKSEL	_indicator_light_mode
	CLRR	_indicator_light_mode
	MGOTO	_02019_DS_
_02018_DS_:
	.line	243, "main.c"; 	if (++respiration_lamp_series >= CONST_RESPIRATION_LAMP_SERIES)
	BANKSEL	_isr_respiration_lamp_series_65536_5
	INCR	_isr_respiration_lamp_series_65536_5,F
;;unsigned compare: left < lit(0x50=80), size=1
	MOVIA	0x50
	SUBAR	_isr_respiration_lamp_series_65536_5,W
	BTRSS	STATUS,0
	MGOTO	_02019_DS_
	.line	245, "main.c"; 	respiration_lamp_series = CONST_RESPIRATION_LAMP_SERIES;
	MOVIA	0x50
	MOVAR	_isr_respiration_lamp_series_65536_5
	.line	246, "main.c"; 	bFlag_inc_or_dec = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,1
_02019_DS_:
	.line	250, "main.c"; 	led_lamp = RESPIRATION_LAMP_TABLE[respiration_lamp_series];
	BANKSEL	_isr_respiration_lamp_series_65536_5
	MOVR	_isr_respiration_lamp_series_65536_5,W
	ADDIA	(_RESPIRATION_LAMP_TABLE + 0)
	BANKSEL	r0x1033
	MOVAR	r0x1033
	MOVIA	((_RESPIRATION_LAMP_TABLE + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BANKSEL	r0x1033
	MOVR	r0x1033,W
	MOVAR	STK01
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_isr_led_lamp_65536_5
	MOVAR	_isr_led_lamp_65536_5
_02021_DS_:
	.line	253, "main.c"; 	if (respiration_lamp_timer >= led_lamp)
	BANKSEL	_isr_led_lamp_65536_5
	MOVR	_isr_led_lamp_65536_5,W
	BANKSEL	_respiration_lamp_timer
	SUBAR	_respiration_lamp_timer,W
	BTRSS	STATUS,0
	MGOTO	_02029_DS_
	.line	255, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTBbits,4
	.line	256, "main.c"; 	P_LED_G_OFF;
	BCR	_PORTBbits,3
	.line	257, "main.c"; 	P_LED_B_OFF; // white led
	BCR	_PORTBbits,2
	MGOTO	_02034_DS_
_02029_DS_:
	.line	261, "main.c"; 	if (0x01 == indicator_light_mode)
	BANKSEL	_indicator_light_mode
	MOVR	_indicator_light_mode,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02026_DS_
	.line	263, "main.c"; 	P_LED_B_ON; // white
	BSR	_PORTBbits,2
	MGOTO	_02034_DS_
_02026_DS_:
	.line	265, "main.c"; 	else if (0x02 == indicator_light_mode)
	BANKSEL	_indicator_light_mode
	MOVR	_indicator_light_mode,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02023_DS_
	.line	267, "main.c"; 	P_LED_G_ON; // green
	BSR	_PORTBbits,3
	MGOTO	_02034_DS_
_02023_DS_:
	.line	271, "main.c"; 	P_LED_R_ON; // orange
	BSR	_PORTBbits,4
_02034_DS_:
	.line	277, "main.c"; 	if (INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_02037_DS_
	.line	279, "main.c"; 	INTFbits.PABIF = 0; // Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
_02037_DS_:
	.line	281, "main.c"; 	}
	BANKSEL	___sdcc_saved_stk01
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	BANKSEL	___sdcc_saved_stk00
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	BANKSEL	___sdcc_saved_fsr
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
; code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _gpioKeyScan
;   _get_p_ext_int_status
;   _is_chg_or_dischg
;   _get_cap
;   _app_display_all
;   _gpioKeyScan
;   _get_p_ext_int_status
;   _is_chg_or_dischg
;   _get_cap
;   _app_display_all
;1 compiler assigned register :
;   r0x102E
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	1437, "main.c"; 	DISI();
	DISI
	.line	1439, "main.c"; 	BPHCON = (unsigned char)~C_PB0_PHB; // Enable PB1 Pull-High resistor
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	1442, "main.c"; 	IOSTA = 0xFF;
	MOVIA	0xff
	IOST	_IOSTA
	.line	1443, "main.c"; 	IOSTB = 0xFF;
	IOST	_IOSTB
	.line	1445, "main.c"; 	PORTA = 0x00; // PORTB data buffer=0x00
	CLRR	_PORTA
	.line	1446, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	1452, "main.c"; 	OSCCR = C_FLOSC_Sel; // OSCCR[0]=0 , FOSC is Low-frequency oscillation (FLOSC)
	CLRA	
	.debuginfo linetag 1
	SFUN	_OSCCR
	NOP	
	.line	1455, "main.c"; 	OSCCR = C_FHOSC_Sel; // OSCCR[0]=1 , FOSC is high-frequency oscillation (FHOSC)
	MOVIA	0x01
	.debuginfo linetag 1
	SFUN	_OSCCR
	NOP	
	.line	1470, "main.c"; 	PCON1 = 0x00; // Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	1473, "main.c"; 	T0MD = 0x0F; // 8M,2T  Prescaler0 to wdt,
	MOVIA	0x0f
	T0MD	
	.line	1482, "main.c"; 	INTE = 0x01; // Timer0 overflow interrupt enable bit
	MOVIA	0x01
	MOVAR	_INTE
	.line	1485, "main.c"; 	PCON = 0xC8; //  C_WDT_En | C_LVR_En;                // Enable WDT ,  Enable LVR
	MOVIA	0xc8
	MOVAR	_PCON
	.line	1487, "main.c"; 	PCON1 = 0x01; //  C_TMR0_En;                          // Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	1488, "main.c"; 	ENI();
	ENI
	.line	1490, "main.c"; 	delaySleepTimer = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x14
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	.line	1491, "main.c"; 	bFlag_power_on = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,4
	.line	1496, "main.c"; 	forceDispTimer = 20;
	MOVIA	0x14
	BANKSEL	_forceDispTimer
	MOVAR	_forceDispTimer
	.line	1497, "main.c"; 	P_LED_R_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BCR	r0x102E,4
	MOVR	r0x102E,W
	IOST	_IOSTB
	.line	1498, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTBbits,4
	.line	1499, "main.c"; 	P_LED_G_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x102E
	BCR	r0x102E,3
	MOVR	r0x102E,W
	IOST	_IOSTB
	.line	1500, "main.c"; 	P_LED_G_OFF;
	BCR	_PORTBbits,3
	.line	1501, "main.c"; 	P_LED_B_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x102E
	BCR	r0x102E,2
	MOVR	r0x102E,W
	IOST	_IOSTB
	.line	1502, "main.c"; 	P_LED_B_OFF;
	BCR	_PORTBbits,2
	.line	1504, "main.c"; 	displayTimer = CONST_TIMER_DISP;
	MOVIA	0x14
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
_02529_DS_:
	.line	1511, "main.c"; 	CLRWDT();
	clrwdt
	.line	1512, "main.c"; 	if (bFlag_gSysTick_Change)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,0
	MGOTO	_02529_DS_
	.line	1514, "main.c"; 	bFlag_gSysTick_Change = 0;
	BCR	_vFlag_0,0
	.line	1515, "main.c"; 	if (bFlag_slice_16ms)
	BTRSS	_vFlag_0,1
	MGOTO	_02529_DS_
	.line	1518, "main.c"; 	bFlag_slice_16ms = 0;
	BCR	_vFlag_0,1
	.line	1519, "main.c"; 	timer_slice_16ms++;
	BANKSEL	_timer_slice_16ms
	MOVR	_timer_slice_16ms,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	INCR	r0x102E,W
	BANKSEL	_timer_slice_16ms
	MOVAR	_timer_slice_16ms
	.line	1520, "main.c"; 	gpioKeyScan();
	MCALL	_gpioKeyScan
	.line	1521, "main.c"; 	get_p_ext_int_status();
	MCALL	_get_p_ext_int_status
	.line	1522, "main.c"; 	if ((bFlag_p_ext_int_is_high) && (P_I2C_INT)) // if (bFlag_p_ext_int_is_high)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,3
	MGOTO	_02503_DS_
	BTRSC	_PORTAbits,2
	.line	1524, "main.c"; 	is_chg_or_dischg();
	MCALL	_is_chg_or_dischg
_02503_DS_:
	.line	1527, "main.c"; 	if (!(timer_slice_16ms & 0x1F))
	BANKSEL	_timer_slice_16ms
	MOVR	_timer_slice_16ms,W
	ANDIA	0x1f
	BTRSS	STATUS,2
	MGOTO	_02512_DS_
	.line	1529, "main.c"; 	bFlag_blink ^= 1;
	MOVIA	0x80
	BANKSEL	_vFlag_0
	XORAR	_vFlag_0,F
	.line	1534, "main.c"; 	if ((bFlag_p_ext_int_is_high) && (P_I2C_INT))
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,3
	MGOTO	_02509_DS_
	BTRSS	_PORTAbits,2
	MGOTO	_02509_DS_
	.line	1536, "main.c"; 	if (0 == skipGetCapTimer)
	BANKSEL	_skipGetCapTimer
	MOVR	_skipGetCapTimer,W
	BTRSS	STATUS,2
	MGOTO	_02506_DS_
	.line	1538, "main.c"; 	get_cap();
	MCALL	_get_cap
	MGOTO	_02509_DS_
_02506_DS_:
	.line	1542, "main.c"; 	skipGetCapTimer--;
	BANKSEL	_skipGetCapTimer
	MOVR	_skipGetCapTimer,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	DECR	r0x102E,W
	BANKSEL	_skipGetCapTimer
	MOVAR	_skipGetCapTimer
_02509_DS_:
	.line	1545, "main.c"; 	app_display_all();
	MCALL	_app_display_all
_02512_DS_:
	.line	1547, "main.c"; 	if (!(timer_slice_16ms & 0x3F))
	BANKSEL	_timer_slice_16ms
	MOVR	_timer_slice_16ms,W
	ANDIA	0x3f
	BTRSS	STATUS,2
	MGOTO	_02529_DS_
	.line	1552, "main.c"; 	if ((0 == bFlag_charger_on) && (!P_I2C_INT))
	BANKSEL	_vFlag_1
	BTRSC	_vFlag_1,5
	MGOTO	_02529_DS_
	BTRSC	_PORTAbits,2
	MGOTO	_02529_DS_
	.line	1557, "main.c"; 	if (!delaySleepTimer)
	BANKSEL	_delaySleepTimer
	MOVR	_delaySleepTimer,W
	BTRSS	STATUS,2
	MGOTO	_02517_DS_
	.line	1564, "main.c"; 	CLRWDT();
	clrwdt
	.line	1565, "main.c"; 	INTE = 0x00;  // Timer0 overflow interrupt enable bit
	CLRR	_INTE
	.line	1566, "main.c"; 	PCON = 0x58;  // PCON = 0xC8;
	MOVIA	0x58
	MOVAR	_PCON
	.line	1567, "main.c"; 	PCON1 = 0x00; // Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	1568, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	1569, "main.c"; 	DISI();
	DISI
	.line	1577, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	1578, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	1579, "main.c"; 	IOSTA = 0x00;
	CLRA	
	IOST	_IOSTA
	.line	1580, "main.c"; 	IOSTB = 0x00;
	IOST	_IOSTB
	.line	1581, "main.c"; 	P_KEY_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BSR	r0x102E,0
	MOVR	r0x102E,W
	IOST	_IOSTB
	.line	1582, "main.c"; 	P_KEY_IPS_INPUT;
	IOSTR	_IOSTB
	MOVAR	r0x102E
	BSR	r0x102E,1
	MOVR	r0x102E,W
	IOST	_IOSTB
	.line	1583, "main.c"; 	P_I2C_INT_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x102E
	BSR	r0x102E,2
	MOVR	r0x102E,W
	IOST	_IOSTA
	.line	1584, "main.c"; 	P_I2C_SCL_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x102E
	BSR	r0x102E,4
	MOVR	r0x102E,W
	IOST	_IOSTA
	.line	1585, "main.c"; 	P_I2C_SDA_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x102E
	BSR	r0x102E,3
	MOVR	r0x102E,W
	IOST	_IOSTA
	.line	1608, "main.c"; 	AWUCON = (C_PA2_Wakeup); // OK
	MOVIA	0x04
	MOVAR	_AWUCON
	.line	1609, "main.c"; 	BWUCON = C_PB0_Wakeup;   // OK
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	1611, "main.c"; 	INTE = C_INT_PABKey; // Enable PortB input change interrupt
	MOVIA	0x02
	MOVAR	_INTE
	.line	1612, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	1618, "main.c"; 	if (!P_KEY)
	BTRSS	_PORTBbits,0
	MGOTO	_02515_DS_
	.line	1622, "main.c"; 	NOP();
	nop
	.line	1623, "main.c"; 	NOP();
	nop
	.line	1624, "main.c"; 	UPDATE_REG(PORTB);
	MOVR	_PORTB,F
	.line	1625, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	1626, "main.c"; 	NOP();
	nop
	.line	1627, "main.c"; 	NOP();
	nop
	.line	1628, "main.c"; 	SLEEP();
	sleep
	.line	1629, "main.c"; 	NOP();
	nop
	.line	1630, "main.c"; 	NOP();
	nop
_02515_DS_:
	.line	1632, "main.c"; 	INTFbits.PABIF = 0;
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
	.line	1636, "main.c"; 	delaySleepTimer = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x14
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	.line	1637, "main.c"; 	skipGetCapTimer = 3;
	MOVIA	0x03
	BANKSEL	_skipGetCapTimer
	MOVAR	_skipGetCapTimer
	.line	1643, "main.c"; 	PCON = 0xC8;
	MOVIA	0xc8
	MOVAR	_PCON
	.line	1656, "main.c"; 	PCON1 |= C_TMR0_En;            // Enable Timer0
	IOSTR	_PCON1
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BSR	r0x102E,0
	MOVR	r0x102E,W
	IOST	_PCON1
	.line	1657, "main.c"; 	INTE = (0x01 /*| C_INT_LVD*/); // Timer0 overflow interrupt enable bit
	MOVIA	0x01
	MOVAR	_INTE
	.line	1658, "main.c"; 	ENI();
	ENI
	MGOTO	_02529_DS_
_02517_DS_:
	.line	1662, "main.c"; 	delaySleepTimer--;
	BANKSEL	_delaySleepTimer
	MOVR	_delaySleepTimer,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	DECR	r0x102E,W
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	MGOTO	_02529_DS_
	.line	1671, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;   __divuchar
;   __moduchar
;   __gptrget1
;   __gptrget1
;   _disable_breathing_mode
;   __gptrget1
;   __gptrget1
;   __divuchar
;   __moduchar
;   __gptrget1
;   __gptrget1
;   __divuchar
;   __moduchar
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __divuchar
;   __moduchar
;   __gptrget1
;   __gptrget1
;   _disable_breathing_mode
;   __gptrget1
;   __gptrget1
;   __divuchar
;   __moduchar
;   __gptrget1
;   __gptrget1
;   __divuchar
;   __moduchar
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;5 compiler assigned registers:
;   r0x101B
;   STK01
;   STK00
;   r0x101C
;   r0x101D
;; Starting pCode block
.segment "code"; module=main, function=_app_display_all
	.debuginfo subprogram _app_display_all
;local variable name mapping:
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 1228 (basetype 1 unsigned) split "r0x101B")
	.debuginfo complex-type (local-sym "_j" 1 "main.c" 1228 (basetype 1 unsigned) split "r0x101C")
_app_display_all:
; 2 exit points
	.line	1231, "main.c"; 	if (forceDispTimer)
	BANKSEL	_forceDispTimer
	MOVR	_forceDispTimer,W
	BTRSC	STATUS,2
	MGOTO	_02495_DS_
	.line	1233, "main.c"; 	forceDispTimer--;
	MOVR	_forceDispTimer,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	DECR	r0x101B,W
	BANKSEL	_forceDispTimer
	MOVAR	_forceDispTimer
	.line	1234, "main.c"; 	displayHundred = DispTable[1];
	MOVIA	(_DispTable + 1)
	MOVAR	STK01
	MOVIA	((_DispTable + 1) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayHundred
	MOVAR	_displayHundred
	.line	1236, "main.c"; 	displayHundred |= (SEG_E | SEG_D);
	MOVIA	0x18
	IORAR	_displayHundred,F
	.line	1237, "main.c"; 	displayDecade = DispTable[8];
	MOVIA	(_DispTable + 8)
	MOVAR	STK01
	MOVIA	((_DispTable + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
;;102	MOVR	r0x101B,W
	.line	1240, "main.c"; 	if (!forceDispTimer)
	BANKSEL	_forceDispTimer
	MOVR	_forceDispTimer,W
	BTRSS	STATUS,2
	MGOTO	_02497_DS_
	.line	1242, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1243, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
	.line	1244, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
	MGOTO	_02497_DS_
_02495_DS_:
	.line	1249, "main.c"; 	else if (bFlag_charger_on) // bFlag_charger_nbFlag_vin_plug_in
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,5
	MGOTO	_02492_DS_
	.line	1251, "main.c"; 	underVoltageDispTimer = 0;
	BANKSEL	_underVoltageDispTimer
	CLRR	_underVoltageDispTimer
	.line	1253, "main.c"; 	displayTimer = CONST_TIMER_DISP; // 拨出显示5秒
	MOVIA	0x14
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
;;unsigned compare: left < lit(0x64=100), size=1
	.line	1255, "main.c"; 	if (displayData < 100) // 充电
	MOVIA	0x64
	BANKSEL	_displayData
	SUBAR	_displayData,W
	BTRSC	STATUS,0
	MGOTO	_02454_DS_
	.line	1257, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1258, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00001_DS_
	.line	1260, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00001_DS_:
	.line	1263, "main.c"; 	if (bFlag_blink)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,7
	MGOTO	_02449_DS_
	.line	1265, "main.c"; 	i = displayData / 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__divuchar
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	1266, "main.c"; 	j = displayData % 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__moduchar
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	1267, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
	.line	1269, "main.c"; 	if (i) // 十位是0 不显示
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	MGOTO	_02447_DS_
	.line	1271, "main.c"; 	displayDecade = DispTable[i];
	MOVIA	(_DispTable + 0)
	ADDAR	r0x101B,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK01
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
_02447_DS_:
	.line	1274, "main.c"; 	displayDigit = DispTable[j];
	MOVIA	(_DispTable + 0)
	BANKSEL	r0x101C
	ADDAR	r0x101C,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK01
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	MGOTO	_02497_DS_
_02449_DS_:
	.line	1278, "main.c"; 	displayDigit = DISP_ALL_OFF; // 个位闪烁 充电
	BANKSEL	_displayDigit
	CLRR	_displayDigit
	MGOTO	_02497_DS_
_02454_DS_:
	.line	1283, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	.line	1284, "main.c"; 	P_LED_G_ON;
	BSR	_PORTBbits,3
	.line	1285, "main.c"; 	displayHundred = DispTable[1];
	MOVIA	(_DispTable + 1)
	MOVAR	STK01
	MOVIA	((_DispTable + 1) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayHundred
	MOVAR	_displayHundred
	.line	1286, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00002_DS_
	.line	1288, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00002_DS_:
	.line	1290, "main.c"; 	displayDecade = DispTable[0];
	MOVIA	(_DispTable + 0)
	MOVAR	STK01
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
;;101	MOVR	r0x101B,W
	.line	1291, "main.c"; 	displayDigit = DispTable[0];
	MGOTO	_02497_DS_
_02492_DS_:
	.line	1298, "main.c"; 	if (underVoltageDispTimer) // 欠压关机显示
	BANKSEL	_underVoltageDispTimer
	MOVR	_underVoltageDispTimer,W
	BTRSC	STATUS,2
	MGOTO	_02489_DS_
	.line	1300, "main.c"; 	underVoltageDispTimer--;
	MOVR	_underVoltageDispTimer,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	DECR	r0x101B,W
	BANKSEL	_underVoltageDispTimer
	MOVAR	_underVoltageDispTimer
	.line	1301, "main.c"; 	displayTimer = 0;
	BANKSEL	_displayTimer
	CLRR	_displayTimer
	.line	1302, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1303, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00003_DS_
	.line	1305, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00003_DS_:
	.line	1314, "main.c"; 	if (underVoltageDispTimer % 2)
	BANKSEL	_underVoltageDispTimer
	BTRSS	_underVoltageDispTimer,0
	MGOTO	_02464_DS_
	.line	1316, "main.c"; 	i = displayData / 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__divuchar
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	1317, "main.c"; 	j = displayData % 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__moduchar
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	1319, "main.c"; 	if (i)
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	MGOTO	_02459_DS_
	.line	1321, "main.c"; 	displayDecade = DispTable[i];
	MOVIA	(_DispTable + 0)
	ADDAR	r0x101B,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK01
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
	MGOTO	_02460_DS_
_02459_DS_:
	.line	1325, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
_02460_DS_:
	.line	1328, "main.c"; 	displayDigit = DispTable[j];
	MOVIA	(_DispTable + 0)
	BANKSEL	r0x101C
	ADDAR	r0x101C,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK01
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	MGOTO	_00004_DS_
_02464_DS_:
	.line	1332, "main.c"; 	if (0 == displayData)
	BANKSEL	_displayData
	MOVR	_displayData,W
	BTRSS	STATUS,2
	MGOTO	_00004_DS_
	.line	1334, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
_00004_DS_:
	.line	1338, "main.c"; 	if (0 == underVoltageDispTimer)
	BANKSEL	_underVoltageDispTimer
	MOVR	_underVoltageDispTimer,W
	BTRSS	STATUS,2
	MGOTO	_02497_DS_
	.line	1340, "main.c"; 	if (displayData)
	BANKSEL	_displayData
	MOVR	_displayData,W
	BTRSC	STATUS,2
	MGOTO	_02497_DS_
	.line	1342, "main.c"; 	displayData--;
	MOVR	_displayData,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	DECR	r0x101B,W
	BANKSEL	_displayData
	MOVAR	_displayData
	.line	1343, "main.c"; 	underVoltageDispTimer = (CONST_TIMER_DISP_UV - 1);
	MOVIA	0x0a
	BANKSEL	_underVoltageDispTimer
	MOVAR	_underVoltageDispTimer
	MGOTO	_02497_DS_
_02489_DS_:
	.line	1347, "main.c"; 	else if (displayTimer)
	BANKSEL	_displayTimer
	MOVR	_displayTimer,W
	BTRSC	STATUS,2
	MGOTO	_02486_DS_
	.line	1349, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1351, "main.c"; 	displayTimer--;
	BANKSEL	_displayTimer
	MOVR	_displayTimer,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	DECR	r0x101B,W
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
;;unsigned compare: left < lit(0x64=100), size=1
	.line	1356, "main.c"; 	if (displayData < 100)
	MOVIA	0x64
	BANKSEL	_displayData
	SUBAR	_displayData,W
	BTRSC	STATUS,0
	MGOTO	_02483_DS_
	.line	1358, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1359, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00005_DS_
	.line	1361, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00005_DS_:
	.line	1364, "main.c"; 	if (bFlag_blink)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,7
	MGOTO	_02478_DS_
	.line	1366, "main.c"; 	i = displayData / 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__divuchar
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	1367, "main.c"; 	j = displayData % 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__moduchar
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	1369, "main.c"; 	if (i)
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	MGOTO	_02473_DS_
	.line	1371, "main.c"; 	displayDecade = DispTable[i];
	MOVIA	(_DispTable + 0)
	ADDAR	r0x101B,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK01
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
	MGOTO	_02474_DS_
_02473_DS_:
	.line	1375, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
_02474_DS_:
	.line	1378, "main.c"; 	displayDigit = DispTable[j];
	MOVIA	(_DispTable + 0)
	BANKSEL	r0x101C
	ADDAR	r0x101C,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK01
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	MGOTO	_02497_DS_
_02478_DS_:
	.line	1383, "main.c"; 	if (0 == displayData)
	BANKSEL	_displayData
	MOVR	_displayData,W
	BTRSS	STATUS,2
	MGOTO	_02497_DS_
	.line	1385, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
	MGOTO	_02497_DS_
_02483_DS_:
	.line	1391, "main.c"; 	displayHundred = DispTable[1];
	MOVIA	(_DispTable + 1)
	MOVAR	STK01
	MOVIA	((_DispTable + 1) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayHundred
	MOVAR	_displayHundred
	.line	1392, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00006_DS_
	.line	1394, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00006_DS_:
	.line	1396, "main.c"; 	displayDecade = DispTable[0];
	MOVIA	(_DispTable + 0)
	MOVAR	STK01
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
	.line	1397, "main.c"; 	displayDigit = DispTable[0];
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	MGOTO	_02497_DS_
_02486_DS_:
	.line	1402, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1403, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
	.line	1404, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
_02497_DS_:
	.line	1407, "main.c"; 	}
	RETURN	
; exit point of _app_display_all

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ip55xs_read4Bytes
;   _ip55xs_read4Bytes
;1 compiler assigned register :
;   STK00
;; Starting pCode block
.segment "code"; module=main, function=_get_cap
	.debuginfo subprogram _get_cap
_get_cap:
; 2 exit points
	.line	1219, "main.c"; 	ip55xs_read4Bytes(0x10C0);
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x10
	MCALL	_ip55xs_read4Bytes
	.line	1220, "main.c"; 	displayData = IP_DATA[0];
	BANKSEL	_IP_DATA
	MOVR	_IP_DATA,W
	BANKSEL	_displayData
	MOVAR	_displayData
	.line	1224, "main.c"; 	}
	RETURN	
; exit point of _get_cap

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ip55xs_read4Bytes
;   _disable_breathing_mode
;   _enable_breathing_mode
;   _ip55xs_read4Bytes
;   _disable_breathing_mode
;   _enable_breathing_mode
;2 compiler assigned registers:
;   STK00
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_is_chg_or_dischg
	.debuginfo subprogram _is_chg_or_dischg
;local variable name mapping:
	.debuginfo complex-type (local-sym "_counter" 1 "main.c" 1130 (basetype 1 unsigned) link "_is_chg_or_dischg_counter_65536_126")
_is_chg_or_dischg:
; 2 exit points
	.line	1132, "main.c"; 	ip55xs_read4Bytes(0X1090);
	MOVIA	0x90
	MOVAR	STK00
	MOVIA	0x10
	MCALL	_ip55xs_read4Bytes
	.line	1140, "main.c"; 	bFlag_qc_ok = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,4
	.line	1142, "main.c"; 	if (bFlag_charger_on) //! 在充电状态下
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,5
	MGOTO	_02431_DS_
	.line	1144, "main.c"; 	delaySleepTimer = CONST_DSL_SHORT; //! 防止充电状态MCU关5356
	MOVIA	0x03
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	.line	1146, "main.c"; 	reg_ip53xs = (IP_DATA[2] & BIT3); // bit19
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 2),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSS	r0x1029,3
	MGOTO	_02417_DS_
	.line	1151, "main.c"; 	bFlag_chg_or_dischg = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,6
	.line	1152, "main.c"; 	if (++counter > 5) // CNST_FILTER_COM
	BANKSEL	_is_chg_or_dischg_counter_65536_126
	INCR	_is_chg_or_dischg_counter_65536_126,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x6=6), size=1
	MOVIA	0x06
	SUBAR	_is_chg_or_dischg_counter_65536_126,W
	BTRSS	STATUS,0
	MGOTO	_02433_DS_
	.line	1154, "main.c"; 	counter = 0;
	CLRR	_is_chg_or_dischg_counter_65536_126
	.line	1155, "main.c"; 	bFlag_charger_on = 0; //! 放电
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,5
	.line	1156, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	MGOTO	_02433_DS_
_02417_DS_:
	.line	1161, "main.c"; 	counter = 0;
	BANKSEL	_is_chg_or_dischg_counter_65536_126
	CLRR	_is_chg_or_dischg_counter_65536_126
	.line	1163, "main.c"; 	if (IP_DATA[1] & BIT7)
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 1),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSS	r0x1029,7
	MGOTO	_00007_DS_
	.line	1165, "main.c"; 	bFlag_qc_ok = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,4
_00007_DS_:
	.line	1167, "main.c"; 	bFlag_chg_or_dischg = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,6
	MGOTO	_02433_DS_
_02431_DS_:
	.line	1175, "main.c"; 	reg_ip53xs = (IP_DATA[1] & BIT3); // bit11
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 1),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSS	r0x1029,3
	MGOTO	_02428_DS_
	.line	1178, "main.c"; 	bFlag_chg_or_dischg = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,6
	.line	1179, "main.c"; 	if (++counter > CNST_FILTER_COM) // 2次
	BANKSEL	_is_chg_or_dischg_counter_65536_126
	INCR	_is_chg_or_dischg_counter_65536_126,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	_is_chg_or_dischg_counter_65536_126,W
	BTRSS	STATUS,0
	MGOTO	_02433_DS_
	.line	1181, "main.c"; 	counter = 0;
	CLRR	_is_chg_or_dischg_counter_65536_126
	.line	1182, "main.c"; 	bFlag_charger_on = 1; //! 充电
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,5
;;unsigned compare: left < lit(0x64=100), size=1
	.line	1183, "main.c"; 	if (displayData < 100)
	MOVIA	0x64
	BANKSEL	_displayData
	SUBAR	_displayData,W
	BTRSS	STATUS,0
	.line	1185, "main.c"; 	enable_breathing_mode();
	MCALL	_enable_breathing_mode
	.line	1187, "main.c"; 	forceDispTimer = 10;
	MOVIA	0x0a
	BANKSEL	_forceDispTimer
	MOVAR	_forceDispTimer
	MGOTO	_02433_DS_
_02428_DS_:
	.line	1192, "main.c"; 	counter = 0;
	BANKSEL	_is_chg_or_dischg_counter_65536_126
	CLRR	_is_chg_or_dischg_counter_65536_126
	.line	1193, "main.c"; 	bFlag_chg_or_dischg = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,6
	.line	1194, "main.c"; 	if (IP_DATA[3] & BIT3)
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSS	r0x1029,3
	MGOTO	_00008_DS_
	.line	1196, "main.c"; 	bFlag_qc_ok = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,4
_00008_DS_:
	.line	1199, "main.c"; 	if ((IP_DATA[2] & BIT3)) // bit19
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 2),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSS	r0x1029,3
	MGOTO	_02433_DS_
	.line	1201, "main.c"; 	displayTimer = CONST_TIMER_DISP_XSEC; //! 电量==0的时候 闪烁5秒后熄灭,反之一直显示
	MOVIA	0x0a
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
_02433_DS_:
	.line	1215, "main.c"; 	}
	RETURN	
; exit point of _is_chg_or_dischg

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ip55xs_read4Bytes
;   _ip55xs_write4Bytes
;   _ip55xs_read4Bytes
;   _ip55xs_write4Bytes
;7 compiler assigned registers:
;   STK00
;   r0x102B
;   r0x102C
;   r0x102D
;   STK03
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_get_p_ext_int_status
	.debuginfo subprogram _get_p_ext_int_status
;local variable name mapping:
	.debuginfo complex-type (local-sym "_counter" 1 "main.c" 1055 (basetype 1 unsigned) link "_get_p_ext_int_status_counter_65536_116")
_get_p_ext_int_status:
; 2 exit points
	.line	1057, "main.c"; 	if (bFlag_p_ext_int_is_high)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,3
	MGOTO	_02405_DS_
	.line	1059, "main.c"; 	if (!P_I2C_INT)
	BTRSC	_PORTAbits,2
	MGOTO	_02397_DS_
	.line	1061, "main.c"; 	if (++counter > CONST_P_VIN_FILTER)
	BANKSEL	_get_p_ext_int_status_counter_65536_116
	INCR	_get_p_ext_int_status_counter_65536_116,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x20=32), size=1
	MOVIA	0x20
	SUBAR	_get_p_ext_int_status_counter_65536_116,W
	BTRSS	STATUS,0
	MGOTO	_02407_DS_
	.line	1063, "main.c"; 	counter = 0;
	CLRR	_get_p_ext_int_status_counter_65536_116
	.line	1064, "main.c"; 	bFlag_p_ext_int_is_high = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,3
	.line	1065, "main.c"; 	bFlag_charger_on = 0; //! 放电
	BCR	_vFlag_1,5
	.line	1065, "main.c"; 	// io_uart_tx(0x22);
	MGOTO	_02407_DS_
_02397_DS_:
	.line	1081, "main.c"; 	counter = 0;
	BANKSEL	_get_p_ext_int_status_counter_65536_116
	CLRR	_get_p_ext_int_status_counter_65536_116
	MGOTO	_02407_DS_
_02405_DS_:
	.line	1086, "main.c"; 	if (P_I2C_INT)
	BTRSS	_PORTAbits,2
	MGOTO	_02402_DS_
	.line	1088, "main.c"; 	if (++counter > CONST_P_VIN_FILTER)
	BANKSEL	_get_p_ext_int_status_counter_65536_116
	INCR	_get_p_ext_int_status_counter_65536_116,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x20=32), size=1
	MOVIA	0x20
	SUBAR	_get_p_ext_int_status_counter_65536_116,W
	BTRSS	STATUS,0
	MGOTO	_02407_DS_
	.line	1090, "main.c"; 	counter = 0;
	CLRR	_get_p_ext_int_status_counter_65536_116
	.line	1091, "main.c"; 	bFlag_p_ext_int_is_high = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,3
	.line	1094, "main.c"; 	ip55xs_read4Bytes(0X00C0);
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_ip55xs_read4Bytes
	.line	1096, "main.c"; 	IP_DATA[3] &= ~(BIT2); // bit24,bit26
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BCR	r0x102B,2
	MOVR	r0x102B,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1097, "main.c"; 	IP_DATA[3] &= ~(BIT0);
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BCR	r0x102B,0
	MOVR	r0x102B,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1098, "main.c"; 	ip55xs_write4Bytes(0X00C0, IP_DATA);
	MOVIA	(_IP_DATA + 0)
	BANKSEL	r0x102B
	MOVAR	r0x102B
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_ip55xs_write4Bytes
	.line	1099, "main.c"; 	delaySleepTimer = CNST_TIMER_DLY_SLP;
	MOVIA	0x14
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	MGOTO	_02407_DS_
_02402_DS_:
	.line	1105, "main.c"; 	counter = 0;
	BANKSEL	_get_p_ext_int_status_counter_65536_116
	CLRR	_get_p_ext_int_status_counter_65536_116
_02407_DS_:
	.line	1108, "main.c"; 	}
	RETURN	
; exit point of _get_p_ext_int_status

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ip55xs_read4Bytes
;   _ip55xs_write4Bytes
;   _ip55xs_read4Bytes
;   _ip55xs_write4Bytes
;7 compiler assigned registers:
;   STK00
;   r0x102F
;   r0x1030
;   r0x1031
;   STK03
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_init_ip53xs
	.debuginfo subprogram _init_ip53xs
_init_ip53xs:
; 2 exit points
	.line	1045, "main.c"; 	ip55xs_read4Bytes(0X00C0);
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_ip55xs_read4Bytes
	.line	1047, "main.c"; 	IP_DATA[3] &= ~(BIT2); // bit24,bit26
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BCR	r0x102F,2
	MOVR	r0x102F,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1048, "main.c"; 	IP_DATA[3] &= ~(BIT0);
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BCR	r0x102F,0
	MOVR	r0x102F,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1049, "main.c"; 	ip55xs_write4Bytes(0X00C0, IP_DATA);
	MOVIA	(_IP_DATA + 0)
	BANKSEL	r0x102F
	MOVAR	r0x102F
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_ip55xs_write4Bytes
	.line	1050, "main.c"; 	}
	RETURN	
; exit point of _init_ip53xs

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_readByte
;   _ip53xs_readByte
;   _ip53xs_readByte
;   _ip53xs_readByte
;   _ip53xs_readByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_readByte
;   _ip53xs_readByte
;   _ip53xs_readByte
;   _ip53xs_readByte
;   _ip53xs_readByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;7 compiler assigned registers:
;   r0x1024
;   STK00
;   r0x1025
;   r0x1026
;   STK01
;   r0x1027
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_ip55xs_read4Bytes
	.debuginfo subprogram _ip55xs_read4Bytes
;local variable name mapping:
	.debuginfo complex-type (local-sym "_regAddr" 2 "main.c" 998 (basetype 2 unsigned) split "r0x1025" "r0x1024")
	.debuginfo complex-type (local-sym "_timer_out" 1 "main.c" 1003 (basetype 1 unsigned) split "r0x1024")
	.debuginfo complex-type (local-sym "_reg_ip55xs" 1 "main.c" 1002 (basetype 1 unsigned) split "r0x1027")
_ip55xs_read4Bytes:
; 2 exit points
	.line	998, "main.c"; 	BOOL ip55xs_read4Bytes(/*unsigned char deviceAddr,*/ unsigned int regAddr) //(unsigned char regAddr)
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVR	STK00,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	1004, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1005, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1006, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x11);
	MOVIA	0x11
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1007, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x11);
	MOVIA	0x11
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1011, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1024
	MOVAR	r0x1024
_02382_DS_:
	.line	1013, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	1014, "main.c"; 	if (0 == timer_out)
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BTRSS	STATUS,2
	MGOTO	_02380_DS_
	.line	1016, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02385_DS_
_02380_DS_:
	.line	1021, "main.c"; 	timer_out--;
	BANKSEL	r0x1024
	DECR	r0x1024,F
	.line	1023, "main.c"; 	} while (0xAA != reg_ip55xs);
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	XORIA	0xaa
	BTRSS	STATUS,2
	MGOTO	_02382_DS_
	.line	1024, "main.c"; 	IP_DATA[0] = ip53xs_readByte(0xEA, 0x0C);
	MOVIA	0x0c
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 0)
	.line	1025, "main.c"; 	IP_DATA[1] = ip53xs_readByte(0xEA, 0x0D);
	MOVIA	0x0d
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 1)
	.line	1026, "main.c"; 	IP_DATA[2] = ip53xs_readByte(0xEA, 0x0E);
	MOVIA	0x0e
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 2)
	.line	1027, "main.c"; 	IP_DATA[3] = ip53xs_readByte(0xEA, 0x0F);
	MOVIA	0x0f
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1028, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1029, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1030, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x22);
	MOVIA	0x22
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1031, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x22);
	MOVIA	0x22
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1032, "main.c"; 	return TRUE;
	MOVIA	0x01
_02385_DS_:
	.line	1033, "main.c"; 	}
	RETURN	
; exit point of _ip55xs_read4Bytes

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_readByte
;   __gptrget1
;   _ip53xs_writeByte
;   __gptrget1
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_readByte
;   __gptrget1
;   _ip53xs_writeByte
;   __gptrget1
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_readByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_readByte
;   __gptrget1
;   _ip53xs_writeByte
;   __gptrget1
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_readByte
;   __gptrget1
;   _ip53xs_writeByte
;   __gptrget1
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_writeByte
;   _ip53xs_readByte
;11 compiler assigned registers:
;   r0x1024
;   STK00
;   r0x1025
;   STK01
;   r0x1026
;   STK02
;   r0x1027
;   STK03
;   r0x1028
;   r0x1029
;   r0x102A
;; Starting pCode block
.segment "code"; module=main, function=_ip55xs_write4Bytes
	.debuginfo subprogram _ip55xs_write4Bytes
;local variable name mapping:
	.debuginfo complex-type (local-sym "_regAddr" 2 "main.c" 929 (basetype 2 unsigned) split "r0x1025" "r0x1024")
	.debuginfo complex-type (local-sym "_reg_ip55xs" 1 "main.c" 931 (basetype 1 unsigned) split "r0x1025")
	.debuginfo complex-type (local-sym "_timer_out" 1 "main.c" 932 (basetype 1 unsigned) split "r0x1024")
	.debuginfo complex-type (local-sym "_pdata" 3 "main.c" 929 (pointer gptr 3 (basetype 1 unsigned)) split "r0x1028" "r0x1027" "r0x1026")
_ip55xs_write4Bytes:
; 2 exit points
	.line	929, "main.c"; 	BOOL ip55xs_write4Bytes(unsigned int regAddr, unsigned char *pdata)
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVR	STK00,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	STK01,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	STK02,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	MOVR	STK03,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	.line	934, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
	BANKSEL	r0x1025
	MOVR	r0x1025,W
;;100	MOVAR	r0x1029
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	935, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
	BANKSEL	r0x1024
	MOVR	r0x1024,W
;;99	MOVAR	r0x1029
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	936, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x55);
	MOVIA	0x55
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	937, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x55);
	MOVIA	0x55
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	939, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	941, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1024
	MOVAR	r0x1024
_02359_DS_:
	.line	943, "main.c"; 	if (timer_out)
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BTRSC	STATUS,2
	MGOTO	_02357_DS_
	.line	945, "main.c"; 	timer_out--;
	DECR	r0x1024,F
	MGOTO	_02360_DS_
_02357_DS_:
	.line	949, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02374_DS_
_02360_DS_:
	.line	951, "main.c"; 	} while (0xAA != reg_ip55xs);
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	XORIA	0xaa
	BTRSS	STATUS,2
	MGOTO	_02359_DS_
	.line	952, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, *pdata); // DATA0
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK00
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MCALL	__gptrget1
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	953, "main.c"; 	pdata++;
	BANKSEL	r0x1028
	INCR	r0x1028,F
	BTRSS	STATUS,2
	MGOTO	_00009_DS_
	BANKSEL	r0x1027
	INCR	r0x1027,F
_00009_DS_:
	BTRSS	STATUS,2
	MGOTO	_00010_DS_
	BANKSEL	r0x1026
	INCR	r0x1026,F
_00010_DS_:
	.line	954, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, *pdata); // DATA1
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK00
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MCALL	__gptrget1
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	956, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, 0x66);
	MOVIA	0x66
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	958, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, 0x66);
	MOVIA	0x66
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	960, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	962, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1024
	MOVAR	r0x1024
_02365_DS_:
	.line	964, "main.c"; 	if (timer_out)
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BTRSC	STATUS,2
	MGOTO	_02363_DS_
	.line	966, "main.c"; 	timer_out--;
	DECR	r0x1024,F
	MGOTO	_02366_DS_
_02363_DS_:
	.line	970, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02374_DS_
_02366_DS_:
	.line	972, "main.c"; 	} while (0x55 != reg_ip55xs);
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	XORIA	0x55
	BTRSS	STATUS,2
	MGOTO	_02365_DS_
	.line	974, "main.c"; 	pdata++;
	BANKSEL	r0x1028
	INCR	r0x1028,F
	BTRSS	STATUS,2
	MGOTO	_00011_DS_
	BANKSEL	r0x1027
	INCR	r0x1027,F
_00011_DS_:
	BTRSS	STATUS,2
	MGOTO	_00012_DS_
	BANKSEL	r0x1026
	INCR	r0x1026,F
_00012_DS_:
	.line	975, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, *pdata); // DATA2
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK00
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MCALL	__gptrget1
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	976, "main.c"; 	pdata++;
	BANKSEL	r0x1028
	INCR	r0x1028,F
	BTRSS	STATUS,2
	MGOTO	_00013_DS_
	BANKSEL	r0x1027
	INCR	r0x1027,F
_00013_DS_:
	BTRSS	STATUS,2
	MGOTO	_00014_DS_
	BANKSEL	r0x1026
	INCR	r0x1026,F
_00014_DS_:
	.line	977, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, *pdata); // DATA3
	BANKSEL	r0x1028
	MOVR	r0x1028,W
	MOVAR	STK01
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK00
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MCALL	__gptrget1
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	978, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, 0x77);
	MOVIA	0x77
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	980, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, 0x77);
	MOVIA	0x77
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	982, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	984, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1024
	MOVAR	r0x1024
_02371_DS_:
	.line	986, "main.c"; 	if (timer_out)
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BTRSC	STATUS,2
	MGOTO	_02369_DS_
	.line	988, "main.c"; 	timer_out--;
	DECR	r0x1024,F
	MGOTO	_02372_DS_
_02369_DS_:
	.line	992, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02374_DS_
_02372_DS_:
	.line	994, "main.c"; 	} while (0xFF != reg_ip55xs);
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	XORIA	0xff
	BTRSS	STATUS,2
	MGOTO	_02371_DS_
	.line	995, "main.c"; 	return TRUE;
	MOVIA	0x01
_02374_DS_:
	.line	996, "main.c"; 	}
	RETURN	
; exit point of _ip55xs_write4Bytes

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_start
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_start
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_readByte
;   _i2c_send_nack
;   _i2c_stop
;   _i2c_start
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_start
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_readByte
;   _i2c_send_nack
;   _i2c_stop
;5 compiler assigned registers:
;   r0x1020
;   STK00
;   r0x1021
;   r0x1022
;   r0x1023
;; Starting pCode block
.segment "code"; module=main, function=_ip53xs_readByte
	.debuginfo subprogram _ip53xs_readByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_deviceAddr" 1 "main.c" 894 (basetype 1 unsigned) split "r0x1020")
	.debuginfo complex-type (local-sym "_regAddr" 1 "main.c" 894 (basetype 1 unsigned) split "r0x1021")
	.debuginfo complex-type (local-sym "_readByte" 1 "main.c" 896 (basetype 1 unsigned) split "r0x1022")
_ip53xs_readByte:
; 2 exit points
	.line	894, "main.c"; 	unsigned char ip53xs_readByte(unsigned char deviceAddr, unsigned char regAddr) //(unsigned char regAddr)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK00,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	896, "main.c"; 	unsigned char readByte = 0;
	BANKSEL	r0x1022
	CLRR	r0x1022
	.line	897, "main.c"; 	if (P_I2C_INT)
	BTRSS	_PORTAbits,2
	MGOTO	_02350_DS_
	.line	899, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	901, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_WRITE))
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	r0x1023,W
	BTRSC	STATUS,2
	MGOTO	_02344_DS_
	.line	903, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	904, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02351_DS_
_02344_DS_:
	.line	907, "main.c"; 	if (i2c_writeByte(regAddr))
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	r0x1021,W
	BTRSC	STATUS,2
	MGOTO	_02346_DS_
	.line	909, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	910, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02351_DS_
_02346_DS_:
	.line	913, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	915, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_READ))
	BANKSEL	r0x1020
	BSR	r0x1020,0
	MOVR	r0x1020,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	MGOTO	_02348_DS_
	.line	917, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	918, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02351_DS_
_02348_DS_:
	.line	921, "main.c"; 	readByte = i2c_readByte();
	MCALL	_i2c_readByte
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	922, "main.c"; 	i2c_send_nack();
	MCALL	_i2c_send_nack
	.line	923, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
_02350_DS_:
	.line	926, "main.c"; 	return readByte;
	BANKSEL	r0x1022
	MOVR	r0x1022,W
_02351_DS_:
	.line	927, "main.c"; 	}
	RETURN	
; exit point of _ip53xs_readByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _i2c_start
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_stop
;   _i2c_start
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_writeByte
;   _i2c_stop
;   _i2c_stop
;5 compiler assigned registers:
;   r0x1020
;   STK00
;   r0x1021
;   STK01
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_ip53xs_writeByte
	.debuginfo subprogram _ip53xs_writeByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_deviceAddr" 1 "main.c" 864 (basetype 1 unsigned) split "r0x1020")
	.debuginfo complex-type (local-sym "_regAddr" 1 "main.c" 864 (basetype 1 unsigned) split "r0x1021")
	.debuginfo complex-type (local-sym "_sendByte" 1 "main.c" 864 (basetype 1 unsigned) split "r0x1022")
_ip53xs_writeByte:
; 2 exit points
	.line	864, "main.c"; 	BOOL ip53xs_writeByte(unsigned char deviceAddr, unsigned char regAddr, unsigned char sendByte)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK00,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	STK01,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	866, "main.c"; 	if (P_I2C_INT)
	BTRSS	_PORTAbits,2
	MGOTO	_02337_DS_
	.line	868, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	870, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_WRITE))
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	MGOTO	_02331_DS_
	.line	872, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	873, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02338_DS_
_02331_DS_:
	.line	876, "main.c"; 	if (i2c_writeByte(regAddr))
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	MGOTO	_02333_DS_
	.line	878, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	879, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02338_DS_
_02333_DS_:
	.line	882, "main.c"; 	if (i2c_writeByte(sendByte))
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	MGOTO	_02335_DS_
	.line	884, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	885, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02338_DS_
_02335_DS_:
	.line	888, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
_02337_DS_:
	.line	891, "main.c"; 	return TRUE;
	MOVIA	0x01
_02338_DS_:
	.line	892, "main.c"; 	}
	RETURN	
; exit point of _ip53xs_writeByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;3 compiler assigned registers:
;   r0x101C
;   r0x101D
;   r0x101E
;; Starting pCode block
.segment "code"; module=main, function=_i2c_readByte
	.debuginfo subprogram _i2c_readByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_readByte" 1 "main.c" 838 (basetype 1 unsigned) split "r0x101C")
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 837 (basetype 1 unsigned) split "r0x101D")
_i2c_readByte:
; 2 exit points
	.line	838, "main.c"; 	unsigned char readByte = 0;
	BANKSEL	r0x101C
	CLRR	r0x101C
	.line	840, "main.c"; 	P_I2C_SCL_CLR;   // 拉低I2C_SCL
	BCR	_PORTAbits,4
	.line	841, "main.c"; 	P_I2C_SDA_INPUT; // 设置I2C_SDA为输入
	IOSTR	_IOSTA
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BSR	r0x101D,3
	MOVR	r0x101D,W
	IOST	_IOSTA
	.line	843, "main.c"; 	while (i--)
	MOVIA	0x08
	MOVAR	r0x101D
_02323_DS_:
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x101E
	MOVAR	r0x101E
	BANKSEL	r0x101D
	DECR	r0x101D,F
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BTRSC	STATUS,2
	MGOTO	_02325_DS_
	.line	846, "main.c"; 	P_I2C_SCL_SET; // 拉高I2C_SCL
	BSR	_PORTAbits,4
	.line	847, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	848, "main.c"; 	readByte <<= 1;
	BCR	STATUS,0
	BANKSEL	r0x101C
	RLR	r0x101C,F
	.line	850, "main.c"; 	if (P_I2C_SDA)
	BTRSC	_PORTAbits,3
	.line	852, "main.c"; 	readByte |= 0x01;
	BSR	r0x101C,0
	.line	855, "main.c"; 	P_I2C_SCL_CLR; // 拉低I2C_SCL
	BCR	_PORTAbits,4
	.line	856, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	MGOTO	_02323_DS_
_02325_DS_:
	.line	860, "main.c"; 	P_I2C_SDA_OUTPUT; // 设置I2C_SDA为输出
	IOSTR	_IOSTA
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BCR	r0x101D,3
	MOVR	r0x101D,W
	IOST	_IOSTA
	.line	861, "main.c"; 	return readByte;  // 返回数据
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	.line	862, "main.c"; 	}
	RETURN	
; exit point of _i2c_readByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   _i2c_chk_ack
;   __dly_us
;   __dly_us
;   _i2c_chk_ack
;3 compiler assigned registers:
;   r0x101D
;   r0x101E
;   r0x101F
;; Starting pCode block
.segment "code"; module=main, function=_i2c_writeByte
	.debuginfo subprogram _i2c_writeByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_sendByte" 1 "main.c" 810 (basetype 1 unsigned) split "r0x101D")
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 812 (basetype 1 unsigned) split "r0x101E")
_i2c_writeByte:
; 2 exit points
	.line	810, "main.c"; 	unsigned char i2c_writeByte(unsigned char sendByte)
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	814, "main.c"; 	while (i--) // I2C_SDA脚从高位至低位发送数据
	MOVIA	0x08
	BANKSEL	r0x101E
	MOVAR	r0x101E
_02314_DS_:
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	BANKSEL	r0x101E
	DECR	r0x101E,F
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	MGOTO	_02316_DS_
	.line	816, "main.c"; 	P_I2C_SCL_CLR; // 拉低I2C_SCL,以允许I2C_SDA脚w位数据发生变化
	BCR	_PORTAbits,4
	.line	817, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	818, "main.c"; 	if (sendByte & 0x80) /* MSB output first */
	BANKSEL	r0x101D
	BTRSS	r0x101D,7
	MGOTO	_02312_DS_
	.line	820, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	MGOTO	_02313_DS_
_02312_DS_:
	.line	824, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
_02313_DS_:
	.line	826, "main.c"; 	sendByte <<= 1;
	BCR	STATUS,0
	BANKSEL	r0x101D
	RLR	r0x101D,F
	.line	827, "main.c"; 	P_I2C_SCL_SET; // 拉高I2C_SCL
	BSR	_PORTAbits,4
	.line	828, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	829, "main.c"; 	NOP();
	nop
	MGOTO	_02314_DS_
_02316_DS_:
	.line	832, "main.c"; 	return i2c_chk_ack();
	MCALL	_i2c_chk_ack
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	833, "main.c"; 	}
	RETURN	
; exit point of _i2c_writeByte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;; Starting pCode block
.segment "code"; module=main, function=_i2c_send_nack
	.debuginfo subprogram _i2c_send_nack
_i2c_send_nack:
; 2 exit points
	.line	801, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	802, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	803, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	804, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	805, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	806, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	807, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	808, "main.c"; 	}
	RETURN	
; exit point of _i2c_send_nack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;; Starting pCode block
.segment "code"; module=main, function=_i2c_send_ack
	.debuginfo subprogram _i2c_send_ack
_i2c_send_ack:
; 2 exit points
	.line	790, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	791, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	792, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	793, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	794, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	795, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	796, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	797, "main.c"; 	}
	RETURN	
; exit point of _i2c_send_ack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;1 compiler assigned register :
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_i2c_chk_ack
	.debuginfo subprogram _i2c_chk_ack
;local variable name mapping:
	.debuginfo complex-type (local-sym "_getAckTime" 1 "main.c" 769 (basetype 1 unsigned) split "r0x101C")
_i2c_chk_ack:
; 2 exit points
	.line	767, "main.c"; 	P_I2C_SCL_CLR;                                  // slave send ACK
	BCR	_PORTAbits,4
	.line	768, "main.c"; 	P_I2C_SDA_INPUT;                                // Allow slave to send ACK
	IOSTR	_IOSTA
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BSR	r0x101C,3
	MOVR	r0x101C,W
	IOST	_IOSTA
	.line	770, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	771, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	772, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	773, "main.c"; 	while (P_I2C_SDA)
	MOVIA	0xfa
	BANKSEL	r0x101C
	MOVAR	r0x101C
_02295_DS_:
	BTRSS	_PORTAbits,3
	MGOTO	_02297_DS_
	.line	775, "main.c"; 	--getAckTime;
	BANKSEL	r0x101C
	DECRSZ	r0x101C,F
	.line	777, "main.c"; 	if (0 == getAckTime)
	MGOTO	_02295_DS_
	.line	779, "main.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02298_DS_
_02297_DS_:
	.line	783, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	784, "main.c"; 	P_I2C_SDA_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BCR	r0x101C,3
	MOVR	r0x101C,W
	IOST	_IOSTA
	.line	785, "main.c"; 	return 0;
	MOVIA	0x00
_02298_DS_:
	.line	786, "main.c"; 	}
	RETURN	
; exit point of _i2c_chk_ack

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;; Starting pCode block
.segment "code"; module=main, function=_i2c_stop
	.debuginfo subprogram _i2c_stop
_i2c_stop:
; 2 exit points
	.line	755, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	756, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	757, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	758, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	759, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	760, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	761, "main.c"; 	}
	RETURN	
; exit point of _i2c_stop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;   __dly_us
;   __dly_us
;1 compiler assigned register :
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_i2c_start
	.debuginfo subprogram _i2c_start
_i2c_start:
; 2 exit points
	.line	742, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	743, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	744, "main.c"; 	P_I2C_SDA_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BCR	r0x101C,3
	MOVR	r0x101C,W
	IOST	_IOSTA
	.line	745, "main.c"; 	P_I2C_SCL_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x101C
	BCR	r0x101C,4
	MOVR	r0x101C,W
	IOST	_IOSTA
	.line	746, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	747, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	748, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	749, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	750, "main.c"; 	}
	RETURN	
; exit point of _i2c_start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __dly_us
;   __dly_us
;1 compiler assigned register :
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_gpioKeyScan
	.debuginfo subprogram _gpioKeyScan
_gpioKeyScan:
; 2 exit points
	.line	611, "main.c"; 	P_KEY_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BSR	r0x101C,0
	MOVR	r0x101C,W
	IOST	_IOSTB
	.line	612, "main.c"; 	_dly_us(5);
	MOVIA	0x05
	MCALL	__dly_us
	.line	613, "main.c"; 	if (gpioKeyWaitTimer)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSC	STATUS,2
	MGOTO	_02204_DS_
	.line	615, "main.c"; 	gpioKeyWaitTimer--;
	MOVR	_gpioKeyWaitTimer,W
	BANKSEL	r0x101C
	MOVAR	r0x101C
	DECR	r0x101C,W
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
_02204_DS_:
	.line	618, "main.c"; 	indexKey = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,2
	.line	620, "main.c"; 	if (P_KEY)
	BTRSS	_PORTBbits,0
	MGOTO	_02206_DS_
	.line	622, "main.c"; 	indexKey = 1;
	BSR	_vFlag_1,2
	.line	623, "main.c"; 	P_KEY_IPS_SET;
	BSR	_PORTBbits,1
	.line	624, "main.c"; 	P_KEY_IPS_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BSR	r0x101C,1
	MOVR	r0x101C,W
	IOST	_IOSTB
_02206_DS_:
	.line	627, "main.c"; 	switch (gpioKeyState)
	BANKSEL	_gpioKeyState
	MOVR	_gpioKeyState,W
	BTRSC	STATUS,2
	MGOTO	_02207_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02210_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_02216_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_02222_DS_
	MGOTO	_02225_DS_
_02207_DS_:
	.line	630, "main.c"; 	if (indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02209_DS_
	.line	633, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
	MGOTO	_02227_DS_
_02209_DS_:
	.line	638, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_JTTER_TIME; // gSysTick_current;
	MOVIA	0x03
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
	.line	641, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_JITTER;
	MOVIA	0x01
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
_02210_DS_:
	.line	644, "main.c"; 	if (indexKey) // if(PreKeyIndex != indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02214_DS_
	.line	648, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	MGOTO	_02226_DS_
_02214_DS_:
	.line	651, "main.c"; 	else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_JTTER_TIME)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_02226_DS_
	.line	658, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_CP_TIME; // gSysTick_current;
	MOVIA	0x96
	MOVAR	_gpioKeyWaitTimer
	.line	659, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_PRESS_DOWN;
	MOVIA	0x02
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
	.line	660, "main.c"; 	P_KEY_IPS_CLR;
	BCR	_PORTBbits,1
	.line	661, "main.c"; 	P_KEY_IPS_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BCR	r0x101C,1
	MOVR	r0x101C,W
	IOST	_IOSTB
	.line	662, "main.c"; 	skipGetCapTimer = 10;
	MOVIA	0x0a
	BANKSEL	_skipGetCapTimer
	MOVAR	_skipGetCapTimer
	.line	666, "main.c"; 	break;
	MGOTO	_02226_DS_
_02216_DS_:
	.line	669, "main.c"; 	if (indexKey)               // if(PreKeyIndex != indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02220_DS_
	.line	674, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	.line	676, "main.c"; 	return MSG_MODE; // GpioKeyEvent[PreKeyIndex][1]; //SPR
	MOVIA	0x21
	MGOTO	_02227_DS_
_02220_DS_:
	.line	679, "main.c"; 	else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_CP_TIME)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_02226_DS_
	.line	687, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_CP;
	MOVIA	0x03
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
	.line	702, "main.c"; 	return MSG_POWER_ON; // GpioKeyEvent[PreKeyIndex][2];  //CPS
	MOVIA	0x41
	MGOTO	_02227_DS_
_02222_DS_:
	.line	708, "main.c"; 	if (indexKey) // if(PreKeyIndex != indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02226_DS_
	.line	714, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	.line	728, "main.c"; 	break;
	MGOTO	_02226_DS_
_02225_DS_:
	.line	731, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
_02226_DS_:
	.line	735, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
_02227_DS_:
	.line	736, "main.c"; 	}
	RETURN	
; exit point of _gpioKeyScan

;***
;  pBlock Stats: dbName = C
;***
;1 compiler assigned register :
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_io_led_scan
	.debuginfo subprogram _io_led_scan
;local variable name mapping:
	.debuginfo complex-type (local-sym "_indexScan" 1 "main.c" 310 (basetype 1 unsigned) link "_io_led_scan_indexScan_65536_31")
_io_led_scan:
; 0 exit points
	.line	312, "main.c"; 	P_LED_SEG1_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BSR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	313, "main.c"; 	P_LED_SEG2_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BSR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	314, "main.c"; 	P_LED_SEG3_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BSR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	315, "main.c"; 	P_LED_SEG4_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BSR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	316, "main.c"; 	P_LED_SEG5_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BSR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x12=18), size=1
	.line	318, "main.c"; 	switch (indexScan)
	MOVIA	0x12
	BANKSEL	_io_led_scan_indexScan_65536_31
	SUBAR	_io_led_scan_indexScan_65536_31,W
	BTRSC	STATUS,0
	MGOTO	_02113_DS_
	MOVIA	((_02198_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_io_led_scan_indexScan_65536_31,W
	ADDIA	_02198_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_02198_DS_:
	MGOTO	_02058_DS_
	MGOTO	_02061_DS_
	MGOTO	_02064_DS_
	MGOTO	_02067_DS_
	MGOTO	_02070_DS_
	MGOTO	_02073_DS_
	MGOTO	_02076_DS_
	MGOTO	_02079_DS_
	MGOTO	_02082_DS_
	MGOTO	_02085_DS_
	MGOTO	_02088_DS_
	MGOTO	_02091_DS_
	MGOTO	_02094_DS_
	MGOTO	_02097_DS_
	MGOTO	_02100_DS_
	MGOTO	_02103_DS_
	MGOTO	_02106_DS_
	MGOTO	_02109_DS_
_02058_DS_:
	.line	321, "main.c"; 	if (displayDecade & SEG_A) // 2A
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,0
	MGOTO	_02113_DS_
	.line	323, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	324, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	325, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	326, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	328, "main.c"; 	break;
	MGOTO	_02113_DS_
_02061_DS_:
	.line	331, "main.c"; 	if (displayDecade & SEG_B) // 2B
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,1
	MGOTO	_02113_DS_
	.line	333, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	334, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	335, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	336, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	338, "main.c"; 	break;
	MGOTO	_02113_DS_
_02064_DS_:
	.line	341, "main.c"; 	if (displayDecade & SEG_C) // 2C
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,2
	MGOTO	_02113_DS_
	.line	343, "main.c"; 	P_LED_SEG4_SET;
	BSR	_PORTAbits,7
	.line	344, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	345, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	346, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	348, "main.c"; 	break;
	MGOTO	_02113_DS_
_02067_DS_:
	.line	351, "main.c"; 	if (displayDecade & SEG_D) // 2D
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,3
	MGOTO	_02113_DS_
	.line	353, "main.c"; 	P_LED_SEG4_SET;
	BSR	_PORTAbits,7
	.line	354, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	355, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	356, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	358, "main.c"; 	break;
	MGOTO	_02113_DS_
_02070_DS_:
	.line	361, "main.c"; 	if (displayDecade & SEG_E) // 2E
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,4
	MGOTO	_02113_DS_
	.line	363, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	364, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	365, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	366, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	368, "main.c"; 	break;
	MGOTO	_02113_DS_
_02073_DS_:
	.line	371, "main.c"; 	if (displayDecade & SEG_F) // 2F
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,5
	MGOTO	_02113_DS_
	.line	373, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	374, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	375, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	376, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	378, "main.c"; 	break;
	MGOTO	_02113_DS_
_02076_DS_:
	.line	381, "main.c"; 	if (displayDecade & SEG_G) // 2G
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,6
	MGOTO	_02113_DS_
	.line	383, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	384, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	385, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	386, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	388, "main.c"; 	break;
	MGOTO	_02113_DS_
_02079_DS_:
	.line	391, "main.c"; 	if (displayDigit & SEG_A) // 3A
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,0
	MGOTO	_02113_DS_
	.line	393, "main.c"; 	P_LED_SEG1_SET;
	BSR	_PORTBbits,5
	.line	394, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	395, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	396, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	398, "main.c"; 	break;
	MGOTO	_02113_DS_
_02082_DS_:
	.line	401, "main.c"; 	if (displayDigit & SEG_B) // 3B
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,1
	MGOTO	_02113_DS_
	.line	403, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	404, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	405, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	406, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	408, "main.c"; 	break;
	MGOTO	_02113_DS_
_02085_DS_:
	.line	411, "main.c"; 	if (displayDigit & SEG_C) // 3C
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,2
	MGOTO	_02113_DS_
	.line	413, "main.c"; 	P_LED_SEG1_SET;
	BSR	_PORTBbits,5
	.line	414, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	415, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	416, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	418, "main.c"; 	break;
	MGOTO	_02113_DS_
_02088_DS_:
	.line	421, "main.c"; 	if (displayDigit & SEG_D) // 3D
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,3
	MGOTO	_02113_DS_
	.line	423, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	424, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	425, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	426, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	428, "main.c"; 	break;
	MGOTO	_02113_DS_
_02091_DS_:
	.line	431, "main.c"; 	if (displayDigit & SEG_E) // 3E
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,4
	MGOTO	_02113_DS_
	.line	433, "main.c"; 	P_LED_SEG1_SET;
	BSR	_PORTBbits,5
	.line	434, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	435, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	436, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	438, "main.c"; 	break;
	MGOTO	_02113_DS_
_02094_DS_:
	.line	441, "main.c"; 	if (displayDigit & SEG_F) // 3F
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,5
	MGOTO	_02113_DS_
	.line	443, "main.c"; 	P_LED_SEG4_SET;
	BSR	_PORTAbits,7
	.line	444, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	445, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	446, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	448, "main.c"; 	break;
	MGOTO	_02113_DS_
_02097_DS_:
	.line	451, "main.c"; 	if (displayDigit & SEG_G) // 3G OK
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,6
	MGOTO	_02113_DS_
	.line	453, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	454, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	455, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	456, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	458, "main.c"; 	break;
	MGOTO	_02113_DS_
_02100_DS_:
	.line	461, "main.c"; 	if (displayHundred & SEG_B) // 1B OK
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,1
	MGOTO	_02113_DS_
	.line	463, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	464, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	465, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	466, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	468, "main.c"; 	break;
	MGOTO	_02113_DS_
_02103_DS_:
	.line	471, "main.c"; 	if (displayHundred & SEG_C) // 1C OK
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,2
	MGOTO	_02113_DS_
	.line	473, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	474, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	475, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	476, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	479, "main.c"; 	break;
	MGOTO	_02113_DS_
_02106_DS_:
	.line	494, "main.c"; 	if (displayHundred & SEG_D) // 1D quick
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,3
	MGOTO	_02113_DS_
	.line	496, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	497, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	498, "main.c"; 	P_LED_SEG5_CLR;
	BCR	_PORTAbits,6
	.line	499, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	501, "main.c"; 	break;
	MGOTO	_02113_DS_
_02109_DS_:
	.line	504, "main.c"; 	if (displayHundred & SEG_E) // 1E wireless
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,4
	MGOTO	_02113_DS_
	.line	506, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	507, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	508, "main.c"; 	P_LED_SEG5_CLR;
	BCR	_PORTAbits,6
	.line	509, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
_02113_DS_:
	.line	516, "main.c"; 	indexScan++; //! 1ms 调用一次
	BANKSEL	_io_led_scan_indexScan_65536_31
	INCR	_io_led_scan_indexScan_65536_31,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x12=18), size=1
	.line	547, "main.c"; 	if (indexScan > 17) //
	MOVIA	0x12
	SUBAR	_io_led_scan_indexScan_65536_31,W
	BTRSC	STATUS,0
	.line	549, "main.c"; 	indexScan = 0;
	CLRR	_io_led_scan_indexScan_65536_31
	.line	551, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=__dly_us
	.debuginfo subprogram __dly_us
__dly_us:
; 2 exit points
	.line	300, "main.c"; 	void _dly_us(unsigned char cnt)
	BANKSEL	r0x101B
	MOVAR	r0x101B
_02050_DS_:
	.line	302, "main.c"; 	while (cnt)
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	MGOTO	_02053_DS_
	.line	304, "main.c"; 	cnt--;
	DECR	r0x101B,F
	MGOTO	_02050_DS_
_02053_DS_:
	.line	306, "main.c"; 	}
	RETURN	
; exit point of __dly_us

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_disable_breathing_mode
	.debuginfo subprogram _disable_breathing_mode
_disable_breathing_mode:
; 2 exit points
	.line	292, "main.c"; 	bFlag_is_breathing_mode = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,0
	.line	293, "main.c"; 	indicator_light_mode = 0;
	BANKSEL	_indicator_light_mode
	CLRR	_indicator_light_mode
	.line	294, "main.c"; 	P_LED_R_CLR;
	BCR	_PORTBbits,4
	.line	295, "main.c"; 	P_LED_G_CLR;
	BCR	_PORTBbits,3
	.line	296, "main.c"; 	P_LED_B_CLR;
	BCR	_PORTBbits,2
	.line	297, "main.c"; 	}
	RETURN	
; exit point of _disable_breathing_mode

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_enable_breathing_mode
	.debuginfo subprogram _enable_breathing_mode
_enable_breathing_mode:
; 2 exit points
	.line	285, "main.c"; 	bFlag_is_breathing_mode = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,0
	.line	286, "main.c"; 	bFlag_inc_or_dec = 0;
	BCR	_vFlag_1,1
	.line	287, "main.c"; 	indicator_light_mode = 0;
	BANKSEL	_indicator_light_mode
	CLRR	_indicator_light_mode
	.line	288, "main.c"; 	}
	RETURN	
; exit point of _enable_breathing_mode


;	code size estimation:
;	 1620+  397 =  2017 instructions ( 4828 byte)

	end
