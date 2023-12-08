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
	extern	_enterSleepMode
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
	extern	_delaySleepTime
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
_delaySleepTime:
	.res 1
	.debuginfo complex-type (symbol "_delaySleepTime" 1 global "main.c" 66 (basetype 1 unsigned))

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
_get_p_ext_int_status_counter_65536_120:
	.res	1
	.debuginfo complex-type (symbol "_get_p_ext_int_status_counter_65536_120" 1 global "" 0 (basetype 1 unsigned))
.segment "uninit"
_is_chg_or_dischg_counter_65536_130:
	.res	1
	.debuginfo complex-type (symbol "_is_chg_or_dischg_counter_65536_130" 1 global "" 0 (basetype 1 unsigned))
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_io_led_scan_indexScan_65536_29:
	.debuginfo complex-type (symbol "_io_led_scan_indexScan_65536_29" 1 local "main.c" 298 (basetype 1 unsigned))

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
	MGOTO	_02030_DS_
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
	MGOTO	_02006_DS_
	.line	206, "main.c"; 	P_TEST ^= 1;
	BANKSEL	r0x1033
	CLRR	r0x1033
	BTRSC	_PORTAbits,5
	INCR	r0x1033,F
	MOVIA	0x01
	XORAR	r0x1033,F
	RRR	r0x1033,W
	BTRSS	STATUS,0
	BCR	_PORTAbits,5
	BTRSC	STATUS,0
	BSR	_PORTAbits,5
	.line	207, "main.c"; 	bFlag_gSysTick_Change = 1; // 1ms
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,0
	.line	208, "main.c"; 	io_led_scan();
	MCALL	_io_led_scan
_02006_DS_:
	.line	211, "main.c"; 	if (bFlag_is_breathing_mode) // 100us
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,0
	MGOTO	_02030_DS_
	.line	213, "main.c"; 	respiration_lamp_timer++;
	BANKSEL	_respiration_lamp_timer
	MOVR	_respiration_lamp_timer,W
	BANKSEL	r0x1033
	MOVAR	r0x1033
	INCR	r0x1033,W
	BANKSEL	_respiration_lamp_timer
	MOVAR	_respiration_lamp_timer
	.line	215, "main.c"; 	if (!(respiration_lamp_timer))
	MOVR	_respiration_lamp_timer,W
	BTRSS	STATUS,2
	MGOTO	_02017_DS_
	.line	217, "main.c"; 	if (bFlag_inc_or_dec)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,1
	MGOTO	_02014_DS_
	.line	219, "main.c"; 	if (!(--respiration_lamp_series))
	BANKSEL	_isr_respiration_lamp_series_65536_5
	DECRSZ	_isr_respiration_lamp_series_65536_5,F
	MGOTO	_02015_DS_
	.line	221, "main.c"; 	bFlag_inc_or_dec = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,1
	.line	223, "main.c"; 	if (++indicator_light_mode > 2)
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
	MGOTO	_02015_DS_
	.line	225, "main.c"; 	indicator_light_mode = 0;
	BANKSEL	_indicator_light_mode
	CLRR	_indicator_light_mode
	MGOTO	_02015_DS_
_02014_DS_:
	.line	231, "main.c"; 	if (++respiration_lamp_series >= CONST_RESPIRATION_LAMP_SERIES)
	BANKSEL	_isr_respiration_lamp_series_65536_5
	INCR	_isr_respiration_lamp_series_65536_5,F
;;unsigned compare: left < lit(0x50=80), size=1
	MOVIA	0x50
	SUBAR	_isr_respiration_lamp_series_65536_5,W
	BTRSS	STATUS,0
	MGOTO	_02015_DS_
	.line	233, "main.c"; 	respiration_lamp_series = CONST_RESPIRATION_LAMP_SERIES;
	MOVIA	0x50
	MOVAR	_isr_respiration_lamp_series_65536_5
	.line	234, "main.c"; 	bFlag_inc_or_dec = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,1
_02015_DS_:
	.line	238, "main.c"; 	led_lamp = RESPIRATION_LAMP_TABLE[respiration_lamp_series];
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
_02017_DS_:
	.line	241, "main.c"; 	if (respiration_lamp_timer >= led_lamp)
	BANKSEL	_isr_led_lamp_65536_5
	MOVR	_isr_led_lamp_65536_5,W
	BANKSEL	_respiration_lamp_timer
	SUBAR	_respiration_lamp_timer,W
	BTRSS	STATUS,0
	MGOTO	_02025_DS_
	.line	243, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTBbits,4
	.line	244, "main.c"; 	P_LED_G_OFF;
	BCR	_PORTBbits,3
	.line	245, "main.c"; 	P_LED_B_OFF; // white led
	BCR	_PORTBbits,2
	MGOTO	_02030_DS_
_02025_DS_:
	.line	249, "main.c"; 	if (0x01 == indicator_light_mode)
	BANKSEL	_indicator_light_mode
	MOVR	_indicator_light_mode,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_02022_DS_
	.line	251, "main.c"; 	P_LED_B_ON; // white
	BSR	_PORTBbits,2
	MGOTO	_02030_DS_
_02022_DS_:
	.line	253, "main.c"; 	else if (0x02 == indicator_light_mode)
	BANKSEL	_indicator_light_mode
	MOVR	_indicator_light_mode,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_02019_DS_
	.line	255, "main.c"; 	P_LED_G_ON; // green
	BSR	_PORTBbits,3
	MGOTO	_02030_DS_
_02019_DS_:
	.line	259, "main.c"; 	P_LED_R_ON; // orange
	BSR	_PORTBbits,4
_02030_DS_:
	.line	265, "main.c"; 	if (INTFbits.PABIF)
	BTRSS	_INTFbits,1
	MGOTO	_02033_DS_
	.line	267, "main.c"; 	INTFbits.PABIF = 0; // Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
_02033_DS_:
	.line	269, "main.c"; 	}
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
	.line	1346, "main.c"; 	DISI();
	DISI
	.line	1348, "main.c"; 	BPHCON = (unsigned char)~C_PB0_PHB; // Enable PB1 Pull-High resistor
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	1349, "main.c"; 	BWUCON = C_PB0_Wakeup;              // Enable PB1 input change wakeup function
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	1351, "main.c"; 	IOSTA = 0xFF;
	MOVIA	0xff
	IOST	_IOSTA
	.line	1352, "main.c"; 	IOSTB = 0xFF;
	IOST	_IOSTB
	.line	1354, "main.c"; 	PORTA = 0x00; // PORTB data buffer=0x00
	CLRR	_PORTA
	.line	1355, "main.c"; 	PORTB = 0x00;
	CLRR	_PORTB
	.line	1357, "main.c"; 	INTE = C_INT_PABKey; // Enable PortB input change interrupt
	MOVIA	0x02
	MOVAR	_INTE
	.line	1358, "main.c"; 	INTF = 0x00;         // Clear all interrupt flags
	CLRR	_INTF
	.line	1361, "main.c"; 	OSCCR = C_FLOSC_Sel; // OSCCR[0]=0 , FOSC is Low-frequency oscillation (FLOSC)
	CLRA	
	.debuginfo linetag 1
	SFUN	_OSCCR
	NOP	
	.line	1364, "main.c"; 	OSCCR = C_FHOSC_Sel; // OSCCR[0]=1 , FOSC is high-frequency oscillation (FHOSC)
	MOVIA	0x01
	.debuginfo linetag 1
	SFUN	_OSCCR
	NOP	
	.line	1379, "main.c"; 	PCON1 = 0x00; // Disable Timer0
	CLRA	
	IOST	_PCON1
	.line	1382, "main.c"; 	T0MD = 0x0F; // 8M,2T  Prescaler0 to wdt,
	MOVIA	0x0f
	T0MD	
	.line	1391, "main.c"; 	INTE = 0x01; // Timer0 overflow interrupt enable bit
	MOVIA	0x01
	MOVAR	_INTE
	.line	1394, "main.c"; 	PCON = 0xC8; //  C_WDT_En | C_LVR_En;                // Enable WDT ,  Enable LVR
	MOVIA	0xc8
	MOVAR	_PCON
	.line	1396, "main.c"; 	PCON1 = 0x01; //  C_TMR0_En;                          // Enable Timer0
	MOVIA	0x01
	IOST	_PCON1
	.line	1397, "main.c"; 	ENI();
	ENI
	.line	1399, "main.c"; 	delaySleepTime = CONST_DELAY_SLEEP_TIME;
	MOVIA	0x14
	BANKSEL	_delaySleepTime
	MOVAR	_delaySleepTime
	.line	1400, "main.c"; 	bFlag_power_on = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,4
	.line	1405, "main.c"; 	forceDispTimer = 20;
	MOVIA	0x14
	BANKSEL	_forceDispTimer
	MOVAR	_forceDispTimer
	.line	1406, "main.c"; 	P_LED_R_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x102E
	MOVAR	r0x102E
	BCR	r0x102E,4
	MOVR	r0x102E,W
	IOST	_IOSTB
	.line	1407, "main.c"; 	P_LED_R_OFF;
	BCR	_PORTBbits,4
	.line	1408, "main.c"; 	P_LED_G_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x102E
	BCR	r0x102E,3
	MOVR	r0x102E,W
	IOST	_IOSTB
	.line	1409, "main.c"; 	P_LED_G_OFF;
	BCR	_PORTBbits,3
	.line	1410, "main.c"; 	P_LED_B_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x102E
	BCR	r0x102E,2
	MOVR	r0x102E,W
	IOST	_IOSTB
	.line	1411, "main.c"; 	P_LED_B_OFF;
	BCR	_PORTBbits,2
	.line	1412, "main.c"; 	P_TEST_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x102E
	BCR	r0x102E,5
	MOVR	r0x102E,W
	IOST	_IOSTA
	.line	1418, "main.c"; 	displayTimer = CONST_TIMER_DISP;
	MOVIA	0x14
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
_02542_DS_:
	.line	1422, "main.c"; 	CLRWDT(); // Clear WatchDog
	clrwdt
	.line	1423, "main.c"; 	if (bFlag_gSysTick_Change)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,0
	MGOTO	_02542_DS_
	.line	1425, "main.c"; 	bFlag_gSysTick_Change = 0;
	BCR	_vFlag_0,0
	.line	1426, "main.c"; 	gpioKeyScan();
	MCALL	_gpioKeyScan
	.line	1430, "main.c"; 	timer_slice_16ms++;
	BANKSEL	_timer_slice_16ms
	MOVR	_timer_slice_16ms,W
	BANKSEL	r0x102E
	MOVAR	r0x102E
	INCR	r0x102E,W
	BANKSEL	_timer_slice_16ms
	MOVAR	_timer_slice_16ms
	.line	1431, "main.c"; 	if (0 == (timer_slice_16ms & 0x0F))
	ANDIA	0x0f
	BTRSS	STATUS,2
	MGOTO	_02534_DS_
	.line	1433, "main.c"; 	get_p_ext_int_status();
	MCALL	_get_p_ext_int_status
	.line	1434, "main.c"; 	if (bFlag_p_ext_int_is_high)
	BANKSEL	_vFlag_1
	BTRSC	_vFlag_1,3
	.line	1436, "main.c"; 	is_chg_or_dischg();
	MCALL	_is_chg_or_dischg
_02534_DS_:
	.line	1440, "main.c"; 	if (!timer_slice_16ms)
	BANKSEL	_timer_slice_16ms
	MOVR	_timer_slice_16ms,W
	BTRSS	STATUS,2
	MGOTO	_02542_DS_
	.line	1442, "main.c"; 	bFlag_blink ^= 1;
	MOVIA	0x80
	BANKSEL	_vFlag_0
	XORAR	_vFlag_0,F
	.line	1443, "main.c"; 	if (bFlag_p_ext_int_is_high)
	BANKSEL	_vFlag_1
	BTRSC	_vFlag_1,3
	.line	1445, "main.c"; 	get_cap();
	MCALL	_get_cap
	.line	1455, "main.c"; 	app_display_all();
	MCALL	_app_display_all
	MGOTO	_02542_DS_
	.line	1459, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_enterSleepMode
	.debuginfo subprogram _enterSleepMode
_enterSleepMode:
; 2 exit points
	.line	1321, "main.c"; 	AWUCON = 0x00; // Disable PA input change wakeup function
	CLRR	_AWUCON
	.line	1323, "main.c"; 	UPDATE_REG(PORTB);  // Read PORTB Data buffer
	MOVR	_PORTB,F
	.line	1324, "main.c"; 	INTF = 0x00;        // Clear all interrupt flags
	CLRR	_INTF
	.line	1325, "main.c"; 	PCONbits.WDTEN = 0; // Disable WDT
	BCR	_PCONbits,7
	.line	1327, "main.c"; 	SLEEP(); // 1. Execute instruction to enters Halt mode (from Normal mode)
	sleep
	.line	1329, "main.c"; 	PCONbits.WDTEN = 1; // Enable WDT
	BSR	_PCONbits,7
	.line	1330, "main.c"; 	PORTBbits.PB3 = 0;  // while wakeup from Halt mode then set PB3 outputs low
	BCR	_PORTBbits,3
	.line	1331, "main.c"; 	INTFbits.PABIF = 0; // Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
	.line	1334, "main.c"; 	UPDATE_REG(PORTB);                    // Read PORTB Data buffer
	MOVR	_PORTB,F
	.line	1335, "main.c"; 	INTF = 0x00;                          // Clear all interrupt flags
	CLRR	_INTF
	.line	1336, "main.c"; 	PCONbits.WDTEN = 0;                   // Disable WDT
	BCR	_PCONbits,7
	.line	1337, "main.c"; 	OSCCR = C_Standby_Mode | C_FHOSC_Sel; // set OSCCR register to enters Standby mode (from Normal mode)
	MOVIA	0x09
	.debuginfo linetag 1
	SFUN	_OSCCR
	NOP	
	.line	1338, "main.c"; 	PCONbits.WDTEN = 1;                   // Enable WDT
	BSR	_PCONbits,7
	.line	1339, "main.c"; 	PORTBbits.PB3 = 1;                    // while wakeup from Standby mode then set PB3 outputs high
	BSR	_PORTBbits,3
	.line	1340, "main.c"; 	INTFbits.PABIF = 0;                   // Clear PABIF(PortB input change interrupt flag bit)
	MOVIA	0xfd
	MOVAR	(_INTFbits + 0)
	.line	1341, "main.c"; 	}
	RETURN	
; exit point of _enterSleepMode

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
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 1133 (basetype 1 unsigned) split "r0x101B")
	.debuginfo complex-type (local-sym "_j" 1 "main.c" 1133 (basetype 1 unsigned) split "r0x101C")
_app_display_all:
; 2 exit points
	.line	1136, "main.c"; 	if (forceDispTimer)
	BANKSEL	_forceDispTimer
	MOVR	_forceDispTimer,W
	BTRSC	STATUS,2
	MGOTO	_02520_DS_
	.line	1138, "main.c"; 	forceDispTimer--;
	MOVR	_forceDispTimer,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	DECR	r0x101B,W
	BANKSEL	_forceDispTimer
	MOVAR	_forceDispTimer
	.line	1139, "main.c"; 	displayHundred = DispTable[1];
	MOVIA	(_DispTable + 1)
	MOVAR	STK01
	MOVIA	((_DispTable + 1) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayHundred
	MOVAR	_displayHundred
	.line	1141, "main.c"; 	displayHundred |= (SEG_E | SEG_D);
	MOVIA	0x18
	IORAR	_displayHundred,F
	.line	1142, "main.c"; 	displayDecade = DispTable[8];
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
	.line	1145, "main.c"; 	if (!forceDispTimer)
	BANKSEL	_forceDispTimer
	MOVR	_forceDispTimer,W
	BTRSS	STATUS,2
	MGOTO	_02522_DS_
	.line	1147, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1148, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
	.line	1149, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
	MGOTO	_02522_DS_
_02520_DS_:
	.line	1154, "main.c"; 	else if (bFlag_charger_on) // bFlag_charger_nbFlag_vin_plug_in
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,5
	MGOTO	_02517_DS_
	.line	1156, "main.c"; 	underVoltageDispTimer = 0;
	BANKSEL	_underVoltageDispTimer
	CLRR	_underVoltageDispTimer
	.line	1158, "main.c"; 	displayTimer = CONST_TIMER_DISP; // 拨出显示5秒
	MOVIA	0x14
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
;;unsigned compare: left < lit(0x64=100), size=1
	.line	1160, "main.c"; 	if (displayData < 100) // 充电
	MOVIA	0x64
	BANKSEL	_displayData
	SUBAR	_displayData,W
	BTRSC	STATUS,0
	MGOTO	_02479_DS_
	.line	1162, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1163, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00001_DS_
	.line	1165, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00001_DS_:
	.line	1168, "main.c"; 	if (bFlag_blink)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,7
	MGOTO	_02474_DS_
	.line	1170, "main.c"; 	i = displayData / 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__divuchar
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	1171, "main.c"; 	j = displayData % 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__moduchar
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	1172, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
	.line	1174, "main.c"; 	if (i) // 十位是0 不显示
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	MGOTO	_02472_DS_
	.line	1176, "main.c"; 	displayDecade = DispTable[i];
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
_02472_DS_:
	.line	1179, "main.c"; 	displayDigit = DispTable[j];
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
	MGOTO	_02522_DS_
_02474_DS_:
	.line	1183, "main.c"; 	displayDigit = DISP_ALL_OFF; // 个位闪烁 充电
	BANKSEL	_displayDigit
	CLRR	_displayDigit
	MGOTO	_02522_DS_
_02479_DS_:
	.line	1188, "main.c"; 	displayHundred = DispTable[1];
	MOVIA	(_DispTable + 1)
	MOVAR	STK01
	MOVIA	((_DispTable + 1) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayHundred
	MOVAR	_displayHundred
	.line	1189, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00002_DS_
	.line	1191, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00002_DS_:
	.line	1193, "main.c"; 	displayDecade = DispTable[0];
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
	.line	1194, "main.c"; 	displayDigit = DispTable[0];
	MGOTO	_02522_DS_
_02517_DS_:
	.line	1201, "main.c"; 	if (underVoltageDispTimer) // 欠压关机显示
	BANKSEL	_underVoltageDispTimer
	MOVR	_underVoltageDispTimer,W
	BTRSC	STATUS,2
	MGOTO	_02514_DS_
	.line	1203, "main.c"; 	underVoltageDispTimer--;
	MOVR	_underVoltageDispTimer,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	DECR	r0x101B,W
	BANKSEL	_underVoltageDispTimer
	MOVAR	_underVoltageDispTimer
	.line	1204, "main.c"; 	displayTimer = 0;
	BANKSEL	_displayTimer
	CLRR	_displayTimer
	.line	1205, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1206, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00003_DS_
	.line	1208, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00003_DS_:
	.line	1217, "main.c"; 	if (underVoltageDispTimer % 2)
	BANKSEL	_underVoltageDispTimer
	BTRSS	_underVoltageDispTimer,0
	MGOTO	_02489_DS_
	.line	1219, "main.c"; 	i = displayData / 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__divuchar
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	1220, "main.c"; 	j = displayData % 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__moduchar
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	1222, "main.c"; 	if (i)
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	MGOTO	_02484_DS_
	.line	1224, "main.c"; 	displayDecade = DispTable[i];
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
	MGOTO	_02485_DS_
_02484_DS_:
	.line	1228, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
_02485_DS_:
	.line	1231, "main.c"; 	displayDigit = DispTable[j];
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
_02489_DS_:
	.line	1235, "main.c"; 	if (0 == displayData)
	BANKSEL	_displayData
	MOVR	_displayData,W
	BTRSS	STATUS,2
	MGOTO	_00004_DS_
	.line	1237, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
_00004_DS_:
	.line	1241, "main.c"; 	if (0 == underVoltageDispTimer)
	BANKSEL	_underVoltageDispTimer
	MOVR	_underVoltageDispTimer,W
	BTRSS	STATUS,2
	MGOTO	_02522_DS_
	.line	1243, "main.c"; 	if (displayData)
	BANKSEL	_displayData
	MOVR	_displayData,W
	BTRSC	STATUS,2
	MGOTO	_02522_DS_
	.line	1245, "main.c"; 	displayData--;
	MOVR	_displayData,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	DECR	r0x101B,W
	BANKSEL	_displayData
	MOVAR	_displayData
	.line	1246, "main.c"; 	underVoltageDispTimer = (CONST_TIMER_DISP_UV - 1);
	MOVIA	0x0a
	BANKSEL	_underVoltageDispTimer
	MOVAR	_underVoltageDispTimer
	MGOTO	_02522_DS_
_02514_DS_:
	.line	1254, "main.c"; 	else if (displayTimer)
	BANKSEL	_displayTimer
	MOVR	_displayTimer,W
	BTRSC	STATUS,2
	MGOTO	_02511_DS_
	.line	1256, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1258, "main.c"; 	displayTimer--;
	BANKSEL	_displayTimer
	MOVR	_displayTimer,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	DECR	r0x101B,W
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
;;unsigned compare: left < lit(0x64=100), size=1
	.line	1260, "main.c"; 	if (displayData < 100)
	MOVIA	0x64
	BANKSEL	_displayData
	SUBAR	_displayData,W
	BTRSC	STATUS,0
	MGOTO	_02508_DS_
	.line	1262, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1263, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00005_DS_
	.line	1265, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00005_DS_:
	.line	1268, "main.c"; 	if (bFlag_blink)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,7
	MGOTO	_02503_DS_
	.line	1270, "main.c"; 	i = displayData / 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__divuchar
	BANKSEL	r0x101B
	MOVAR	r0x101B
	.line	1271, "main.c"; 	j = displayData % 10;
	MOVIA	0x0a
	MOVAR	STK00
	BANKSEL	_displayData
	MOVR	_displayData,W
	MCALL	__moduchar
	BANKSEL	r0x101C
	MOVAR	r0x101C
	.line	1273, "main.c"; 	if (i)
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	MGOTO	_02498_DS_
	.line	1275, "main.c"; 	displayDecade = DispTable[i];
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
	MGOTO	_02499_DS_
_02498_DS_:
	.line	1279, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
_02499_DS_:
	.line	1282, "main.c"; 	displayDigit = DispTable[j];
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
	MGOTO	_02522_DS_
_02503_DS_:
	.line	1287, "main.c"; 	if (0 == displayData) // if ((0 == displayData)||(0==bat_level_buf))
	BANKSEL	_displayData
	MOVR	_displayData,W
	BTRSS	STATUS,2
	MGOTO	_02522_DS_
	.line	1289, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
	MGOTO	_02522_DS_
_02508_DS_:
	.line	1300, "main.c"; 	displayHundred = DispTable[1];
	MOVIA	(_DispTable + 1)
	MOVAR	STK01
	MOVIA	((_DispTable + 1) >> 8) & 0xff
	MOVAR	STK00
	MOVIA	0x80
	MCALL	__gptrget1
	BANKSEL	_displayHundred
	MOVAR	_displayHundred
	.line	1301, "main.c"; 	if (bFlag_qc_ok)
	BANKSEL	_vFlag_0
	BTRSS	_vFlag_0,4
	MGOTO	_00006_DS_
	.line	1303, "main.c"; 	displayHundred |= SEG_D;
	BANKSEL	_displayHundred
	BSR	_displayHundred,3
_00006_DS_:
	.line	1305, "main.c"; 	displayDecade = DispTable[0];
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
	.line	1306, "main.c"; 	displayDigit = DispTable[0];
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BANKSEL	_displayDigit
	MOVAR	_displayDigit
	MGOTO	_02522_DS_
_02511_DS_:
	.line	1311, "main.c"; 	displayHundred = DISP_ALL_OFF;
	BANKSEL	_displayHundred
	CLRR	_displayHundred
	.line	1312, "main.c"; 	displayDecade = DISP_ALL_OFF;
	BANKSEL	_displayDecade
	CLRR	_displayDecade
	.line	1313, "main.c"; 	displayDigit = DISP_ALL_OFF;
	BANKSEL	_displayDigit
	CLRR	_displayDigit
_02522_DS_:
	.line	1316, "main.c"; 	}
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
	.line	1127, "main.c"; 	ip55xs_read4Bytes(0x10C0);
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x10
	MCALL	_ip55xs_read4Bytes
	.line	1128, "main.c"; 	displayData = IP_DATA[0];
	BANKSEL	_IP_DATA
	MOVR	_IP_DATA,W
	BANKSEL	_displayData
	MOVAR	_displayData
	.line	1129, "main.c"; 	}
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
	.debuginfo complex-type (local-sym "_counter" 1 "main.c" 1052 (basetype 1 unsigned) link "_is_chg_or_dischg_counter_65536_130")
_is_chg_or_dischg:
; 2 exit points
	.line	1054, "main.c"; 	ip55xs_read4Bytes(0X1090);
	MOVIA	0x90
	MOVAR	STK00
	MOVIA	0x10
	MCALL	_ip55xs_read4Bytes
	.line	1056, "main.c"; 	bFlag_qc_ok = 0;
	BANKSEL	_vFlag_0
	BCR	_vFlag_0,4
	.line	1058, "main.c"; 	if (bFlag_charger_on) //! 在充电状态下
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,5
	MGOTO	_02456_DS_
	.line	1060, "main.c"; 	delaySleepTimer = CONST_DSL_SHORT; //! 防止充电状态MCU关5356
	MOVIA	0x03
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	.line	1061, "main.c"; 	reg_ip53xs = (IP_DATA[2] & BIT3);  // bit19
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 2),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSS	r0x1029,3
	MGOTO	_02444_DS_
	.line	1064, "main.c"; 	bFlag_chg_or_dischg = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,6
	.line	1065, "main.c"; 	if (++counter > 5) // CNST_FILTER_COM
	BANKSEL	_is_chg_or_dischg_counter_65536_130
	INCR	_is_chg_or_dischg_counter_65536_130,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x6=6), size=1
	MOVIA	0x06
	SUBAR	_is_chg_or_dischg_counter_65536_130,W
	BTRSS	STATUS,0
	MGOTO	_02458_DS_
	.line	1067, "main.c"; 	counter = 0;
	CLRR	_is_chg_or_dischg_counter_65536_130
	.line	1068, "main.c"; 	bFlag_charger_on = 0; //! 放电
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,5
	.line	1069, "main.c"; 	disable_breathing_mode();
	MCALL	_disable_breathing_mode
	MGOTO	_02458_DS_
_02444_DS_:
	.line	1074, "main.c"; 	counter = 0;
	BANKSEL	_is_chg_or_dischg_counter_65536_130
	CLRR	_is_chg_or_dischg_counter_65536_130
	.line	1076, "main.c"; 	if (IP_DATA[1] & BIT7)
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 1),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSS	r0x1029,7
	MGOTO	_00007_DS_
	.line	1078, "main.c"; 	bFlag_qc_ok = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,4
_00007_DS_:
	.line	1080, "main.c"; 	bFlag_chg_or_dischg = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,6
	MGOTO	_02458_DS_
_02456_DS_:
	.line	1088, "main.c"; 	reg_ip53xs = (IP_DATA[1] & BIT3); // bit11
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 1),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSS	r0x1029,3
	MGOTO	_02453_DS_
	.line	1091, "main.c"; 	bFlag_chg_or_dischg = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,6
	.line	1092, "main.c"; 	if (++counter > CNST_FILTER_COM) // 2次
	BANKSEL	_is_chg_or_dischg_counter_65536_130
	INCR	_is_chg_or_dischg_counter_65536_130,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x3=3), size=1
	MOVIA	0x03
	SUBAR	_is_chg_or_dischg_counter_65536_130,W
	BTRSS	STATUS,0
	MGOTO	_02458_DS_
	.line	1094, "main.c"; 	counter = 0;
	CLRR	_is_chg_or_dischg_counter_65536_130
	.line	1095, "main.c"; 	bFlag_charger_on = 1; //! 充电
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,5
	.line	1096, "main.c"; 	enable_breathing_mode();
	MCALL	_enable_breathing_mode
	.line	1097, "main.c"; 	forceDispTimer = 10;
	MOVIA	0x0a
	BANKSEL	_forceDispTimer
	MOVAR	_forceDispTimer
	MGOTO	_02458_DS_
_02453_DS_:
	.line	1102, "main.c"; 	counter = 0;
	BANKSEL	_is_chg_or_dischg_counter_65536_130
	CLRR	_is_chg_or_dischg_counter_65536_130
	.line	1103, "main.c"; 	bFlag_chg_or_dischg = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,6
	.line	1104, "main.c"; 	if (IP_DATA[3] & BIT3)
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSS	r0x1029,3
	MGOTO	_00008_DS_
	.line	1106, "main.c"; 	bFlag_qc_ok = 1;
	BANKSEL	_vFlag_0
	BSR	_vFlag_0,4
_00008_DS_:
	.line	1109, "main.c"; 	if ((IP_DATA[2] & BIT3)) // bit19
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 2),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	BTRSS	r0x1029,3
	MGOTO	_02458_DS_
	.line	1111, "main.c"; 	displayTimer = CONST_TIMER_DISP_XSEC; //! 电量==0的时候 闪烁5秒后熄灭,反之一直显示
	MOVIA	0x0a
	BANKSEL	_displayTimer
	MOVAR	_displayTimer
_02458_DS_:
	.line	1123, "main.c"; 	}
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
	.debuginfo complex-type (local-sym "_counter" 1 "main.c" 980 (basetype 1 unsigned) link "_get_p_ext_int_status_counter_65536_120")
_get_p_ext_int_status:
; 2 exit points
	.line	982, "main.c"; 	if (bFlag_p_ext_int_is_high)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,3
	MGOTO	_02432_DS_
	.line	984, "main.c"; 	if (!P_I2C_INT)
	BTRSC	_PORTAbits,2
	MGOTO	_02424_DS_
	.line	986, "main.c"; 	if (++counter > CONST_P_VIN_FILTER)
	BANKSEL	_get_p_ext_int_status_counter_65536_120
	INCR	_get_p_ext_int_status_counter_65536_120,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x20=32), size=1
	MOVIA	0x20
	SUBAR	_get_p_ext_int_status_counter_65536_120,W
	BTRSS	STATUS,0
	MGOTO	_02434_DS_
	.line	988, "main.c"; 	counter = 0;
	CLRR	_get_p_ext_int_status_counter_65536_120
	.line	989, "main.c"; 	bFlag_p_ext_int_is_high = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,3
	.line	989, "main.c"; 	bFlag_p_ext_int_is_high = 0;
	MGOTO	_02434_DS_
_02424_DS_:
	.line	1004, "main.c"; 	counter = 0;
	BANKSEL	_get_p_ext_int_status_counter_65536_120
	CLRR	_get_p_ext_int_status_counter_65536_120
	MGOTO	_02434_DS_
_02432_DS_:
	.line	1009, "main.c"; 	if (P_I2C_INT)
	BTRSS	_PORTAbits,2
	MGOTO	_02429_DS_
	.line	1011, "main.c"; 	if (++counter > CONST_P_VIN_FILTER)
	BANKSEL	_get_p_ext_int_status_counter_65536_120
	INCR	_get_p_ext_int_status_counter_65536_120,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x20=32), size=1
	MOVIA	0x20
	SUBAR	_get_p_ext_int_status_counter_65536_120,W
	BTRSS	STATUS,0
	MGOTO	_02434_DS_
	.line	1013, "main.c"; 	counter = 0;
	CLRR	_get_p_ext_int_status_counter_65536_120
	.line	1014, "main.c"; 	bFlag_p_ext_int_is_high = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,3
	.line	1016, "main.c"; 	ip55xs_read4Bytes(0X00C0);
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_ip55xs_read4Bytes
	.line	1018, "main.c"; 	IP_DATA[3] &= ~(BIT2); // bit24,bit26
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BCR	r0x102B,2
	MOVR	r0x102B,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1019, "main.c"; 	IP_DATA[3] &= ~(BIT0);
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BCR	r0x102B,0
	MOVR	r0x102B,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	1020, "main.c"; 	ip55xs_write4Bytes(0X00C0, IP_DATA);
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
	.line	1021, "main.c"; 	delaySleepTimer = CNST_TIMER_DLY_SLP;
	MOVIA	0x78
	BANKSEL	_delaySleepTimer
	MOVAR	_delaySleepTimer
	MGOTO	_02434_DS_
_02429_DS_:
	.line	1027, "main.c"; 	counter = 0;
	BANKSEL	_get_p_ext_int_status_counter_65536_120
	CLRR	_get_p_ext_int_status_counter_65536_120
_02434_DS_:
	.line	1030, "main.c"; 	}
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
	.line	970, "main.c"; 	ip55xs_read4Bytes(0X00C0);
	MOVIA	0xc0
	MOVAR	STK00
	MOVIA	0x00
	MCALL	_ip55xs_read4Bytes
	.line	972, "main.c"; 	IP_DATA[3] &= ~(BIT2); // bit24,bit26
	BANKSEL	_IP_DATA
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BCR	r0x102F,2
	MOVR	r0x102F,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	973, "main.c"; 	IP_DATA[3] &= ~(BIT0);
	MOVR	(_IP_DATA + 3),W
	BANKSEL	r0x102F
	MOVAR	r0x102F
	BCR	r0x102F,0
	MOVR	r0x102F,W
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	974, "main.c"; 	ip55xs_write4Bytes(0X00C0, IP_DATA);
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
	.line	975, "main.c"; 	}
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
	.debuginfo complex-type (local-sym "_regAddr" 2 "main.c" 923 (basetype 2 unsigned) split "r0x1025" "r0x1024")
	.debuginfo complex-type (local-sym "_timer_out" 1 "main.c" 928 (basetype 1 unsigned) split "r0x1024")
	.debuginfo complex-type (local-sym "_reg_ip55xs" 1 "main.c" 927 (basetype 1 unsigned) split "r0x1027")
_ip55xs_read4Bytes:
; 2 exit points
	.line	923, "main.c"; 	BOOL ip55xs_read4Bytes(/*unsigned char deviceAddr,*/ unsigned int regAddr) //(unsigned char regAddr)
	BANKSEL	r0x1024
	MOVAR	r0x1024
	MOVR	STK00,W
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	929, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
	BANKSEL	r0x1026
	MOVAR	r0x1026
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	930, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
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
	.line	931, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x11);
	MOVIA	0x11
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	932, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x11);
	MOVIA	0x11
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	936, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1024
	MOVAR	r0x1024
_02409_DS_:
	.line	938, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1027
	MOVAR	r0x1027
	.line	939, "main.c"; 	if (0 == timer_out)
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BTRSS	STATUS,2
	MGOTO	_02407_DS_
	.line	941, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02412_DS_
_02407_DS_:
	.line	946, "main.c"; 	timer_out--;
	BANKSEL	r0x1024
	DECR	r0x1024,F
	.line	948, "main.c"; 	} while (0xAA != reg_ip55xs);
	BANKSEL	r0x1027
	MOVR	r0x1027,W
	XORIA	0xaa
	BTRSS	STATUS,2
	MGOTO	_02409_DS_
	.line	949, "main.c"; 	IP_DATA[0] = ip53xs_readByte(0xEA, 0x0C);
	MOVIA	0x0c
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 0)
	.line	950, "main.c"; 	IP_DATA[1] = ip53xs_readByte(0xEA, 0x0D);
	MOVIA	0x0d
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 1)
	.line	951, "main.c"; 	IP_DATA[2] = ip53xs_readByte(0xEA, 0x0E);
	MOVIA	0x0e
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 2)
	.line	952, "main.c"; 	IP_DATA[3] = ip53xs_readByte(0xEA, 0x0F);
	MOVIA	0x0f
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1024
	MOVAR	r0x1024
	BANKSEL	_IP_DATA
	MOVAR	(_IP_DATA + 3)
	.line	953, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	954, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK01
	MOVIA	0x11
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	955, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x22);
	MOVIA	0x22
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	956, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x22);
	MOVIA	0x22
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	957, "main.c"; 	return TRUE;
	MOVIA	0x01
_02412_DS_:
	.line	958, "main.c"; 	}
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
	.debuginfo complex-type (local-sym "_regAddr" 2 "main.c" 854 (basetype 2 unsigned) split "r0x1025" "r0x1024")
	.debuginfo complex-type (local-sym "_reg_ip55xs" 1 "main.c" 856 (basetype 1 unsigned) split "r0x1025")
	.debuginfo complex-type (local-sym "_timer_out" 1 "main.c" 857 (basetype 1 unsigned) split "r0x1024")
	.debuginfo complex-type (local-sym "_pdata" 3 "main.c" 854 (pointer gptr 3 (basetype 1 unsigned)) split "r0x1028" "r0x1027" "r0x1026")
_ip55xs_write4Bytes:
; 2 exit points
	.line	854, "main.c"; 	BOOL ip55xs_write4Bytes(unsigned int regAddr, unsigned char *pdata)
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
	.line	859, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
	BANKSEL	r0x1025
	MOVR	r0x1025,W
;;100	MOVAR	r0x1029
	MOVAR	STK01
	MOVIA	0x10
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	860, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
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
	.line	861, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x55);
	MOVIA	0x55
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	862, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x55);
	MOVIA	0x55
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	864, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	866, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1024
	MOVAR	r0x1024
_02386_DS_:
	.line	868, "main.c"; 	if (timer_out)
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BTRSC	STATUS,2
	MGOTO	_02384_DS_
	.line	870, "main.c"; 	timer_out--;
	DECR	r0x1024,F
	MGOTO	_02387_DS_
_02384_DS_:
	.line	874, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02401_DS_
_02387_DS_:
	.line	876, "main.c"; 	} while (0xAA != reg_ip55xs);
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	XORIA	0xaa
	BTRSS	STATUS,2
	MGOTO	_02386_DS_
	.line	877, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, *pdata); // DATA0
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
	.line	878, "main.c"; 	pdata++;
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
	.line	879, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, *pdata); // DATA1
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
	.line	881, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, 0x66);
	MOVIA	0x66
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	883, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, 0x66);
	MOVIA	0x66
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	885, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	887, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1024
	MOVAR	r0x1024
_02392_DS_:
	.line	889, "main.c"; 	if (timer_out)
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BTRSC	STATUS,2
	MGOTO	_02390_DS_
	.line	891, "main.c"; 	timer_out--;
	DECR	r0x1024,F
	MGOTO	_02393_DS_
_02390_DS_:
	.line	895, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02401_DS_
_02393_DS_:
	.line	897, "main.c"; 	} while (0x55 != reg_ip55xs);
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	XORIA	0x55
	BTRSS	STATUS,2
	MGOTO	_02392_DS_
	.line	899, "main.c"; 	pdata++;
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
	.line	900, "main.c"; 	ip53xs_writeByte(0xEA, 0x10, *pdata); // DATA2
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
	.line	901, "main.c"; 	pdata++;
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
	.line	902, "main.c"; 	ip53xs_writeByte(0xEA, 0x11, *pdata); // DATA3
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
	.line	903, "main.c"; 	ip53xs_writeByte(0xEA, 0x12, 0x77);
	MOVIA	0x77
	MOVAR	STK01
	MOVIA	0x12
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	905, "main.c"; 	ip53xs_writeByte(0xEA, 0x13, 0x77);
	MOVIA	0x77
	MOVAR	STK01
	MOVIA	0x13
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_writeByte
	.line	907, "main.c"; 	reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
	MOVIA	0x00
	MOVAR	STK00
	MOVIA	0xea
	MCALL	_ip53xs_readByte
	BANKSEL	r0x1025
	MOVAR	r0x1025
	.line	909, "main.c"; 	do
	MOVIA	0x64
	BANKSEL	r0x1024
	MOVAR	r0x1024
_02398_DS_:
	.line	911, "main.c"; 	if (timer_out)
	BANKSEL	r0x1024
	MOVR	r0x1024,W
	BTRSC	STATUS,2
	MGOTO	_02396_DS_
	.line	913, "main.c"; 	timer_out--;
	DECR	r0x1024,F
	MGOTO	_02399_DS_
_02396_DS_:
	.line	917, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02401_DS_
_02399_DS_:
	.line	919, "main.c"; 	} while (0xFF != reg_ip55xs);
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	XORIA	0xff
	BTRSS	STATUS,2
	MGOTO	_02398_DS_
	.line	920, "main.c"; 	return TRUE;
	MOVIA	0x01
_02401_DS_:
	.line	921, "main.c"; 	}
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
	.debuginfo complex-type (local-sym "_deviceAddr" 1 "main.c" 819 (basetype 1 unsigned) split "r0x1020")
	.debuginfo complex-type (local-sym "_regAddr" 1 "main.c" 819 (basetype 1 unsigned) split "r0x1021")
	.debuginfo complex-type (local-sym "_readByte" 1 "main.c" 821 (basetype 1 unsigned) split "r0x1022")
_ip53xs_readByte:
; 2 exit points
	.line	819, "main.c"; 	unsigned char ip53xs_readByte(unsigned char deviceAddr, unsigned char regAddr) //(unsigned char regAddr)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK00,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	.line	821, "main.c"; 	unsigned char readByte = 0;
	BANKSEL	r0x1022
	CLRR	r0x1022
	.line	822, "main.c"; 	if (P_I2C_INT)
	BTRSS	_PORTAbits,2
	MGOTO	_02377_DS_
	.line	824, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	826, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_WRITE))
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1023
	MOVAR	r0x1023
	MOVR	r0x1023,W
	BTRSC	STATUS,2
	MGOTO	_02371_DS_
	.line	828, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	829, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02378_DS_
_02371_DS_:
	.line	832, "main.c"; 	if (i2c_writeByte(regAddr))
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	r0x1021,W
	BTRSC	STATUS,2
	MGOTO	_02373_DS_
	.line	834, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	835, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02378_DS_
_02373_DS_:
	.line	838, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	840, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_READ))
	BANKSEL	r0x1020
	BSR	r0x1020,0
	MOVR	r0x1020,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	MGOTO	_02375_DS_
	.line	842, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	843, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02378_DS_
_02375_DS_:
	.line	846, "main.c"; 	readByte = i2c_readByte();
	MCALL	_i2c_readByte
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	847, "main.c"; 	i2c_send_nack();
	MCALL	_i2c_send_nack
	.line	848, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
_02377_DS_:
	.line	851, "main.c"; 	return readByte;
	BANKSEL	r0x1022
	MOVR	r0x1022,W
_02378_DS_:
	.line	852, "main.c"; 	}
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
	.debuginfo complex-type (local-sym "_deviceAddr" 1 "main.c" 789 (basetype 1 unsigned) split "r0x1020")
	.debuginfo complex-type (local-sym "_regAddr" 1 "main.c" 789 (basetype 1 unsigned) split "r0x1021")
	.debuginfo complex-type (local-sym "_sendByte" 1 "main.c" 789 (basetype 1 unsigned) split "r0x1022")
_ip53xs_writeByte:
; 2 exit points
	.line	789, "main.c"; 	BOOL ip53xs_writeByte(unsigned char deviceAddr, unsigned char regAddr, unsigned char sendByte)
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	STK00,W
	BANKSEL	r0x1021
	MOVAR	r0x1021
	MOVR	STK01,W
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	791, "main.c"; 	if (P_I2C_INT)
	BTRSS	_PORTAbits,2
	MGOTO	_02364_DS_
	.line	793, "main.c"; 	i2c_start();
	MCALL	_i2c_start
	.line	795, "main.c"; 	if (i2c_writeByte(deviceAddr | IIC_WRITE))
	BANKSEL	r0x1020
	MOVR	r0x1020,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	MGOTO	_02358_DS_
	.line	797, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	798, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02365_DS_
_02358_DS_:
	.line	801, "main.c"; 	if (i2c_writeByte(regAddr))
	BANKSEL	r0x1021
	MOVR	r0x1021,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	MGOTO	_02360_DS_
	.line	803, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	804, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02365_DS_
_02360_DS_:
	.line	807, "main.c"; 	if (i2c_writeByte(sendByte))
	BANKSEL	r0x1022
	MOVR	r0x1022,W
	MCALL	_i2c_writeByte
	BANKSEL	r0x1020
	MOVAR	r0x1020
	MOVR	r0x1020,W
	BTRSC	STATUS,2
	MGOTO	_02362_DS_
	.line	809, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
	.line	810, "main.c"; 	return FALSE;
	MOVIA	0x00
	MGOTO	_02365_DS_
_02362_DS_:
	.line	813, "main.c"; 	i2c_stop();
	MCALL	_i2c_stop
_02364_DS_:
	.line	816, "main.c"; 	return TRUE;
	MOVIA	0x01
_02365_DS_:
	.line	817, "main.c"; 	}
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
	.debuginfo complex-type (local-sym "_readByte" 1 "main.c" 763 (basetype 1 unsigned) split "r0x101C")
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 762 (basetype 1 unsigned) split "r0x101D")
_i2c_readByte:
; 2 exit points
	.line	763, "main.c"; 	unsigned char readByte = 0;
	BANKSEL	r0x101C
	CLRR	r0x101C
	.line	765, "main.c"; 	P_I2C_SCL_CLR;   // 拉低I2C_SCL
	BCR	_PORTAbits,4
	.line	766, "main.c"; 	P_I2C_SDA_INPUT; // 设置I2C_SDA为输入
	IOSTR	_IOSTA
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BSR	r0x101D,3
	MOVR	r0x101D,W
	IOST	_IOSTA
	.line	768, "main.c"; 	while (i--)
	MOVIA	0x08
	MOVAR	r0x101D
_02350_DS_:
	BANKSEL	r0x101D
	MOVR	r0x101D,W
	BANKSEL	r0x101E
	MOVAR	r0x101E
	BANKSEL	r0x101D
	DECR	r0x101D,F
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BTRSC	STATUS,2
	MGOTO	_02352_DS_
	.line	771, "main.c"; 	P_I2C_SCL_SET; // 拉高I2C_SCL
	BSR	_PORTAbits,4
	.line	772, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	773, "main.c"; 	readByte <<= 1;
	BCR	STATUS,0
	BANKSEL	r0x101C
	RLR	r0x101C,F
	.line	775, "main.c"; 	if (P_I2C_SDA)
	BTRSC	_PORTAbits,3
	.line	777, "main.c"; 	readByte |= 0x01;
	BSR	r0x101C,0
	.line	780, "main.c"; 	P_I2C_SCL_CLR; // 拉低I2C_SCL
	BCR	_PORTAbits,4
	.line	781, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	MGOTO	_02350_DS_
_02352_DS_:
	.line	785, "main.c"; 	P_I2C_SDA_OUTPUT; // 设置I2C_SDA为输出
	IOSTR	_IOSTA
	BANKSEL	r0x101D
	MOVAR	r0x101D
	BCR	r0x101D,3
	MOVR	r0x101D,W
	IOST	_IOSTA
	.line	786, "main.c"; 	return readByte;  // 返回数据
	BANKSEL	r0x101C
	MOVR	r0x101C,W
	.line	787, "main.c"; 	}
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
	.debuginfo complex-type (local-sym "_sendByte" 1 "main.c" 735 (basetype 1 unsigned) split "r0x101D")
	.debuginfo complex-type (local-sym "_i" 1 "main.c" 737 (basetype 1 unsigned) split "r0x101E")
_i2c_writeByte:
; 2 exit points
	.line	735, "main.c"; 	unsigned char i2c_writeByte(unsigned char sendByte)
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	739, "main.c"; 	while (i--) // I2C_SDA脚从高位至低位发送数据
	MOVIA	0x08
	BANKSEL	r0x101E
	MOVAR	r0x101E
_02341_DS_:
	BANKSEL	r0x101E
	MOVR	r0x101E,W
	BANKSEL	r0x101F
	MOVAR	r0x101F
	BANKSEL	r0x101E
	DECR	r0x101E,F
	BANKSEL	r0x101F
	MOVR	r0x101F,W
	BTRSC	STATUS,2
	MGOTO	_02343_DS_
	.line	741, "main.c"; 	P_I2C_SCL_CLR; // 拉低I2C_SCL,以允许I2C_SDA脚w位数据发生变化
	BCR	_PORTAbits,4
	.line	742, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	743, "main.c"; 	if (sendByte & 0x80) /* MSB output first */
	BANKSEL	r0x101D
	BTRSS	r0x101D,7
	MGOTO	_02339_DS_
	.line	745, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	MGOTO	_02340_DS_
_02339_DS_:
	.line	749, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
_02340_DS_:
	.line	751, "main.c"; 	sendByte <<= 1;
	BCR	STATUS,0
	BANKSEL	r0x101D
	RLR	r0x101D,F
	.line	752, "main.c"; 	P_I2C_SCL_SET; // 拉高I2C_SCL
	BSR	_PORTAbits,4
	.line	753, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	754, "main.c"; 	NOP();
	nop
	MGOTO	_02341_DS_
_02343_DS_:
	.line	757, "main.c"; 	return i2c_chk_ack();
	MCALL	_i2c_chk_ack
	BANKSEL	r0x101D
	MOVAR	r0x101D
	.line	758, "main.c"; 	}
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
	.line	726, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	727, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	728, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	729, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	730, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	731, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	732, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	733, "main.c"; 	}
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
	.line	715, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	716, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	717, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	718, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	719, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	720, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	721, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	722, "main.c"; 	}
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
	.debuginfo complex-type (local-sym "_getAckTime" 1 "main.c" 694 (basetype 1 unsigned) split "r0x101C")
_i2c_chk_ack:
; 2 exit points
	.line	692, "main.c"; 	P_I2C_SCL_CLR;                                  // slave send ACK
	BCR	_PORTAbits,4
	.line	693, "main.c"; 	P_I2C_SDA_INPUT;                                // Allow slave to send ACK
	IOSTR	_IOSTA
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BSR	r0x101C,3
	MOVR	r0x101C,W
	IOST	_IOSTA
	.line	695, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	696, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	697, "main.c"; 	_dly_us(0);
	MOVIA	0x00
	MCALL	__dly_us
	.line	698, "main.c"; 	while (P_I2C_SDA)
	MOVIA	0xfa
	BANKSEL	r0x101C
	MOVAR	r0x101C
_02322_DS_:
	BTRSS	_PORTAbits,3
	MGOTO	_02324_DS_
	.line	700, "main.c"; 	--getAckTime;
	BANKSEL	r0x101C
	DECRSZ	r0x101C,F
	.line	702, "main.c"; 	if (0 == getAckTime)
	MGOTO	_02322_DS_
	.line	704, "main.c"; 	return 1;
	MOVIA	0x01
	MGOTO	_02325_DS_
_02324_DS_:
	.line	708, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	709, "main.c"; 	P_I2C_SDA_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BCR	r0x101C,3
	MOVR	r0x101C,W
	IOST	_IOSTA
	.line	710, "main.c"; 	return 0;
	MOVIA	0x00
_02325_DS_:
	.line	711, "main.c"; 	}
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
	.line	680, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	681, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	682, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	683, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	684, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	685, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	686, "main.c"; 	}
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
	.line	667, "main.c"; 	P_I2C_SDA_SET;
	BSR	_PORTAbits,3
	.line	668, "main.c"; 	P_I2C_SCL_SET;
	BSR	_PORTAbits,4
	.line	669, "main.c"; 	P_I2C_SDA_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x101C
	MOVAR	r0x101C
	BCR	r0x101C,3
	MOVR	r0x101C,W
	IOST	_IOSTA
	.line	670, "main.c"; 	P_I2C_SCL_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x101C
	BCR	r0x101C,4
	MOVR	r0x101C,W
	IOST	_IOSTA
	.line	671, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	672, "main.c"; 	P_I2C_SDA_CLR;
	BCR	_PORTAbits,3
	.line	673, "main.c"; 	_dly_us(10);
	MOVIA	0x0a
	MCALL	__dly_us
	.line	674, "main.c"; 	P_I2C_SCL_CLR;
	BCR	_PORTAbits,4
	.line	675, "main.c"; 	}
	RETURN	
; exit point of _i2c_start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x101B
;; Starting pCode block
.segment "code"; module=main, function=_gpioKeyScan
	.debuginfo subprogram _gpioKeyScan
_gpioKeyScan:
; 2 exit points
	.line	543, "main.c"; 	P_KEY_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BSR	r0x101B,0
	MOVR	r0x101B,W
	IOST	_IOSTB
	.line	544, "main.c"; 	if (gpioKeyWaitTimer)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSC	STATUS,2
	MGOTO	_02231_DS_
	.line	546, "main.c"; 	gpioKeyWaitTimer--;
	MOVR	_gpioKeyWaitTimer,W
	BANKSEL	r0x101B
	MOVAR	r0x101B
	DECR	r0x101B,W
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
_02231_DS_:
	.line	549, "main.c"; 	indexKey = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,2
	.line	551, "main.c"; 	if (P_KEY)
	BTRSS	_PORTBbits,0
	MGOTO	_02233_DS_
	.line	553, "main.c"; 	indexKey = 1;
	BSR	_vFlag_1,2
	.line	554, "main.c"; 	P_KEY_IPS_SET;
	BSR	_PORTBbits,1
	.line	555, "main.c"; 	P_KEY_IPS_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BSR	r0x101B,1
	MOVR	r0x101B,W
	IOST	_IOSTB
_02233_DS_:
	.line	558, "main.c"; 	switch (gpioKeyState)
	BANKSEL	_gpioKeyState
	MOVR	_gpioKeyState,W
	BTRSC	STATUS,2
	MGOTO	_02234_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x01
	BTRSC	STATUS,2
	MGOTO	_02237_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x02
	BTRSC	STATUS,2
	MGOTO	_02243_DS_
	MOVR	_gpioKeyState,W
	XORIA	0x03
	BTRSC	STATUS,2
	MGOTO	_02249_DS_
	MGOTO	_02252_DS_
_02234_DS_:
	.line	561, "main.c"; 	if (indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02236_DS_
	.line	564, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
	MGOTO	_02254_DS_
_02236_DS_:
	.line	569, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_JTTER_TIME; // gSysTick_current;
	MOVIA	0x03
	BANKSEL	_gpioKeyWaitTimer
	MOVAR	_gpioKeyWaitTimer
	.line	571, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_JITTER;
	MOVIA	0x01
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
_02237_DS_:
	.line	574, "main.c"; 	if (indexKey) // if(PreKeyIndex != indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02241_DS_
	.line	577, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	MGOTO	_02253_DS_
_02241_DS_:
	.line	580, "main.c"; 	else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_JTTER_TIME)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_02253_DS_
	.line	586, "main.c"; 	gpioKeyWaitTimer = GPIO_KEY_CP_TIME; // gSysTick_current;
	MOVIA	0x96
	MOVAR	_gpioKeyWaitTimer
	.line	587, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_PRESS_DOWN;
	MOVIA	0x02
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
	.line	588, "main.c"; 	P_KEY_IPS_CLR;
	BCR	_PORTBbits,1
	.line	589, "main.c"; 	P_KEY_IPS_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x101B
	MOVAR	r0x101B
	BCR	r0x101B,1
	MOVR	r0x101B,W
	IOST	_IOSTB
	.line	593, "main.c"; 	break;
	MGOTO	_02253_DS_
_02243_DS_:
	.line	596, "main.c"; 	if (indexKey)               // if(PreKeyIndex != indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02247_DS_
	.line	600, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	.line	602, "main.c"; 	return MSG_MODE; // GpioKeyEvent[PreKeyIndex][1]; //SPR
	MOVIA	0x21
	MGOTO	_02254_DS_
_02247_DS_:
	.line	605, "main.c"; 	else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_CP_TIME)
	BANKSEL	_gpioKeyWaitTimer
	MOVR	_gpioKeyWaitTimer,W
	BTRSS	STATUS,2
	MGOTO	_02253_DS_
	.line	613, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_CP;
	MOVIA	0x03
	BANKSEL	_gpioKeyState
	MOVAR	_gpioKeyState
	.line	628, "main.c"; 	return MSG_POWER_ON; // GpioKeyEvent[PreKeyIndex][2];  //CPS
	MOVIA	0x41
	MGOTO	_02254_DS_
_02249_DS_:
	.line	634, "main.c"; 	if (indexKey) // if(PreKeyIndex != indexKey)
	BANKSEL	_vFlag_1
	BTRSS	_vFlag_1,2
	MGOTO	_02253_DS_
	.line	639, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
	.line	653, "main.c"; 	break;
	MGOTO	_02253_DS_
_02252_DS_:
	.line	656, "main.c"; 	gpioKeyState = GPIO_KEY_STATE_IDLE;
	BANKSEL	_gpioKeyState
	CLRR	_gpioKeyState
_02253_DS_:
	.line	660, "main.c"; 	return MSG_NONE;
	MOVIA	0x00
_02254_DS_:
	.line	661, "main.c"; 	}
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
	.debuginfo complex-type (local-sym "_indexScan" 1 "main.c" 298 (basetype 1 unsigned) link "_io_led_scan_indexScan_65536_29")
_io_led_scan:
; 0 exit points
	.line	300, "main.c"; 	P_LED_SEG1_INPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BSR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	301, "main.c"; 	P_LED_SEG2_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BSR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	302, "main.c"; 	P_LED_SEG3_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BSR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	303, "main.c"; 	P_LED_SEG4_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BSR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	304, "main.c"; 	P_LED_SEG5_INPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BSR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x12=18), size=1
	.line	306, "main.c"; 	switch (indexScan)
	MOVIA	0x12
	BANKSEL	_io_led_scan_indexScan_65536_29
	SUBAR	_io_led_scan_indexScan_65536_29,W
	BTRSC	STATUS,0
	MGOTO	_02109_DS_
	MOVIA	((_02225_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_io_led_scan_indexScan_65536_29,W
	ADDIA	_02225_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_02225_DS_:
	MGOTO	_02054_DS_
	MGOTO	_02057_DS_
	MGOTO	_02060_DS_
	MGOTO	_02063_DS_
	MGOTO	_02066_DS_
	MGOTO	_02069_DS_
	MGOTO	_02072_DS_
	MGOTO	_02075_DS_
	MGOTO	_02078_DS_
	MGOTO	_02081_DS_
	MGOTO	_02084_DS_
	MGOTO	_02087_DS_
	MGOTO	_02090_DS_
	MGOTO	_02093_DS_
	MGOTO	_02096_DS_
	MGOTO	_02099_DS_
	MGOTO	_02102_DS_
	MGOTO	_02105_DS_
_02054_DS_:
	.line	309, "main.c"; 	if (displayDecade & SEG_A) // 2A
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,0
	MGOTO	_02109_DS_
	.line	311, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	312, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	313, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	314, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	316, "main.c"; 	break;
	MGOTO	_02109_DS_
_02057_DS_:
	.line	319, "main.c"; 	if (displayDecade & SEG_B) // 2B
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,1
	MGOTO	_02109_DS_
	.line	321, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	322, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	323, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	324, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	326, "main.c"; 	break;
	MGOTO	_02109_DS_
_02060_DS_:
	.line	329, "main.c"; 	if (displayDecade & SEG_C) // 2C
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,2
	MGOTO	_02109_DS_
	.line	331, "main.c"; 	P_LED_SEG4_SET;
	BSR	_PORTAbits,7
	.line	332, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	333, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	334, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	336, "main.c"; 	break;
	MGOTO	_02109_DS_
_02063_DS_:
	.line	339, "main.c"; 	if (displayDecade & SEG_D) // 2D
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,3
	MGOTO	_02109_DS_
	.line	341, "main.c"; 	P_LED_SEG4_SET;
	BSR	_PORTAbits,7
	.line	342, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	343, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	344, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	346, "main.c"; 	break;
	MGOTO	_02109_DS_
_02066_DS_:
	.line	349, "main.c"; 	if (displayDecade & SEG_E) // 2E
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,4
	MGOTO	_02109_DS_
	.line	351, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	352, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	353, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	354, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	356, "main.c"; 	break;
	MGOTO	_02109_DS_
_02069_DS_:
	.line	359, "main.c"; 	if (displayDecade & SEG_F) // 2F
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,5
	MGOTO	_02109_DS_
	.line	361, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	362, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	363, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	364, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	366, "main.c"; 	break;
	MGOTO	_02109_DS_
_02072_DS_:
	.line	369, "main.c"; 	if (displayDecade & SEG_G) // 2G
	BANKSEL	_displayDecade
	BTRSS	_displayDecade,6
	MGOTO	_02109_DS_
	.line	371, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	372, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	373, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	374, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	376, "main.c"; 	break;
	MGOTO	_02109_DS_
_02075_DS_:
	.line	379, "main.c"; 	if (displayDigit & SEG_A) // 3A
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,0
	MGOTO	_02109_DS_
	.line	381, "main.c"; 	P_LED_SEG1_SET;
	BSR	_PORTBbits,5
	.line	382, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	383, "main.c"; 	P_LED_SEG2_CLR;
	BCR	_PORTAbits,0
	.line	384, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	386, "main.c"; 	break;
	MGOTO	_02109_DS_
_02078_DS_:
	.line	389, "main.c"; 	if (displayDigit & SEG_B) // 3B
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,1
	MGOTO	_02109_DS_
	.line	391, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	392, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	393, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	394, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	396, "main.c"; 	break;
	MGOTO	_02109_DS_
_02081_DS_:
	.line	399, "main.c"; 	if (displayDigit & SEG_C) // 3C
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,2
	MGOTO	_02109_DS_
	.line	401, "main.c"; 	P_LED_SEG1_SET;
	BSR	_PORTBbits,5
	.line	402, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	403, "main.c"; 	P_LED_SEG3_CLR;
	BCR	_PORTAbits,1
	.line	404, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	406, "main.c"; 	break;
	MGOTO	_02109_DS_
_02084_DS_:
	.line	409, "main.c"; 	if (displayDigit & SEG_D) // 3D
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,3
	MGOTO	_02109_DS_
	.line	411, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	412, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	413, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	414, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	416, "main.c"; 	break;
	MGOTO	_02109_DS_
_02087_DS_:
	.line	419, "main.c"; 	if (displayDigit & SEG_E) // 3E
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,4
	MGOTO	_02109_DS_
	.line	421, "main.c"; 	P_LED_SEG1_SET;
	BSR	_PORTBbits,5
	.line	422, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	423, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	424, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	426, "main.c"; 	break;
	MGOTO	_02109_DS_
_02090_DS_:
	.line	429, "main.c"; 	if (displayDigit & SEG_F) // 3F
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,5
	MGOTO	_02109_DS_
	.line	431, "main.c"; 	P_LED_SEG4_SET;
	BSR	_PORTAbits,7
	.line	432, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	433, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	434, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	436, "main.c"; 	break;
	MGOTO	_02109_DS_
_02093_DS_:
	.line	439, "main.c"; 	if (displayDigit & SEG_G) // 3G OK
	BANKSEL	_displayDigit
	BTRSS	_displayDigit,6
	MGOTO	_02109_DS_
	.line	441, "main.c"; 	P_LED_SEG5_SET;
	BSR	_PORTAbits,6
	.line	442, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	443, "main.c"; 	P_LED_SEG1_CLR;
	BCR	_PORTBbits,5
	.line	444, "main.c"; 	P_LED_SEG1_OUTPUT;
	IOSTR	_IOSTB
	MOVAR	r0x1032
	BCR	r0x1032,5
	MOVR	r0x1032,W
	IOST	_IOSTB
	.line	446, "main.c"; 	break;
	MGOTO	_02109_DS_
_02096_DS_:
	.line	449, "main.c"; 	if (displayHundred & SEG_B) // 1B OK
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,1
	MGOTO	_02109_DS_
	.line	451, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	452, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	453, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	454, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	456, "main.c"; 	break;
	MGOTO	_02109_DS_
_02099_DS_:
	.line	459, "main.c"; 	if (displayHundred & SEG_C) // 1C OK
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,2
	MGOTO	_02109_DS_
	.line	461, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	462, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	463, "main.c"; 	P_LED_SEG4_CLR;
	BCR	_PORTAbits,7
	.line	464, "main.c"; 	P_LED_SEG4_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,7
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	467, "main.c"; 	break;
	MGOTO	_02109_DS_
_02102_DS_:
	.line	482, "main.c"; 	if (displayHundred & SEG_D) // 1D quick
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,3
	MGOTO	_02109_DS_
	.line	484, "main.c"; 	P_LED_SEG3_SET;
	BSR	_PORTAbits,1
	.line	485, "main.c"; 	P_LED_SEG3_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,1
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	486, "main.c"; 	P_LED_SEG5_CLR;
	BCR	_PORTAbits,6
	.line	487, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	489, "main.c"; 	break;
	MGOTO	_02109_DS_
_02105_DS_:
	.line	492, "main.c"; 	if (displayHundred & SEG_E) // 1E wireless
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,4
	MGOTO	_02109_DS_
	.line	494, "main.c"; 	P_LED_SEG2_SET;
	BSR	_PORTAbits,0
	.line	495, "main.c"; 	P_LED_SEG2_OUTPUT;
	IOSTR	_IOSTA
	BANKSEL	r0x1032
	MOVAR	r0x1032
	BCR	r0x1032,0
	MOVR	r0x1032,W
	IOST	_IOSTA
	.line	496, "main.c"; 	P_LED_SEG5_CLR;
	BCR	_PORTAbits,6
	.line	497, "main.c"; 	P_LED_SEG5_OUTPUT;
	IOSTR	_IOSTA
	MOVAR	r0x1032
	BCR	r0x1032,6
	MOVR	r0x1032,W
	IOST	_IOSTA
_02109_DS_:
	.line	505, "main.c"; 	indexScan++; //! 1ms 调用一次
	BANKSEL	_io_led_scan_indexScan_65536_29
	INCR	_io_led_scan_indexScan_65536_29,F
	.line	506, "main.c"; 	if (0 == forceDispTimer)
	BANKSEL	_forceDispTimer
	MOVR	_forceDispTimer,W
	BTRSS	STATUS,2
	MGOTO	_02120_DS_
	.line	508, "main.c"; 	if (displayHundred & SEG_B) // 100
	BANKSEL	_displayHundred
	BTRSS	_displayHundred,1
	MGOTO	_02117_DS_
	.line	510, "main.c"; 	if (indexScan == 6) // 3G
	BANKSEL	_io_led_scan_indexScan_65536_29
	MOVR	_io_led_scan_indexScan_65536_29,W
	XORIA	0x06
	BTRSC	STATUS,2
	.line	512, "main.c"; 	indexScan++;
	INCR	_io_led_scan_indexScan_65536_29,F
	.line	515, "main.c"; 	if (indexScan == 13) // 2G
	MOVR	_io_led_scan_indexScan_65536_29,W
	XORIA	0x0d
	BTRSS	STATUS,2
	MGOTO	_02120_DS_
	.line	517, "main.c"; 	indexScan++;
	INCR	_io_led_scan_indexScan_65536_29,F
	MGOTO	_02120_DS_
_02117_DS_:
	.line	522, "main.c"; 	if (indexScan == 14) // 1B
	BANKSEL	_io_led_scan_indexScan_65536_29
	MOVR	_io_led_scan_indexScan_65536_29,W
	XORIA	0x0e
	BTRSS	STATUS,2
	MGOTO	_02120_DS_
	.line	524, "main.c"; 	indexScan++;
	INCR	_io_led_scan_indexScan_65536_29,F
	.line	525, "main.c"; 	indexScan++; // 1C
	INCR	_io_led_scan_indexScan_65536_29,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x12=18), size=1
_02120_DS_:
	.line	534, "main.c"; 	if (indexScan > 17) //
	MOVIA	0x12
	BANKSEL	_io_led_scan_indexScan_65536_29
	SUBAR	_io_led_scan_indexScan_65536_29,W
	BTRSC	STATUS,0
	.line	536, "main.c"; 	indexScan = 0;
	CLRR	_io_led_scan_indexScan_65536_29
	.line	538, "main.c"; 	}
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
	.line	288, "main.c"; 	void _dly_us(unsigned char cnt)
	BANKSEL	r0x101B
	MOVAR	r0x101B
_02046_DS_:
	.line	290, "main.c"; 	while (cnt)
	BANKSEL	r0x101B
	MOVR	r0x101B,W
	BTRSC	STATUS,2
	MGOTO	_02049_DS_
	.line	292, "main.c"; 	cnt--;
	DECR	r0x101B,F
	MGOTO	_02046_DS_
_02049_DS_:
	.line	294, "main.c"; 	}
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
	.line	280, "main.c"; 	bFlag_is_breathing_mode = 0;
	BANKSEL	_vFlag_1
	BCR	_vFlag_1,0
	.line	281, "main.c"; 	indicator_light_mode = 0;
	BANKSEL	_indicator_light_mode
	CLRR	_indicator_light_mode
	.line	282, "main.c"; 	P_LED_R_CLR;
	BCR	_PORTBbits,4
	.line	283, "main.c"; 	P_LED_G_CLR;
	BCR	_PORTBbits,3
	.line	284, "main.c"; 	P_LED_B_CLR;
	BCR	_PORTBbits,2
	.line	285, "main.c"; 	}
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
	.line	273, "main.c"; 	bFlag_is_breathing_mode = 1;
	BANKSEL	_vFlag_1
	BSR	_vFlag_1,0
	.line	274, "main.c"; 	bFlag_inc_or_dec = 0;
	BCR	_vFlag_1,1
	.line	275, "main.c"; 	indicator_light_mode = 0;
	BANKSEL	_indicator_light_mode
	CLRR	_indicator_light_mode
	.line	276, "main.c"; 	}
	RETURN	
; exit point of _enable_breathing_mode


;	code size estimation:
;	 1571+  384 =  1955 instructions ( 4678 byte)

	end
