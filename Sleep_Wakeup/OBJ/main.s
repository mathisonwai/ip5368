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
	extern	_io_uart_tx
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
	.debuginfo complex-type (symbol "_vFlag_0" 1 global "main.c" 35 (basetype 1 unsigned))

.segment "uninit"
_vFlag_1:
	.res 1
	.debuginfo complex-type (symbol "_vFlag_1" 1 global "main.c" 45 (basetype 1 unsigned))

.segment "uninit"
_moto_work_mode:
	.res 1
	.debuginfo complex-type (symbol "_moto_work_mode" 1 global "main.c" 55 (basetype 1 unsigned))

.segment "uninit"
_always_light_timer:
	.res 1
	.debuginfo complex-type (symbol "_always_light_timer" 1 global "main.c" 57 (basetype 1 unsigned))

.segment "uninit"
_always_light_timer_shadow:
	.res 1
	.debuginfo complex-type (symbol "_always_light_timer_shadow" 1 global "main.c" 58 (basetype 1 unsigned))

.segment "uninit"
_indicator_light_mode:
	.res 1
	.debuginfo complex-type (symbol "_indicator_light_mode" 1 global "main.c" 59 (basetype 1 unsigned))

.segment "uninit"
_underVoltageDispTimer:
	.res 1
	.debuginfo complex-type (symbol "_underVoltageDispTimer" 1 global "main.c" 60 (basetype 1 unsigned))

.segment "uninit"
_displayTimer:
	.res 1
	.debuginfo complex-type (symbol "_displayTimer" 1 global "main.c" 61 (basetype 1 unsigned))

.segment "uninit"
_delaySleepTimer:
	.res 1
	.debuginfo complex-type (symbol "_delaySleepTimer" 1 global "main.c" 62 (basetype 1 unsigned))

.segment "uninit"
_bat_level_buf:
	.res 1
	.debuginfo complex-type (symbol "_bat_level_buf" 1 global "main.c" 64 (basetype 1 unsigned))

.segment "uninit"
_timer_slice_16ms:
	.res 1
	.debuginfo complex-type (symbol "_timer_slice_16ms" 1 global "main.c" 65 (basetype 1 unsigned))

.segment "uninit"
_gpioKeyWaitTimer:
	.res 1
	.debuginfo complex-type (symbol "_gpioKeyWaitTimer" 1 global "main.c" 67 (basetype 1 unsigned))

.segment "uninit"
_gpioKeyState:
	.res 1
	.debuginfo complex-type (symbol "_gpioKeyState" 1 global "main.c" 68 (basetype 1 unsigned))

.segment "uninit"
_respiration_lamp_timer:
	.res 1
	.debuginfo complex-type (symbol "_respiration_lamp_timer" 1 global "main.c" 71 (basetype 1 unsigned))

.segment "uninit"
_IP_DATA:
	.res 4
	.debuginfo complex-type (symbol "_IP_DATA" 4 global "main.c" 74 (array 4 (basetype 1 unsigned)))

.segment "uninit"
_forceDispTimer:
	.res 1
	.debuginfo complex-type (symbol "_forceDispTimer" 1 global "main.c" 75 (basetype 1 unsigned))

.segment "uninit"
_displayData:
	.res 1
	.debuginfo complex-type (symbol "_displayData" 1 global "main.c" 77 (basetype 1 unsigned))

.segment "uninit"
_displayHundred:
	.res 1
	.debuginfo complex-type (symbol "_displayHundred" 1 global "main.c" 78 (basetype 1 unsigned))

.segment "uninit"
_displayDecade:
	.res 1
	.debuginfo complex-type (symbol "_displayDecade" 1 global "main.c" 79 (basetype 1 unsigned))

.segment "uninit"
_displayDigit:
	.res 1
	.debuginfo complex-type (symbol "_displayDigit" 1 global "main.c" 80 (basetype 1 unsigned))

.segment "uninit"
_timer_slice_10ms:
	.res 1
	.debuginfo complex-type (symbol "_timer_slice_10ms" 1 global "main.c" 81 (basetype 1 unsigned))

.segment "uninit"
_gSysTick:
	.res 1
	.debuginfo complex-type (symbol "_gSysTick" 1 global "main.c" 83 (basetype 1 unsigned))

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1034:
	.res	1
.segment "uninit"
r0x1035:
	.res	1
.segment "uninit"
r0x101A:
	.res	1
.segment "uninit"
r0x1033:
	.res	1
.segment "uninit"
r0x1031:
	.res	1
.segment "uninit"
r0x1032:
	.res	1
.segment "uninit"
r0x101B:
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
r0x1024:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x102E:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x102D:
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
_get_p_ext_int_status_counter_65536_121:
	.res	1
	.debuginfo complex-type (symbol "_get_p_ext_int_status_counter_65536_121" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_is_chg_or_dischg_counter_65536_131:
	.res	1
	.debuginfo complex-type (symbol "_is_chg_or_dischg_counter_65536_131" 1 global "" 0 (basetype 1 unsigned))
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_io_led_scan_indexScan_65536_31:
	.debuginfo complex-type (symbol "_io_led_scan_indexScan_65536_31" 1 local "main.c" 309 (basetype 1 unsigned))

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
;   r0x1034
;   r0x1035
;; Starting pCode block
_isr:
; 0 exit points
	.line	189, "main.c"; 	void isr(void) __interrupt(0) // 64us  8MHz 2T
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
	.line	195, "main.c"; 	if (TM0IF)
	BTRSS	_INTFbits,0
	MGOTO	_02034_DS_
	.line	197, "main.c"; 	TM0IF = 0;
	MOVIA	0xfe
	MOVAR	(_INTFbits + 0)
	.line	202, "main.c"; 	timerCnt++;
	BANKSEL	_isr_timerCnt_65536_5
	INCR	_isr_timerCnt_65536_5,F
	.line	204, "main.c"; 	if (!(timerCnt & 0x0F))
	MOVR	_isr_timerCnt_65536_5,W
	ANDIA	0x0f
	BTRSS	STATUS,2
	MGOTO	_00015_DS_
	.line	208, "main.c"; 	bFlag_gSysTick_Change = 1; // 1ms
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,0
	.line	210, "main.c"; 	if (!(timerCnt))
	BANKSEL	_isr_timerCnt_65536_5
	MOVR	_isr_timerCnt_65536_5,W
	BTRSS	STATUS,2
	MGOTO	_00015_DS_
	.line	213, "main.c"; 	bFlag_slice_16ms = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,1
_00015_DS_:
	.line	217, "main.c"; 	if (!(timerCnt & 0x07))
	BANKSEL	_isr_timerCnt_65536_5
	MOVR	_isr_timerCnt_65536_5,W
	ANDIA	0x07
	BTRSC	STATUS,2
	.line	219, "main.c"; 	io_led_scan();
	MCALL	_io_led_scan
	.line	222, "main.c"; 	if (bFlag_is_breathing_mode) // 100us
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,0
	MGOTO	_02034_DS_
	.line	224, "main.c"; 	respiration_lamp_timer++;
	BANKSEL	_respiration_lamp_timer
	MOVR	_respiration_lamp_timer,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	INCR	r0x1034,W
	BANKSEL	_respiration_lamp_timer
	MOVAR	_respiration_lamp_timer
	.line	226, "main.c"; 	if (!(respiration_lamp_timer))
	MOVR	_respiration_lamp_timer,W
	BTRSS	STATUS,2
	MGOTO	_02021_DS_
	.line	228, "main.c"; 	if (bFlag_inc_or_dec)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,1
	MGOTO	_02018_DS_
	.line	230, "main.c"; 	if (!(--respiration_lamp_series))
	BANKSEL	_isr_respiration_lamp_series_65536_5
	DECRSZ	_isr_respiration_lamp_series_65536_5,F
	MGOTO	_02019_DS_
	.line	232, "main.c"; 	bFlag_inc_or_dec = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,1
	.line	234, "main.c"; 	if (++indicator_light_mode > 2)
	BANKSEL	_indicator_light_mode
	INCR	_indicator_light_mode,W
	BANKSEL	r0x1034
	MOVAR	r0x1034
	BANKSEL	_indicator_light_mode
	MOVAR	_indicator_light_mode
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x3=3), size=1
	MOVIA	0x03
	BANKSEL	r0x1034
	SUBAR	r0x1034,W
	BTRSS	STATUS,0
	MGOTO	_02019_DS_
	.line	236, "main.c"; 	indicator_light_mode = 0;
	BANKSEL	_indicator_light_mode
	CLRR	_indicator_light_mode
	MGOTO	_02019_DS_
_02018_DS_:
	.line	242, "main.c"; 	if (++respiration_lamp_series >= CONST_RESPIRATION_LAMP_SERIES)
	BANKSEL	_isr_respiration_lamp_series_65536_5
	INCR	_isr_respiration_lamp_series_65536_5,F
;;unsigned compare: left < lit(0x50=80), size=1
	MOVIA	0x50
	SUBAR	_isr_respiration_lamp_series_65536_5,W
	BTRSS	STATUS,0
	MGOTO	_02019_DS_
	.line	244, "main.c"; 	respiration_lamp_series = CONST_RESPIRATION_LAMP_SERIES;
	MOVIA	0x50
	MOVAR	_isr_respiration_lamp_series_65536_5
	.line	245, "main.c"; 	bFlag_inc_or_dec = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,1
_02019_DS_:
	.line	249, "main.c"; 	led_lamp = RESPIRATION_LAMP_TABLE[respiration_lamp_series];
	BANKSEL	_isr_respiration_lamp_series_65536_5
	MOVR	_isr_respiration_lamp_series_65536_5,W
	ADDIA	(_RESPIRATION_LAMP_TABLE + 0)
	BANKSEL	r0x1034
	MOVAR	r0x1034
	MOVIA	((_RESPIRATION_LAMP_TABLE + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x1035
	MOVAR	r0x1035
	BANKSEL	r0x1034
	MOVR	r0x1034,W
	MOVAR	STK01
	BANKSEL	r0x1035
	MOVR	r0x1035,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_isr_led_lamp_65536_5
	MOVAR	_isr_led_lamp_65536_5
_02021_DS_:
	.line	252, "main.c"; 	if (respiration_lamp_timer >= led_lamp)
	BANKSEL	_isr_led_lamp_65536_5
	MOVR	_isr_led_lamp_65536_5,W
	BANKSEL	_respiration_lamp_timer
	SUBAR	_respiration_lamp_timer,W
	BTRSS	STATUS,0
	MGOTO	_02029_DS_
	.line	254, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTBbits,4
	.line	255, "main.c"; 	P_LED_G_OFF;
	BCR	_PORTBbits,3
	.line	256, "main.c"; 	P_LED_B_OFF; // white led
	BCR	_PORTBbits,2
	MGOTO	_02034_DS_
_02029_DS_:
	.line	260, "main.c"; 	if (0x01 == indicator_light_mode)
	BANKSEL	_indicator_light_mode
	MOVR	_indicator_light_mode,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02026_DS_
	.line	262, "main.c"; 	P_LED_B_ON; // white
	BSR	_PORTBbits,2
	MGOTO	_02034_DS_
_02026_DS_:
	.line	264, "main.c"; 	else if (0x02 == indicator_light_mode)
	BANKSEL	_indicator_light_mode
	MOVR	_indicator_light_mode,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02023_DS_
	.line	266, "main.c"; 	P_LED_G_ON; // green
	BSR	_PORTBbits,3
	MGOTO	_02034_DS_
_02023_DS_:
	.line	270, "main.c"; 	P_LED_R_ON; // orange
	BSR	_PORTBbits,4
_02034_DS_:
	.line	276, "main.c"; 	if (INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_02037_DS_
	.line	278, "main.c"; 	INTFbits.PABIF = 0; // Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
_02037_DS_:
	.line	280, "main.c"; 	}
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
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	1435, "main.c"; 	DISI();
	DISI
	.line	1437, "main.c"; 	BPHCON = (unsigned char)~C_PB0_PHB; // Enable PB1 Pull-High resistor
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	1438, "main.c"; 	BWUCON = C_PB0_Wakeup;              // Enable PB1 input change wakeup function
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	1440, "main.c"; 	IOSTA = 0xFF;
	MOVIA	0xff
	IOST	_IOSTA
	.line	1441, "main.c"; 	IOSTB = 0xFF;
	IOST	_IOSTB
	.line	1443, "main.c"; 	PORTA = 0x00; // PORTB data buffer=0x00
	CLRR	_PORTA
	.line	1444, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	1450, "main.c"; 	OSCCR = C_FLOSC_Sel; // OSCCR[0]=0 , FOSC is Low-frequency oscillation (FLOSC)
	CLRA	
	.debuginfo linetag 1
	SFUN	_OSCCR
	NOP	
	.line	1453, "main.c"; 	OSCCR = C_FHOSC_Sel; // OSCCR[0]=1 , FOSC is high-frequency oscillation (FHOSC)
	MOVIA	0x01
	.debuginfo linetag 1
	SFUN	_OSCCR
	NOP	
	.line	1468, "main.c"; 	PCON1 = 0x00; // Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	1471, "main.c"; 	T0MD = 0x0F; // 8M,2T  Prescaler0 to wdt,
	MOVIA	0x0f
	T0MD	
	.line	1480, "main.c"; 	INTE = 0x01; // Timer0 overflow interrupt enable bit
	MOVIA	0x01
	MOVAR	_INTE
	.line	1483, "main.c"; 	PCON = 0xC8; //  C_WDT_En | C_LVR_En;                // Enable WDT ,  Enable LVR
	MOVIA	0xc8
	MOVAR	_PCON
	.line	1485, "main.c"; 	PCON1 = 0x01; //  C_TMR0_En;                          // Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	1486, "main.c"; 	ENI();
	ENI
	.line	1488, "main.c"; 	delaySleepTimer = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x14
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	.line	1489, "main.c"; 	bFlag_power_on = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,4
	.line	1494, "main.c"; 	forceDispTimer = 20;
	MOVIA	0x14
	BANKSEL	_forceDispTimer
	MOVAR	_forceDispTimer
	.line	1495, "main.c"; 	P_LED_R_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BCR	r0x102D,4
	MOVR	r0x102D,W
	IOST	_IOSTB
	.line	1496, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTBbits,4
	.line	1497, "main.c"; 	P_LED_G_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x102D
	BCR	r0x102D,3
	MOVR	r0x102D,W
	IOST	_IOSTB
	.line	1498, "main.c"; 	P_LED_G_OFF;
	BCR	_PORTBbits,3
	.line	1499, "main.c"; 	P_LED_B_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x102D
	BCR	r0x102D,2
	MOVR	r0x102D,W
	IOST	_IOSTB
	.line	1500, "main.c"; 	P_LED_B_OFF;
	BCR	_PORTBbits,2
	.line	1502, "main.c"; 	displayTimer = CONST_TIMER_DISP;
	MOVIA	0x14
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
_02534_DS_:
	.line	1509, "main.c"; 	CLRWDT();
	clrwdt
	.line	1510, "main.c"; 	if (bFlag_gSysTick_Change)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,0
	MGOTO	_02534_DS_
	.line	1512, "main.c"; 	bFlag_gSysTick_Change = 0;
	BCR	_vFlag_0,0
	.line	1513, "main.c"; 	if (bFlag_slice_16ms)
	BTRSS	_vFlag_0,1
	MGOTO	_02534_DS_
	.line	1516, "main.c"; 	bFlag_slice_16ms = 0;
	BCR	_vFlag_0,1
	.line	1517, "main.c"; 	timer_slice_16ms++;
	BANKSEL	_timer_slice_16ms
	MOVR	_timer_slice_16ms,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	INCR	r0x102D,W
	BANKSEL	_timer_slice_16ms
	MOVAR	_timer_slice_16ms
	.line	1518, "main.c"; 	gpioKeyScan();
	MCALL	_gpioKeyScan
	.line	1519, "main.c"; 	get_p_ext_int_status();
	MCALL	_get_p_ext_int_status
	.line	1520, "main.c"; 	if (bFlag_p_ext_int_is_high)
	BANKSEL	_vFlag_1
	BTRSC	_vFlag_1,3
	.line	1522, "main.c"; 	is_chg_or_dischg();
	MCALL	_is_chg_or_dischg
	.line	1525, "main.c"; 	if (!(timer_slice_16ms & 0x1F))
	BANKSEL	_timer_slice_16ms
	MOVR	_timer_slice_16ms,W
	ANDIA	0x1f
	BTRSS	STATUS,2
	MGOTO	_02517_DS_
	.line	1527, "main.c"; 	bFlag_blink ^= 1;
	MOVIA	0x80
	BANKSEL	_vFlag_0
	XORAR	_vFlag_0,F
	.line	1532, "main.c"; 	if (bFlag_p_ext_int_is_high)
	BANKSEL	_vFlag_1
	BTRSC	_vFlag_1,3
	.line	1534, "main.c"; 	get_cap();
	MCALL	_get_cap
	.line	1536, "main.c"; 	app_display_all();
	MCALL	_app_display_all
_02517_DS_:
	.line	1538, "main.c"; 	if (!(timer_slice_16ms & 0x3F))
	BANKSEL	_timer_slice_16ms
	MOVR	_timer_slice_16ms,W
	ANDIA	0x3f
	BTRSS	STATUS,2
	MGOTO	_02534_DS_
	.line	1543, "main.c"; 	if ((0 == bFlag_charger_on) && (!P_I2C_INT))
	BANKSEL	_vFlag_1
	BTRSC	_vFlag_1,5
	MGOTO	_02534_DS_
	BTRSC	_PORTAbits,2
	MGOTO	_02534_DS_
	.line	1548, "main.c"; 	if (!delaySleepTimer)
	BANKSEL	_delaySleepTimer
	MOVR	_delaySleepTimer,W
	BTRSS	STATUS,2
	MGOTO	_02522_DS_
	.line	1554, "main.c"; 	DISI();
	DISI
	.line	1555, "main.c"; 	CLRWDT();
	clrwdt
	.line	1556, "main.c"; 	INTE = 0x00;  // Timer0 overflow interrupt enable bit
	CLRR	_INTE
	.line	1557, "main.c"; 	PCON = 0x58;  // PCON = 0xC8;
	MOVIA	0x58
	MOVAR	_PCON
	.line	1558, "main.c"; 	PCON1 = 0x00; // Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	1566, "main.c"; 	PORTA = 0x00;
	CLRR	_PORTA
	.line	1567, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	1568, "main.c"; 	IOSTA = 0x00;
	CLRA	
	IOST	_IOSTA
	.line	1569, "main.c"; 	IOSTB = 0x00;
	IOST	_IOSTB
	.line	1570, "main.c"; 	P_KEY_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BSR	r0x102D,0
	MOVR	r0x102D,W
	IOST	_IOSTB
	.line	1571, "main.c"; 	P_KEY_IPS_INPUT;
	IOSTR	_IOSTB
	MOVAR	r0x102D
	BSR	r0x102D,1
	MOVR	r0x102D,W
	IOST	_IOSTB
	.line	1594, "main.c"; 	AWUCON = (C_PA2_Wakeup); // OK
	MOVIA	0x04
	MOVAR	_AWUCON
	.line	1595, "main.c"; 	BWUCON = C_PB0_Wakeup;   // OK
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	1597, "main.c"; 	INTE = C_INT_PABKey; // Enable PortB input change interrupt
	MOVIA	0x02
	MOVAR	_INTE
	.line	1598, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	1604, "main.c"; 	if (!P_KEY)
	BTRSS	_PORTBbits,0
	MGOTO	_02520_DS_
	.line	1608, "main.c"; 	UPDATE_REG(PORTB);
	MOVR	_PORTB,F
	.line	1609, "main.c"; 	UPDATE_REG(PORTA);
	MOVR	_PORTA,F
	.line	1610, "main.c"; 	NOP();
	nop
	.line	1611, "main.c"; 	SLEEP();
	sleep
	.line	1612, "main.c"; 	NOP();
	nop
_02520_DS_:
	.line	1614, "main.c"; 	INTFbits.PABIF = 0;
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
	.line	1618, "main.c"; 	delaySleepTimer = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x14
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	.line	1624, "main.c"; 	PCON = 0xC8;
	MOVIA	0xc8
	MOVAR	_PCON
	.line	1637, "main.c"; 	PCON1 |= C_TMR0_En;            // Enable Timer0
	IOSTR	_PCON1
	BANKSEL	r0x102D
	MOVAR	r0x102D
	BSR	r0x102D,0
	MOVR	r0x102D,W
	IOST	_PCON1
	.line	1638, "main.c"; 	INTE = (0x01 /*| C_INT_LVD*/); // Timer0 overflow interrupt enable bit
	MOVIA	0x01
	MOVAR	_INTE
	.line	1639, "main.c"; 	ENI();
	ENI
	MGOTO	_02534_DS_
_02522_DS_:
	.line	1643, "main.c"; 	delaySleepTimer--;
	BANKSEL	_delaySleepTimer
	MOVR	_delaySleepTimer,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	DECR	r0x102D,W
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	MGOTO	_02534_DS_
	.line	1652, "main.c"; 	}
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
;   r0x101A
;   STK01
;   STK00
;   r0x101B
;   r0x101C
;; Starting pCode block
.segment "code"; module=main, function=_app_display_all
	.debuginfo subprogram _app_display_all
;local variable name mapping:
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 1226 (basetype 1 unsigned) split "r0x101A")
	.debuginfo complex-type (local-sym "_j" 1 "main.c" 1226 (basetype 1 unsigned) split "r0x101B")
_app_display_all:
; 2 exit points
	.line	1229, "main.c"; 	if (forceDispTimer)
	BANKSEL	_forceDispTimer
	MOVR	_forceDispTimer,W
	BTRSC	STATUS,2
	MGOTO	_02505_DS_
	.line	1231, "main.c"; 	forceDispTimer--;
	MOVR	_forceDispTimer,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	DECR	r0x101A,W
	BANKSEL	_forceDispTimer
	MOVAR	_forceDispTimer
	.line	1232, "main.c"; 	displayHundred = DispTable[1];
	MOVIA	(_DispTable + 1)
	MOVAR	STK01
	MOVIA	((_DispTable + 1) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayHundred
	MOVAR	_displayHundred
	.line	1234, "main.c"; 	displayHundred |= (SEG_E | SEG_D);
	MOVIA	0x18
	IORAR	_displayHundred,F
	.line	1235, "main.c"; 	displayDecade = DispTable[8];
	MOVIA	(_DispTable + 8)
	MOVAR	STK01
	MOVIA	((_DispTable + 8) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
;;102	MOVR	r0x101A,W
	.line	1238, "main.c"; 	if (!forceDispTimer)
	BANKSEL	_forceDispTimer
	MOVR	_forceDispTimer,W
	BTRSS	STATUS,2
	MGOTO	_02507_DS_
	.line	1240, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1241, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
	.line	1242, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
	MGOTO	_02507_DS_
_02505_DS_:
	.line	1247, "main.c"; 	else if (bFlag_charger_on) // bFlag_charger_nbFlag_vin_plug_in
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,5
	MGOTO	_02502_DS_
	.line	1249, "main.c"; 	underVoltageDispTimer = 0;
	BANKSEL	_underVoltageDispTimer
	CLRR	_underVoltageDispTimer
	.line	1251, "main.c"; 	displayTimer = CONST_TIMER_DISP; // 拨出显示5秒
	MOVIA	0x14
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
;;unsigned compare: left < lit(0x64=100), size=1
	.line	1253, "main.c"; 	if (displayData < 100) // 充电
	MOVIA	0x64
	BANKSEL	_displayData
	SUBAR	_displayData,W
	BTRSC	STATUS,0
	MGOTO	_02464_DS_
	.line	1255, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1256, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00001_DS_
	.line	1258, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00001_DS_:
	.line	1261, "main.c"; 	if (bFlag_blink)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,7
	MGOTO	_02459_DS_
	.line	1263, "main.c"; 	i = displayData / 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__divuchar
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	1264, "main.c"; 	j = displayData % 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__moduchar
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	1265, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
	.line	1267, "main.c"; 	if (i) // 十位是0 不显示
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BTRSC	STATUS,2
	MGOTO	_02457_DS_
	.line	1269, "main.c"; 	displayDecade = DispTable[i];
	MOVIA	(_DispTable + 0)
	ADDAR	r0x101A,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK01
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
_02457_DS_:
	.line	1272, "main.c"; 	displayDigit = DispTable[j];
	MOVIA	(_DispTable + 0)
	BANKSEL	r0x101B
	ADDAR	r0x101B,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK01
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	MGOTO	_02507_DS_
_02459_DS_:
	.line	1276, "main.c"; 	displayDigit = DISP_ALL_OFF; // 个位闪烁 充电
	BANKSEL	_displayDigit
	CLRR	_displayDigit
	MGOTO	_02507_DS_
_02464_DS_:
	.line	1281, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	.line	1282, "main.c"; 	P_LED_G_ON;
	BSR	_PORTBbits,3
	.line	1283, "main.c"; 	displayHundred = DispTable[1];
	MOVIA	(_DispTable + 1)
	MOVAR	STK01
	MOVIA	((_DispTable + 1) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayHundred
	MOVAR	_displayHundred
	.line	1284, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00002_DS_
	.line	1286, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00002_DS_:
	.line	1288, "main.c"; 	displayDecade = DispTable[0];
	MOVIA	(_DispTable + 0)
	MOVAR	STK01
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
;;101	MOVR	r0x101A,W
	.line	1289, "main.c"; 	displayDigit = DispTable[0];
	MGOTO	_02507_DS_
_02502_DS_:
	.line	1296, "main.c"; 	if (underVoltageDispTimer) // 欠压关机显示
	BANKSEL	_underVoltageDispTimer
	MOVR	_underVoltageDispTimer,W
	BTRSC	STATUS,2
	MGOTO	_02499_DS_
	.line	1298, "main.c"; 	underVoltageDispTimer--;
	MOVR	_underVoltageDispTimer,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	DECR	r0x101A,W
	BANKSEL	_underVoltageDispTimer
	MOVAR	_underVoltageDispTimer
	.line	1299, "main.c"; 	displayTimer = 0;
	BANKSEL	_displayTimer
	CLRR	_displayTimer
	.line	1300, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1301, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00003_DS_
	.line	1303, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00003_DS_:
	.line	1312, "main.c"; 	if (underVoltageDispTimer % 2)
	BANKSEL	_underVoltageDispTimer
	BTRSS	_underVoltageDispTimer,0
	MGOTO	_02474_DS_
	.line	1314, "main.c"; 	i = displayData / 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__divuchar
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	1315, "main.c"; 	j = displayData % 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__moduchar
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	1317, "main.c"; 	if (i)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BTRSC	STATUS,2
	MGOTO	_02469_DS_
	.line	1319, "main.c"; 	displayDecade = DispTable[i];
	MOVIA	(_DispTable + 0)
	ADDAR	r0x101A,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK01
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
	MGOTO	_02470_DS_
_02469_DS_:
	.line	1323, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
_02470_DS_:
	.line	1326, "main.c"; 	displayDigit = DispTable[j];
	MOVIA	(_DispTable + 0)
	BANKSEL	r0x101B
	ADDAR	r0x101B,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK01
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	MGOTO	_00004_DS_
_02474_DS_:
	.line	1330, "main.c"; 	if (0 == displayData)
	BANKSEL	_displayData
	MOVR	_displayData,W
	BTRSS	STATUS,2
	MGOTO	_00004_DS_
	.line	1332, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
_00004_DS_:
	.line	1336, "main.c"; 	if (0 == underVoltageDispTimer)
	BANKSEL	_underVoltageDispTimer
	MOVR	_underVoltageDispTimer,W
	BTRSS	STATUS,2
	MGOTO	_02507_DS_
	.line	1338, "main.c"; 	if (displayData)
	BANKSEL	_displayData
	MOVR	_displayData,W
	BTRSC	STATUS,2
	MGOTO	_02507_DS_
	.line	1340, "main.c"; 	displayData--;
	MOVR	_displayData,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	DECR	r0x101A,W
	BANKSEL	_displayData
	MOVAR	_displayData
	.line	1341, "main.c"; 	underVoltageDispTimer = (CONST_TIMER_DISP_UV - 1);
	MOVIA	0x0a
	BANKSEL	_underVoltageDispTimer
	MOVAR	_underVoltageDispTimer
	MGOTO	_02507_DS_
_02499_DS_:
	.line	1345, "main.c"; 	else if (displayTimer)
	BANKSEL	_displayTimer
	MOVR	_displayTimer,W
	BTRSC	STATUS,2
	MGOTO	_02496_DS_
	.line	1347, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1349, "main.c"; 	displayTimer--;
	BANKSEL	_displayTimer
	MOVR	_displayTimer,W
	BANKSEL	r0x101A
	MOVAR	r0x101A
	DECR	r0x101A,W
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
;;unsigned compare: left < lit(0x64=100), size=1
	.line	1354, "main.c"; 	if (displayData < 100)
	MOVIA	0x64
	BANKSEL	_displayData
	SUBAR	_displayData,W
	BTRSC	STATUS,0
	MGOTO	_02493_DS_
	.line	1356, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1357, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00005_DS_
	.line	1359, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00005_DS_:
	.line	1362, "main.c"; 	if (bFlag_blink)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,7
	MGOTO	_02488_DS_
	.line	1364, "main.c"; 	i = displayData / 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__divuchar
	BANKSEL	r0x101A
	MOVAR	r0x101A
	.line	1365, "main.c"; 	j = displayData % 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__moduchar
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	1367, "main.c"; 	if (i)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BTRSC	STATUS,2
	MGOTO	_02483_DS_
	.line	1369, "main.c"; 	displayDecade = DispTable[i];
	MOVIA	(_DispTable + 0)
	ADDAR	r0x101A,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK01
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
	MGOTO	_02484_DS_
_02483_DS_:
	.line	1373, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
_02484_DS_:
	.line	1376, "main.c"; 	displayDigit = DispTable[j];
	MOVIA	(_DispTable + 0)
	BANKSEL	r0x101B
	ADDAR	r0x101B,F
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	ADCIA	0x00
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	MOVAR	STK01
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	MGOTO	_02507_DS_
_02488_DS_:
	.line	1381, "main.c"; 	if (0 == displayData)
	BANKSEL	_displayData
	MOVR	_displayData,W
	BTRSS	STATUS,2
	MGOTO	_02507_DS_
	.line	1383, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
	MGOTO	_02507_DS_
_02493_DS_:
	.line	1389, "main.c"; 	displayHundred = DispTable[1];
	MOVIA	(_DispTable + 1)
	MOVAR	STK01
	MOVIA	((_DispTable + 1) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayHundred
	MOVAR	_displayHundred
	.line	1390, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00006_DS_
	.line	1392, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00006_DS_:
	.line	1394, "main.c"; 	displayDecade = DispTable[0];
	MOVIA	(_DispTable + 0)
	MOVAR	STK01
	MOVIA	((_DispTable + 0) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	r0x101A
	MOVAR	r0x101A
	BANKSEL	_displayDecade
	MOVAR	_displayDecade
	.line	1395, "main.c"; 	displayDigit = DispTable[0];
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	MGOTO	_02507_DS_
_02496_DS_:
	.line	1400, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1401, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
	.line	1402, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
_02507_DS_:
	.line	1405, "main.c"; 	}
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
	.line	1217, "main.c"; 	ip55xs_read4Bytes(0x10C0);
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x10
	MCALL	_ip55xs_read4Bytes
	.line	1218, "main.c"; 	displayData = IP_DATA[0];
	BANKSEL	_IP_DATA
	MOVR	_IP_DATA,W
	BANKSEL	_displayData
	MOVAR	_displayData
	.line	1222, "main.c"; 	}
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
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_is_chg_or_dischg
	.debuginfo subprogram _is_chg_or_dischg
;local variable name mapping:
	.debuginfo complex-type (local-sym "_counter" 1 "main.c" 1128 (basetype 1 unsigned) link "_is_chg_or_dischg_counter_65536_131")
_is_chg_or_dischg:
; 2 exit points
	.line	1130, "main.c"; 	ip55xs_read4Bytes(0X1090);
	MOVIA	0x90
	MOVAR	STK00
	MOVIA	0x10
	MCALL	_ip55xs_read4Bytes
	.line	1138, "main.c"; 	bFlag_qc_ok = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,4
	.line	1140, "main.c"; 	if (bFlag_charger_on) //! 在充电状态下
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,5
	MGOTO	_02441_DS_
	.line	1142, "main.c"; 	delaySleepTimer = CONST_DSL_SHORT; //! 防止充电状态MCU关5356
	MOVIA	0x03
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	.line	1144, "main.c"; 	reg_ip53xs = (IP_DATA[2] & BIT3); // bit19
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 2),W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BTRSS	r0x1028,3
	MGOTO	_02427_DS_
	.line	1149, "main.c"; 	bFlag_chg_or_dischg = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,6
	.line	1150, "main.c"; 	if (++counter > 5) // CNST_FILTER_COM
	BANKSEL	_is_chg_or_dischg_counter_65536_131
	INCR	_is_chg_or_dischg_counter_65536_131,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x6=6), size=1
	MOVIA	0x06
	SUBAR	_is_chg_or_dischg_counter_65536_131,W
	BTRSS	STATUS,0
	MGOTO	_02443_DS_
	.line	1152, "main.c"; 	counter = 0;
	CLRR	_is_chg_or_dischg_counter_65536_131
	.line	1153, "main.c"; 	bFlag_charger_on = 0; //! 放电
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,5
	.line	1154, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	MGOTO	_02443_DS_
_02427_DS_:
	.line	1159, "main.c"; 	counter = 0;
	BANKSEL	_is_chg_or_dischg_counter_65536_131
	CLRR	_is_chg_or_dischg_counter_65536_131
	.line	1161, "main.c"; 	if (IP_DATA[1] & BIT7)
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 1),W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BTRSS	r0x1028,7
	MGOTO	_00007_DS_
	.line	1163, "main.c"; 	bFlag_qc_ok = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,4
_00007_DS_:
	.line	1165, "main.c"; 	bFlag_chg_or_dischg = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,6
	MGOTO	_02443_DS_
_02441_DS_:
	.line	1173, "main.c"; 	reg_ip53xs = (IP_DATA[1] & BIT3); // bit11
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 1),W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BTRSS	r0x1028,3
	MGOTO	_02438_DS_
	.line	1176, "main.c"; 	bFlag_chg_or_dischg = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,6
	.line	1177, "main.c"; 	if (++counter > CNST_FILTER_COM) // 2次
	BANKSEL	_is_chg_or_dischg_counter_65536_131
	INCR	_is_chg_or_dischg_counter_65536_131,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	_is_chg_or_dischg_counter_65536_131,W
	BTRSS	STATUS,0
	MGOTO	_02443_DS_
	.line	1179, "main.c"; 	counter = 0;
	CLRR	_is_chg_or_dischg_counter_65536_131
	.line	1180, "main.c"; 	bFlag_charger_on = 1; //! 充电
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,5
;;unsigned compare: left < lit(0x64=100), size=1
	.line	1181, "main.c"; 	if (displayData < 100)
	MOVIA	0x64
	BANKSEL	_displayData
	SUBAR	_displayData,W
	BTRSS	STATUS,0
	.line	1183, "main.c"; 	enable_breathing_mode();
	MCALL	_enable_breathing_mode
	.line	1185, "main.c"; 	forceDispTimer = 10;
	MOVIA	0x0a
	BANKSEL	_forceDispTimer
	MOVAR	_forceDispTimer
	MGOTO	_02443_DS_
_02438_DS_:
	.line	1190, "main.c"; 	counter = 0;
	BANKSEL	_is_chg_or_dischg_counter_65536_131
	CLRR	_is_chg_or_dischg_counter_65536_131
	.line	1191, "main.c"; 	bFlag_chg_or_dischg = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,6
	.line	1192, "main.c"; 	if (IP_DATA[3] & BIT3)
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BTRSS	r0x1028,3
	MGOTO	_00008_DS_
	.line	1194, "main.c"; 	bFlag_qc_ok = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,4
_00008_DS_:
	.line	1197, "main.c"; 	if ((IP_DATA[2] & BIT3)) // bit19
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 2),W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BTRSS	r0x1028,3
	MGOTO	_02443_DS_
	.line	1199, "main.c"; 	displayTimer = CONST_TIMER_DISP_XSEC; //! 电量==0的时候 闪烁5秒后熄灭,反之一直显示
	MOVIA	0x0a
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
_02443_DS_:
	.line	1213, "main.c"; 	}
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
;   r0x102A
;   r0x102B
;   r0x102C
;   STK03
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_get_p_ext_int_status
	.debuginfo subprogram _get_p_ext_int_status
;local variable name mapping:
	.debuginfo complex-type (local-sym "_counter" 1 "main.c" 1053 (basetype 1 unsigned) link "_get_p_ext_int_status_counter_65536_121")
_get_p_ext_int_status:
; 2 exit points
	.line	1055, "main.c"; 	if (bFlag_p_ext_int_is_high)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,3
	MGOTO	_02415_DS_
	.line	1057, "main.c"; 	if (!P_I2C_INT)
	BTRSC	_PORTAbits,2
	MGOTO	_02407_DS_
	.line	1059, "main.c"; 	if (++counter > CONST_P_VIN_FILTER)
	BANKSEL	_get_p_ext_int_status_counter_65536_121
	INCR	_get_p_ext_int_status_counter_65536_121,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x20=32), size=1
	MOVIA	0x20
	SUBAR	_get_p_ext_int_status_counter_65536_121,W
	BTRSS	STATUS,0
	MGOTO	_02417_DS_
	.line	1061, "main.c"; 	counter = 0;
	CLRR	_get_p_ext_int_status_counter_65536_121
	.line	1062, "main.c"; 	bFlag_p_ext_int_is_high = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,3
	.line	1063, "main.c"; 	bFlag_charger_on = 0; //! 放电
	BCR	_vFlag_1,5
	.line	1063, "main.c"; 	// io_uart_tx(0x22);
	MGOTO	_02417_DS_
_02407_DS_:
	.line	1079, "main.c"; 	counter = 0;
	BANKSEL	_get_p_ext_int_status_counter_65536_121
	CLRR	_get_p_ext_int_status_counter_65536_121
	MGOTO	_02417_DS_
_02415_DS_:
	.line	1084, "main.c"; 	if (P_I2C_INT)
	BTRSS	_PORTAbits,2
	MGOTO	_02412_DS_
	.line	1086, "main.c"; 	if (++counter > CONST_P_VIN_FILTER)
	BANKSEL	_get_p_ext_int_status_counter_65536_121
	INCR	_get_p_ext_int_status_counter_65536_121,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x20=32), size=1
	MOVIA	0x20
	SUBAR	_get_p_ext_int_status_counter_65536_121,W
	BTRSS	STATUS,0
	MGOTO	_02417_DS_
	.line	1088, "main.c"; 	counter = 0;
	CLRR	_get_p_ext_int_status_counter_65536_121
	.line	1089, "main.c"; 	bFlag_p_ext_int_is_high = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,3
	.line	1092, "main.c"; 	ip55xs_read4Bytes(0X00C0);
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_ip55xs_read4Bytes
	.line	1094, "main.c"; 	IP_DATA[3] &= ~(BIT2); // bit24,bit26
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BCR	r0x102A,2
	MOVR	r0x102A,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1095, "main.c"; 	IP_DATA[3] &= ~(BIT0);
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102A
	MOVAR	r0x102A
	BCR	r0x102A,0
	MOVR	r0x102A,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1096, "main.c"; 	ip55xs_write4Bytes(0X00C0, IP_DATA);
	MOVIA	(_IP_DATA + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_ip55xs_write4Bytes
	.line	1097, "main.c"; 	delaySleepTimer = CNST_TIMER_DLY_SLP;
	MOVIA	0x14
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	MGOTO	_02417_DS_
_02412_DS_:
	.line	1103, "main.c"; 	counter = 0;
	BANKSEL	_get_p_ext_int_status_counter_65536_121
	CLRR	_get_p_ext_int_status_counter_65536_121
_02417_DS_:
	.line	1106, "main.c"; 	}
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
;   r0x102E
;   r0x102F
;   r0x1030
;   STK03
;   STK02
;   STK01
;; Starting pCode block
.segment "code"; module=main, function=_init_ip53xs
	.debuginfo subprogram _init_ip53xs
_init_ip53xs:
; 2 exit points
	.line	1043, "main.c"; 	ip55xs_read4Bytes(0X00C0);
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_ip55xs_read4Bytes
	.line	1045, "main.c"; 	IP_DATA[3] &= ~(BIT2); // bit24,bit26
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BCR	r0x102E,2
	MOVR	r0x102E,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1046, "main.c"; 	IP_DATA[3] &= ~(BIT0);
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BCR	r0x102E,0
	MOVR	r0x102E,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1047, "main.c"; 	ip55xs_write4Bytes(0X00C0, IP_DATA);
	MOVIA	(_IP_DATA + 0)
	BANKSEL	r0x102E
	MOVAR	r0x102E
	MOVAR	STK03
	MOVIA	0x00
	MOVAR	STK02
	MOVAR	STK01
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_ip55xs_write4Bytes
	.line	1048, "main.c"; 	}
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
;   r0x1023
;   STK00
;   r0x1024
;   r0x1025
;   STK01
;   r0x1026
;   r0x1027
;; Starting pCode block
.segment "code"; module=main, function=_ip55xs_read4Bytes
	.debuginfo subprogram _ip55xs_read4Bytes
;local variable name mapping:
	.debuginfo complex-type (local-sym "_regAddr" 2 "main.c" 996 (basetype 2 unsigned) split "r0x1024" "r0x1023")
	.debuginfo complex-type (local-sym "_timer_out" 1 "main.c" 1001 (basetype 1 unsigned) split "r0x1023")
	.debuginfo complex-type (local-sym "_reg_ip55xs" 1 "main.c" 1000 (basetype 1 unsigned) split "r0x1026")
_ip55xs_read4Bytes:
; 2 exit points
	.line	996, "main.c"; 	BOOL ip55xs_read4Bytes(/*unsigned char deviceAddr,*/ unsigned int regAddr) //(unsigned char regAddr)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	STK00,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	1002, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1003, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1004, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x11);
	MOVIA	0x11
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1005, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x11);
	MOVIA	0x11
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1009, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1023
	MOVAR	r0x1023
_02392_DS_:
	.line	1011, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1026
	MOVAR	r0x1026
	.line	1012, "main.c"; 	if (0 == timer_out)
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BTRSS	STATUS,2
	MGOTO	_02390_DS_
	.line	1014, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02395_DS_
_02390_DS_:
	.line	1019, "main.c"; 	timer_out--;
	BANKSEL	r0x1023
	DECR	r0x1023,F
	.line	1021, "main.c"; 	} while (0xAA != reg_ip55xs);
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	XORIA	0xaa
	BTRSS	STATUS,2
	MGOTO	_02392_DS_
	.line	1022, "main.c"; 	IP_DATA[0] = ip53xs_readByte(0xEA, 0x0C);
	MOVIA	0x0c
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 0)
	.line	1023, "main.c"; 	IP_DATA[1] = ip53xs_readByte(0xEA, 0x0D);
	MOVIA	0x0d
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 1)
	.line	1024, "main.c"; 	IP_DATA[2] = ip53xs_readByte(0xEA, 0x0E);
	MOVIA	0x0e
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 2)
	.line	1025, "main.c"; 	IP_DATA[3] = ip53xs_readByte(0xEA, 0x0F);
	MOVIA	0x0f
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1023
	MOVAR	r0x1023
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1026, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1027, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1028, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x22);
	MOVIA	0x22
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1029, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x22);
	MOVIA	0x22
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	1030, "main.c"; 	return TRUE;
	MOVIA	0x01
_02395_DS_:
	.line	1031, "main.c"; 	}
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
;   r0x1023
;   STK00
;   r0x1024
;   STK01
;   r0x1025
;   STK02
;   r0x1026
;   STK03
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_ip55xs_write4Bytes
	.debuginfo subprogram _ip55xs_write4Bytes
;local variable name mapping:
	.debuginfo complex-type (local-sym "_regAddr" 2 "main.c" 927 (basetype 2 unsigned) split "r0x1024" "r0x1023")
	.debuginfo complex-type (local-sym "_reg_ip55xs" 1 "main.c" 929 (basetype 1 unsigned) split "r0x1024")
	.debuginfo complex-type (local-sym "_timer_out" 1 "main.c" 930 (basetype 1 unsigned) split "r0x1023")
	.debuginfo complex-type (local-sym "_pdata" 3 "main.c" 927 (pointer gptr 3 (basetype 1 unsigned)) split "r0x1027" "r0x1026" "r0x1025")
_ip55xs_write4Bytes:
; 2 exit points
	.line	927, "main.c"; 	BOOL ip55xs_write4Bytes(unsigned int regAddr, unsigned char *pdata)
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	STK00,W
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVR	STK01,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVR	STK02,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVR	STK03,W
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	932, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
	BANKSEL	r0x1024
	MOVR	r0x1024,W
;;100	MOVAR	r0x1028
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	933, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
	BANKSEL	r0x1023
	MOVR	r0x1023,W
;;99	MOVAR	r0x1028
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	934, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x55);
	MOVIA	0x55
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	935, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x55);
	MOVIA	0x55
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	937, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	939, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1023
	MOVAR	r0x1023
_02369_DS_:
	.line	941, "main.c"; 	if (timer_out)
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BTRSC	STATUS,2
	MGOTO	_02367_DS_
	.line	943, "main.c"; 	timer_out--;
	DECR	r0x1023,F
	MGOTO	_02370_DS_
_02367_DS_:
	.line	947, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02384_DS_
_02370_DS_:
	.line	949, "main.c"; 	} while (0xAA != reg_ip55xs);
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	XORIA	0xaa
	BTRSS	STATUS,2
	MGOTO	_02369_DS_
	.line	950, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, *pdata); // DATA0
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK01
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK00
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MCALL	__gptrget1
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	951, "main.c"; 	pdata++;
	BANKSEL	r0x1027
	INCR	r0x1027,F
	BTRSS	STATUS,2
	MGOTO	_00009_DS_
	BANKSEL	r0x1026
	INCR	r0x1026,F
_00009_DS_:
	BTRSS	STATUS,2
	MGOTO	_00010_DS_
	BANKSEL	r0x1025
	INCR	r0x1025,F
_00010_DS_:
	.line	952, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, *pdata); // DATA1
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK01
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK00
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MCALL	__gptrget1
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	954, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, 0x66);
	MOVIA	0x66
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	956, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, 0x66);
	MOVIA	0x66
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	958, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	960, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1023
	MOVAR	r0x1023
_02375_DS_:
	.line	962, "main.c"; 	if (timer_out)
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BTRSC	STATUS,2
	MGOTO	_02373_DS_
	.line	964, "main.c"; 	timer_out--;
	DECR	r0x1023,F
	MGOTO	_02376_DS_
_02373_DS_:
	.line	968, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02384_DS_
_02376_DS_:
	.line	970, "main.c"; 	} while (0x55 != reg_ip55xs);
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	XORIA	0x55
	BTRSS	STATUS,2
	MGOTO	_02375_DS_
	.line	972, "main.c"; 	pdata++;
	BANKSEL	r0x1027
	INCR	r0x1027,F
	BTRSS	STATUS,2
	MGOTO	_00011_DS_
	BANKSEL	r0x1026
	INCR	r0x1026,F
_00011_DS_:
	BTRSS	STATUS,2
	MGOTO	_00012_DS_
	BANKSEL	r0x1025
	INCR	r0x1025,F
_00012_DS_:
	.line	973, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, *pdata); // DATA2
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK01
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK00
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MCALL	__gptrget1
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	974, "main.c"; 	pdata++;
	BANKSEL	r0x1027
	INCR	r0x1027,F
	BTRSS	STATUS,2
	MGOTO	_00013_DS_
	BANKSEL	r0x1026
	INCR	r0x1026,F
_00013_DS_:
	BTRSS	STATUS,2
	MGOTO	_00014_DS_
	BANKSEL	r0x1025
	INCR	r0x1025,F
_00014_DS_:
	.line	975, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, *pdata); // DATA3
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	MOVAR	STK01
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK00
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MCALL	__gptrget1
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	976, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, 0x77);
	MOVIA	0x77
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	978, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, 0x77);
	MOVIA	0x77
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	980, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	.line	982, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1023
	MOVAR	r0x1023
_02381_DS_:
	.line	984, "main.c"; 	if (timer_out)
	BANKSEL	r0x1023
	MOVR	r0x1023,W
	BTRSC	STATUS,2
	MGOTO	_02379_DS_
	.line	986, "main.c"; 	timer_out--;
	DECR	r0x1023,F
	MGOTO	_02382_DS_
_02379_DS_:
	.line	990, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02384_DS_
_02382_DS_:
	.line	992, "main.c"; 	} while (0xFF != reg_ip55xs);
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	XORIA	0xff
	BTRSS	STATUS,2
	MGOTO	_02381_DS_
	.line	993, "main.c"; 	return TRUE;
	MOVIA	0x01
_02384_DS_:
	.line	994, "main.c"; 	}
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
;   r0x101F
;   STK00
;   r0x1020
;   r0x1021
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_ip53xs_readByte
	.debuginfo subprogram _ip53xs_readByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_deviceAddr" 1 "main.c" 892 (basetype 1 unsigned) split "r0x101F")
	.debuginfo complex-type (local-sym "_regAddr" 1 "main.c" 892 (basetype 1 unsigned) split "r0x1020")
	.debuginfo complex-type (local-sym "_readByte" 1 "main.c" 894 (basetype 1 unsigned) split "r0x1021")
_ip53xs_readByte:
; 2 exit points
	.line	892, "main.c"; 	unsigned char ip53xs_readByte(unsigned char deviceAddr, unsigned char regAddr) //(unsigned char regAddr)
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	STK00,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
	.line	894, "main.c"; 	unsigned char readByte = 0;
	BANKSEL	r0x1021
	CLRR	r0x1021
	.line	895, "main.c"; 	if (P_I2C_INT)
	BTRSS	_PORTAbits,2
	MGOTO	_02360_DS_
	.line	897, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	899, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_WRITE))
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1022
	MOVAR	r0x1022
	MOVR	r0x1022,W
	BTRSC	STATUS,2
	MGOTO	_02354_DS_
	.line	901, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	902, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02361_DS_
_02354_DS_:
	.line	905, "main.c"; 	if (i2c_writeByte(regAddr))
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	MGOTO	_02356_DS_
	.line	907, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	908, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02361_DS_
_02356_DS_:
	.line	911, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	913, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_READ))
	BANKSEL	r0x101F
	BSR	r0x101F,0
	MOVR	r0x101F,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	MGOTO	_02358_DS_
	.line	915, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	916, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02361_DS_
_02358_DS_:
	.line	919, "main.c"; 	readByte = i2c_readByte();
	MCALL	_i2c_readByte
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	920, "main.c"; 	i2c_send_nack();
	MCALL	_i2c_send_nack
	.line	921, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
_02360_DS_:
	.line	924, "main.c"; 	return readByte;
	BANKSEL	r0x1021
	MOVR	r0x1021,W
_02361_DS_:
	.line	925, "main.c"; 	}
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
;   r0x101F
;   STK00
;   r0x1020
;   STK01
;   r0x1021
;; Starting pCode block
.segment "code"; module=main, function=_ip53xs_writeByte
	.debuginfo subprogram _ip53xs_writeByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_deviceAddr" 1 "main.c" 862 (basetype 1 unsigned) split "r0x101F")
	.debuginfo complex-type (local-sym "_regAddr" 1 "main.c" 862 (basetype 1 unsigned) split "r0x1020")
	.debuginfo complex-type (local-sym "_sendByte" 1 "main.c" 862 (basetype 1 unsigned) split "r0x1021")
_ip53xs_writeByte:
; 2 exit points
	.line	862, "main.c"; 	BOOL ip53xs_writeByte(unsigned char deviceAddr, unsigned char regAddr, unsigned char sendByte)
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	STK00,W
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK01,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	864, "main.c"; 	if (P_I2C_INT)
	BTRSS	_PORTAbits,2
	MGOTO	_02347_DS_
	.line	866, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	868, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_WRITE))
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	MGOTO	_02341_DS_
	.line	870, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	871, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02348_DS_
_02341_DS_:
	.line	874, "main.c"; 	if (i2c_writeByte(regAddr))
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	MGOTO	_02343_DS_
	.line	876, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	877, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02348_DS_
_02343_DS_:
	.line	880, "main.c"; 	if (i2c_writeByte(sendByte))
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x101F
	MOVAR	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	MGOTO	_02345_DS_
	.line	882, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	883, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02348_DS_
_02345_DS_:
	.line	886, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
_02347_DS_:
	.line	889, "main.c"; 	return TRUE;
	MOVIA	0x01
_02348_DS_:
	.line	890, "main.c"; 	}
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
;   r0x101B
;   r0x101C
;   r0x101D
;; Starting pCode block
.segment "code"; module=main, function=_i2c_readByte
	.debuginfo subprogram _i2c_readByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_readByte" 1 "main.c" 836 (basetype 1 unsigned) split "r0x101B")
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 835 (basetype 1 unsigned) split "r0x101C")
_i2c_readByte:
; 2 exit points
	.line	836, "main.c"; 	unsigned char readByte = 0;
	BANKSEL	r0x101B
	CLRR	r0x101B
	.line	838, "main.c"; 	P_I2C_SCL_CLR;   // 拉低I2C_SCL
	BCR	_PORTAbits,4
	.line	839, "main.c"; 	P_I2C_SDA_INPUT; // 设置I2C_SDA为输入
	IOSTR	_IOSTA
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BSR	r0x101C,3
	MOVR	r0x101C,W
	IOST	_IOSTA
	.line	841, "main.c"; 	while (i--)
	MOVIA	0x08
	MOVAR	r0x101C
_02333_DS_:
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BANKSEL	r0x101C
	DECR	r0x101C,F
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BTRSC	STATUS,2
	MGOTO	_02335_DS_
	.line	844, "main.c"; 	P_I2C_SCL_SET; // 拉高I2C_SCL
	BSR	_PORTAbits,4
	.line	845, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	846, "main.c"; 	readByte <<= 1;
	BCR	STATUS,0
	BANKSEL	r0x101B
	RLR	r0x101B,F
	.line	848, "main.c"; 	if (P_I2C_SDA)
	BTRSC	_PORTAbits,3
	.line	850, "main.c"; 	readByte |= 0x01;
	BSR	r0x101B,0
	.line	853, "main.c"; 	P_I2C_SCL_CLR; // 拉低I2C_SCL
	BCR	_PORTAbits,4
	.line	854, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	MGOTO	_02333_DS_
_02335_DS_:
	.line	858, "main.c"; 	P_I2C_SDA_OUTPUT; // 设置I2C_SDA为输出
	IOSTR	_IOSTA
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BCR	r0x101C,3
	MOVR	r0x101C,W
	IOST	_IOSTA
	.line	859, "main.c"; 	return readByte;  // 返回数据
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	.line	860, "main.c"; 	}
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
;   r0x101C
;   r0x101D
;   r0x101E
;; Starting pCode block
.segment "code"; module=main, function=_i2c_writeByte
	.debuginfo subprogram _i2c_writeByte
;local variable name mapping:
	.debuginfo complex-type (local-sym "_sendByte" 1 "main.c" 808 (basetype 1 unsigned) split "r0x101C")
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 810 (basetype 1 unsigned) split "r0x101D")
_i2c_writeByte:
; 2 exit points
	.line	808, "main.c"; 	unsigned char i2c_writeByte(unsigned char sendByte)
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	812, "main.c"; 	while (i--) // I2C_SDA脚从高位至低位发送数据
	MOVIA	0x08
	BANKSEL	r0x101D
	MOVAR	r0x101D
_02324_DS_:
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x101E
	MOVAR	r0x101E
	BANKSEL	r0x101D
	DECR	r0x101D,F
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BTRSC	STATUS,2
	MGOTO	_02326_DS_
	.line	814, "main.c"; 	P_I2C_SCL_CLR; // 拉低I2C_SCL,以允许I2C_SDA脚w位数据发生变化
	BCR	_PORTAbits,4
	.line	815, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	816, "main.c"; 	if (sendByte & 0x80) /* MSB output first */
	BANKSEL	r0x101C
	BTRSS	r0x101C,7
	MGOTO	_02322_DS_
	.line	818, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	MGOTO	_02323_DS_
_02322_DS_:
	.line	822, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
_02323_DS_:
	.line	824, "main.c"; 	sendByte <<= 1;
	BCR	STATUS,0
	BANKSEL	r0x101C
	RLR	r0x101C,F
	.line	825, "main.c"; 	P_I2C_SCL_SET; // 拉高I2C_SCL
	BSR	_PORTAbits,4
	.line	826, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	827, "main.c"; 	NOP();
	nop
	MGOTO	_02324_DS_
_02326_DS_:
	.line	830, "main.c"; 	return i2c_chk_ack();
	MCALL	_i2c_chk_ack
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	831, "main.c"; 	}
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
	.line	799, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	800, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	801, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	802, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	803, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	804, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	805, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	806, "main.c"; 	}
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
	.line	788, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	789, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	790, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	791, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	792, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	793, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	794, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	795, "main.c"; 	}
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
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_i2c_chk_ack
	.debuginfo subprogram _i2c_chk_ack
;local variable name mapping:
	.debuginfo complex-type (local-sym "_getAckTime" 1 "main.c" 767 (basetype 1 unsigned) split "r0x101B")
_i2c_chk_ack:
; 2 exit points
	.line	765, "main.c"; 	P_I2C_SCL_CLR;                                  // slave send ACK
	BCR	_PORTAbits,4
	.line	766, "main.c"; 	P_I2C_SDA_INPUT;                                // Allow slave to send ACK
	IOSTR	_IOSTA
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BSR	r0x101B,3
	MOVR	r0x101B,W
	IOST	_IOSTA
	.line	768, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	769, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	770, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	771, "main.c"; 	while (P_I2C_SDA)
	MOVIA	0xfa
	BANKSEL	r0x101B
	MOVAR	r0x101B
_02305_DS_:
	BTRSS	_PORTAbits,3
	MGOTO	_02307_DS_
	.line	773, "main.c"; 	--getAckTime;
	BANKSEL	r0x101B
	DECRSZ	r0x101B,F
	.line	775, "main.c"; 	if (0 == getAckTime)
	MGOTO	_02305_DS_
	.line	777, "main.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02308_DS_
_02307_DS_:
	.line	781, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	782, "main.c"; 	P_I2C_SDA_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BCR	r0x101B,3
	MOVR	r0x101B,W
	IOST	_IOSTA
	.line	783, "main.c"; 	return 0;
	MOVIA	0x00
_02308_DS_:
	.line	784, "main.c"; 	}
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
	.line	753, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	754, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	755, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	756, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	757, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	758, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	759, "main.c"; 	}
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
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_i2c_start
	.debuginfo subprogram _i2c_start
_i2c_start:
; 2 exit points
	.line	740, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	741, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	742, "main.c"; 	P_I2C_SDA_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BCR	r0x101B,3
	MOVR	r0x101B,W
	IOST	_IOSTA
	.line	743, "main.c"; 	P_I2C_SCL_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x101B
	BCR	r0x101B,4
	MOVR	r0x101B,W
	IOST	_IOSTA
	.line	744, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	745, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	746, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	747, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	748, "main.c"; 	}
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
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_gpioKeyScan
	.debuginfo subprogram _gpioKeyScan
_gpioKeyScan:
; 2 exit points
	.line	610, "main.c"; 	P_KEY_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BSR	r0x101B,0
	MOVR	r0x101B,W
	IOST	_IOSTB
	.line	611, "main.c"; 	_dly_us(5);
	MOVIA	0x05
	MCALL	__dly_us
	.line	612, "main.c"; 	if (gpioKeyWaitTimer)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSC	STATUS,2
	MGOTO	_02214_DS_
	.line	614, "main.c"; 	gpioKeyWaitTimer--;
	MOVR	_gpioKeyWaitTimer,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	DECR	r0x101B,W
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
_02214_DS_:
	.line	617, "main.c"; 	indexKey = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,2
	.line	619, "main.c"; 	if (P_KEY)
	BTRSS	_PORTBbits,0
	MGOTO	_02216_DS_
	.line	621, "main.c"; 	indexKey = 1;
	BSR	_vFlag_1,2
	.line	622, "main.c"; 	P_KEY_IPS_SET;
	BSR	_PORTBbits,1
	.line	623, "main.c"; 	P_KEY_IPS_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BSR	r0x101B,1
	MOVR	r0x101B,W
	IOST	_IOSTB
_02216_DS_:
	.line	626, "main.c"; 	switch (gpioKeyState)
	BANKSEL	_gpioKeyState
	MOVR	_gpioKeyState,W
	BTRSC	STATUS,2
	MGOTO	_02217_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02220_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_02226_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_02232_DS_
	MGOTO	_02235_DS_
_02217_DS_:
	.line	629, "main.c"; 	if (indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02219_DS_
	.line	632, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
	MGOTO	_02237_DS_
_02219_DS_:
	.line	637, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_JTTER_TIME; // gSysTick_current;
	MOVIA	0x03
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
	.line	640, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_JITTER;
	MOVIA	0x01
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
_02220_DS_:
	.line	643, "main.c"; 	if (indexKey) // if(PreKeyIndex != indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02224_DS_
	.line	647, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	MGOTO	_02236_DS_
_02224_DS_:
	.line	650, "main.c"; 	else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_JTTER_TIME)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_02236_DS_
	.line	657, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_CP_TIME; // gSysTick_current;
	MOVIA	0x96
	MOVAR	_gpioKeyWaitTimer
	.line	658, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_PRESS_DOWN;
	MOVIA	0x02
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
	.line	659, "main.c"; 	P_KEY_IPS_CLR;
	BCR	_PORTBbits,1
	.line	660, "main.c"; 	P_KEY_IPS_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BCR	r0x101B,1
	MOVR	r0x101B,W
	IOST	_IOSTB
	.line	664, "main.c"; 	break;
	MGOTO	_02236_DS_
_02226_DS_:
	.line	667, "main.c"; 	if (indexKey)               // if(PreKeyIndex != indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02230_DS_
	.line	672, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	.line	674, "main.c"; 	return MSG_MODE; // GpioKeyEvent[PreKeyIndex][1]; //SPR
	MOVIA	0x21
	MGOTO	_02237_DS_
_02230_DS_:
	.line	677, "main.c"; 	else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_CP_TIME)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_02236_DS_
	.line	685, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_CP;
	MOVIA	0x03
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
	.line	700, "main.c"; 	return MSG_POWER_ON; // GpioKeyEvent[PreKeyIndex][2];  //CPS
	MOVIA	0x41
	MGOTO	_02237_DS_
_02232_DS_:
	.line	706, "main.c"; 	if (indexKey) // if(PreKeyIndex != indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02236_DS_
	.line	712, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	.line	726, "main.c"; 	break;
	MGOTO	_02236_DS_
_02235_DS_:
	.line	729, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
_02236_DS_:
	.line	733, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
_02237_DS_:
	.line	734, "main.c"; 	}
	RETURN	
; exit point of _gpioKeyScan

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1031
;   r0x1032
;; Starting pCode block
.segment "code"; module=main, function=_io_uart_tx
	.debuginfo subprogram _io_uart_tx
;local variable name mapping:
	.debuginfo complex-type (local-sym "_sendByte" 1 "main.c" 554 (basetype 1 unsigned) split "r0x1031")
	.debuginfo complex-type (local-sym "_bCount" 1 "main.c" 557 (basetype 1 unsigned) split "r0x1032")
_io_uart_tx:
; 2 exit points
	.line	554, "main.c"; 	void io_uart_tx(unsigned char sendByte)
	BANKSEL	r0x1031
	MOVAR	r0x1031
	.line	560, "main.c"; 	DISI(); // GIE = 0;
	DISI
	.line	561, "main.c"; 	P_IO_UART_TX_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	562, "main.c"; 	P_IO_UART_TX_CLR; // 输出高
	BCR	_PORTBbits,0
	.line	563, "main.c"; 	NOP();
	nop
	.line	564, "main.c"; 	NOP();
	nop
	.line	565, "main.c"; 	NOP();
	nop
	.line	566, "main.c"; 	NOP();
	nop
	.line	567, "main.c"; 	NOP();
	nop
	.line	568, "main.c"; 	NOP();
	nop
	.line	569, "main.c"; 	NOP();
	nop
	.line	570, "main.c"; 	NOP();
	nop
	.line	571, "main.c"; 	NOP();
	nop
	.line	573, "main.c"; 	while (bCount)
	MOVIA	0x08
	BANKSEL	r0x1032
	MOVAR	r0x1032
_02206_DS_:
	BANKSEL	r0x1032
	MOVR	r0x1032,W
	BTRSC	STATUS,2
	MGOTO	_02208_DS_
	.line	575, "main.c"; 	if (sendByte & 0x01)
	BANKSEL	r0x1031
	BTRSS	r0x1031,0
	MGOTO	_02204_DS_
	.line	577, "main.c"; 	P_IO_UART_TX_SET; // 输出高
	BSR	_PORTBbits,0
	.line	578, "main.c"; 	NOP();
	nop
	.line	579, "main.c"; 	NOP();
	nop
	MGOTO	_02205_DS_
_02204_DS_:
	.line	583, "main.c"; 	P_IO_UART_TX_CLR; // 输出低
	BCR	_PORTBbits,0
	.line	584, "main.c"; 	NOP();
	nop
	.line	585, "main.c"; 	NOP();
	nop
	.line	586, "main.c"; 	NOP();
	nop
	.line	587, "main.c"; 	NOP();
	nop
	.line	588, "main.c"; 	NOP();
	nop
_02205_DS_:
	.line	590, "main.c"; 	bCount--;
	BANKSEL	r0x1032
	DECR	r0x1032,F
	.line	591, "main.c"; 	sendByte >>= 1;
	BCR	STATUS,0
	BANKSEL	r0x1031
	RRR	r0x1031,F
	MGOTO	_02206_DS_
_02208_DS_:
	.line	594, "main.c"; 	NOP();
	nop
	.line	595, "main.c"; 	P_IO_UART_TX_SET; // 输出高
	BSR	_PORTBbits,0
	.line	596, "main.c"; 	NOP();
	nop
	.line	597, "main.c"; 	NOP();
	nop
	.line	598, "main.c"; 	NOP();
	nop
	.line	599, "main.c"; 	NOP();
	nop
	.line	600, "main.c"; 	NOP();
	nop
	.line	601, "main.c"; 	NOP();
	nop
	.line	602, "main.c"; 	NOP();
	nop
	.line	603, "main.c"; 	NOP();
	nop
	.line	604, "main.c"; 	NOP();
	nop
	.line	605, "main.c"; 	ENI(); // GIE = 1;
	ENI
	.line	606, "main.c"; 	}
	RETURN	
; exit point of _io_uart_tx

;***
;  pBlock Stats: dbName = C
;***
;1 compiler assigned register :
;   r0x1033
;; Starting pCode block
.segment "code"; module=main, function=_io_led_scan
	.debuginfo subprogram _io_led_scan
;local variable name mapping:
	.debuginfo complex-type (local-sym "_indexScan" 1 "main.c" 309 (basetype 1 unsigned) link "_io_led_scan_indexScan_65536_31")
_io_led_scan:
; 0 exit points
	.line	311, "main.c"; 	P_LED_SEG1_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BSR	r0x1033,5
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	312, "main.c"; 	P_LED_SEG2_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BSR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	313, "main.c"; 	P_LED_SEG3_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BSR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	314, "main.c"; 	P_LED_SEG4_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BSR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	315, "main.c"; 	P_LED_SEG5_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BSR	r0x1033,6
	MOVR	r0x1033,W
	IOST	_IOSTA
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x12=18), size=1
	.line	317, "main.c"; 	switch (indexScan)
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
	.line	320, "main.c"; 	if (displayDecade & SEG_A) // 2A
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,0
	MGOTO	_02113_DS_
	.line	322, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	323, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	324, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	325, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	327, "main.c"; 	break;
	MGOTO	_02113_DS_
_02061_DS_:
	.line	330, "main.c"; 	if (displayDecade & SEG_B) // 2B
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,1
	MGOTO	_02113_DS_
	.line	332, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	333, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	334, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	335, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	337, "main.c"; 	break;
	MGOTO	_02113_DS_
_02064_DS_:
	.line	340, "main.c"; 	if (displayDecade & SEG_C) // 2C
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,2
	MGOTO	_02113_DS_
	.line	342, "main.c"; 	P_LED_SEG4_SET;
	BSR	_PORTAbits,7
	.line	343, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	344, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	345, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	347, "main.c"; 	break;
	MGOTO	_02113_DS_
_02067_DS_:
	.line	350, "main.c"; 	if (displayDecade & SEG_D) // 2D
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,3
	MGOTO	_02113_DS_
	.line	352, "main.c"; 	P_LED_SEG4_SET;
	BSR	_PORTAbits,7
	.line	353, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	354, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	355, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	357, "main.c"; 	break;
	MGOTO	_02113_DS_
_02070_DS_:
	.line	360, "main.c"; 	if (displayDecade & SEG_E) // 2E
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,4
	MGOTO	_02113_DS_
	.line	362, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	363, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,6
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	364, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	365, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	367, "main.c"; 	break;
	MGOTO	_02113_DS_
_02073_DS_:
	.line	370, "main.c"; 	if (displayDecade & SEG_F) // 2F
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,5
	MGOTO	_02113_DS_
	.line	372, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	373, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,6
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	374, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	375, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	377, "main.c"; 	break;
	MGOTO	_02113_DS_
_02076_DS_:
	.line	380, "main.c"; 	if (displayDecade & SEG_G) // 2G
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,6
	MGOTO	_02113_DS_
	.line	382, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	383, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,6
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	384, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	385, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	387, "main.c"; 	break;
	MGOTO	_02113_DS_
_02079_DS_:
	.line	390, "main.c"; 	if (displayDigit & SEG_A) // 3A
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,0
	MGOTO	_02113_DS_
	.line	392, "main.c"; 	P_LED_SEG1_SET;
	BSR	_PORTBbits,5
	.line	393, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,5
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	394, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	395, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	397, "main.c"; 	break;
	MGOTO	_02113_DS_
_02082_DS_:
	.line	400, "main.c"; 	if (displayDigit & SEG_B) // 3B
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,1
	MGOTO	_02113_DS_
	.line	402, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	403, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	404, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	405, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1033
	BCR	r0x1033,5
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	407, "main.c"; 	break;
	MGOTO	_02113_DS_
_02085_DS_:
	.line	410, "main.c"; 	if (displayDigit & SEG_C) // 3C
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,2
	MGOTO	_02113_DS_
	.line	412, "main.c"; 	P_LED_SEG1_SET;
	BSR	_PORTBbits,5
	.line	413, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,5
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	414, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	415, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	417, "main.c"; 	break;
	MGOTO	_02113_DS_
_02088_DS_:
	.line	420, "main.c"; 	if (displayDigit & SEG_D) // 3D
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,3
	MGOTO	_02113_DS_
	.line	422, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	423, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	424, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	425, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1033
	BCR	r0x1033,5
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	427, "main.c"; 	break;
	MGOTO	_02113_DS_
_02091_DS_:
	.line	430, "main.c"; 	if (displayDigit & SEG_E) // 3E
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,4
	MGOTO	_02113_DS_
	.line	432, "main.c"; 	P_LED_SEG1_SET;
	BSR	_PORTBbits,5
	.line	433, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,5
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	434, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	435, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	437, "main.c"; 	break;
	MGOTO	_02113_DS_
_02094_DS_:
	.line	440, "main.c"; 	if (displayDigit & SEG_F) // 3F
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,5
	MGOTO	_02113_DS_
	.line	442, "main.c"; 	P_LED_SEG4_SET;
	BSR	_PORTAbits,7
	.line	443, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	444, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	445, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1033
	BCR	r0x1033,5
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	447, "main.c"; 	break;
	MGOTO	_02113_DS_
_02097_DS_:
	.line	450, "main.c"; 	if (displayDigit & SEG_G) // 3G OK
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,6
	MGOTO	_02113_DS_
	.line	452, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	453, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,6
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	454, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	455, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1033
	BCR	r0x1033,5
	MOVR	r0x1033,W
	IOST	_IOSTB
	.line	457, "main.c"; 	break;
	MGOTO	_02113_DS_
_02100_DS_:
	.line	460, "main.c"; 	if (displayHundred & SEG_B) // 1B OK
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,1
	MGOTO	_02113_DS_
	.line	462, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	463, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	464, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	465, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	467, "main.c"; 	break;
	MGOTO	_02113_DS_
_02103_DS_:
	.line	470, "main.c"; 	if (displayHundred & SEG_C) // 1C OK
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,2
	MGOTO	_02113_DS_
	.line	472, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	473, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	474, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	475, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,7
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	478, "main.c"; 	break;
	MGOTO	_02113_DS_
_02106_DS_:
	.line	493, "main.c"; 	if (displayHundred & SEG_D) // 1D quick
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,3
	MGOTO	_02113_DS_
	.line	495, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	496, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,1
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	497, "main.c"; 	P_LED_SEG5_CLR;
	BCR	_PORTAbits,6
	.line	498, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,6
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	500, "main.c"; 	break;
	MGOTO	_02113_DS_
_02109_DS_:
	.line	503, "main.c"; 	if (displayHundred & SEG_E) // 1E wireless
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,4
	MGOTO	_02113_DS_
	.line	505, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	506, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1033
	MOVAR	r0x1033
	BCR	r0x1033,0
	MOVR	r0x1033,W
	IOST	_IOSTA
	.line	507, "main.c"; 	P_LED_SEG5_CLR;
	BCR	_PORTAbits,6
	.line	508, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1033
	BCR	r0x1033,6
	MOVR	r0x1033,W
	IOST	_IOSTA
_02113_DS_:
	.line	515, "main.c"; 	indexScan++; //! 1ms 调用一次
	BANKSEL	_io_led_scan_indexScan_65536_31
	INCR	_io_led_scan_indexScan_65536_31,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x12=18), size=1
	.line	546, "main.c"; 	if (indexScan > 17) //
	MOVIA	0x12
	SUBAR	_io_led_scan_indexScan_65536_31,W
	BTRSC	STATUS,0
	.line	548, "main.c"; 	indexScan = 0;
	CLRR	_io_led_scan_indexScan_65536_31
	.line	550, "main.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101A
;; Starting pCode block
.segment "code"; module=main, function=__dly_us
	.debuginfo subprogram __dly_us
__dly_us:
; 2 exit points
	.line	299, "main.c"; 	void _dly_us(unsigned char cnt)
	BANKSEL	r0x101A
	MOVAR	r0x101A
_02050_DS_:
	.line	301, "main.c"; 	while (cnt)
	BANKSEL	r0x101A
	MOVR	r0x101A,W
	BTRSC	STATUS,2
	MGOTO	_02053_DS_
	.line	303, "main.c"; 	cnt--;
	DECR	r0x101A,F
	MGOTO	_02050_DS_
_02053_DS_:
	.line	305, "main.c"; 	}
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
	.line	291, "main.c"; 	bFlag_is_breathing_mode = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,0
	.line	292, "main.c"; 	indicator_light_mode = 0;
	BANKSEL	_indicator_light_mode
	CLRR	_indicator_light_mode
	.line	293, "main.c"; 	P_LED_R_CLR;
	BCR	_PORTBbits,4
	.line	294, "main.c"; 	P_LED_G_CLR;
	BCR	_PORTBbits,3
	.line	295, "main.c"; 	P_LED_B_CLR;
	BCR	_PORTBbits,2
	.line	296, "main.c"; 	}
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
	.line	284, "main.c"; 	bFlag_is_breathing_mode = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,0
	.line	285, "main.c"; 	bFlag_inc_or_dec = 0;
	BCR	_vFlag_1,1
	.line	286, "main.c"; 	indicator_light_mode = 0;
	BANKSEL	_indicator_light_mode
	CLRR	_indicator_light_mode
	.line	287, "main.c"; 	}
	RETURN	
; exit point of _enable_breathing_mode


;	code size estimation:
;	 1612+  398 =  2010 instructions ( 4816 byte)

	end
