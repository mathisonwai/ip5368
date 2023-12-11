/* =========================================================================
 * Project:       Sleep Wakeup
 * File:          main.c
 * Description:   Into Halt mode & Standby mode, and while PortB input change then do wakeup.
 *                While PB1 input change, then wakeup from Halt(Standby) mode and set PB3 output low.
 *                Also switch between Normal Mode and Slow Mode.
 *                FINST = 8MHz/2T(I_HRC).//FINST = 4MHz/4T(I_HRC).
 *
 * Author:        JasonLee
 * Version:       V1.0
 * Date:          2020/06/05
 =========================================================================*/

// ui
//  1.首次接上电池后，单击按键，电量显示0且闪烁4次后灭。
// 2.插入充电后，数码管先是全亮，然后显示当前电量数字个位闪。
// 3.充满后数码管100长亮。
// 4.放电中，当前电量数字长亮，5%电量后闪烁
// ui end
#include <ny8.h>
#include "NY8_constant.h"
#include "app_cfg.h"
#include "app_type.h"
#include "app_key.h"

#define HALT_MODE 0x04
#define FHOSC_SEL 0x01
#define STANDBY_MODE 0x08

#define UPDATE_REG(x) __asm__("MOVR _" #x ",F")

void io_led_scan(void);

// add by kwangsi
volatile unsigned char vFlag_0;
__sbit bFlag_gSysTick_Change = vFlag_0 : 0;
__sbit bFlag_slice_16ms = vFlag_0 : 1;
__sbit bFlag_light_load = vFlag_0 : 2;
__sbit bFlag_typec_in = vFlag_0 : 3;
__sbit bFlag_qc_ok = vFlag_0 : 4;
__sbit bFlag_bat_vol_low = vFlag_0 : 5;
__sbit bFlag_bat_vol_shutdown = vFlag_0 : 6;
__sbit bFlag_blink = vFlag_0 : 7;

volatile unsigned char vFlag_1;
__sbit bFlag_is_breathing_mode = vFlag_1 : 0;
__sbit bFlag_inc_or_dec = vFlag_1 : 1;
__sbit indexKey = vFlag_1 : 2;
__sbit bFlag_p_ext_int_is_high = vFlag_1 : 3;
__sbit bFlag_power_on = vFlag_1 : 4;
__sbit bFlag_charger_on = vFlag_1 : 5;    //
__sbit bFlag_chg_or_dischg = vFlag_1 : 6; //
// __sbit bFlag_Chargering_From_Empty = vFlag_1 : 7;

volatile unsigned char moto_work_mode;
// display
volatile unsigned char always_light_timer;
volatile unsigned char always_light_timer_shadow;
volatile unsigned char indicator_light_mode; // R G B  1 -- R(亮红色)  2-- G(亮绿色) 3 -- B(亮白色)  0 -- 全灭
volatile unsigned char underVoltageDispTimer;
volatile unsigned char displayTimer;
volatile unsigned char delaySleepTimer;
volatile unsigned char displayData;
volatile unsigned char bat_level_buf;
volatile unsigned char timer_slice_16ms;
// volatile unsigned char delaySleepTimer;
volatile unsigned char gpioKeyWaitTimer;
GPIO_KEY_STATE gpioKeyState;

#ifdef BREATH_LED_MODE
volatile unsigned char respiration_lamp_timer;
#endif

volatile unsigned char IP_DATA[4];
volatile unsigned char forceDispTimer;

volatile unsigned char displayData;
volatile unsigned char displayHundred;
volatile unsigned char displayDecade;
volatile unsigned char displayDigit;
volatile unsigned char timer_slice_10ms;

volatile unsigned char gSysTick;

const unsigned char DispTable[] =
    {
        SEG_A | SEG_B | SEG_C | SEG_D | SEG_E | SEG_F,         // 0
        SEG_B | SEG_C,                                         // 1
        SEG_A | SEG_B | SEG_D | SEG_E | SEG_G,                 // 2
        SEG_A | SEG_B | SEG_C | SEG_D | SEG_G,                 // 3
        SEG_B | SEG_C | SEG_F | SEG_G,                         // 4
        SEG_A | SEG_C | SEG_D | SEG_F | SEG_G,                 // 5
        SEG_A | SEG_C | SEG_D | SEG_E | SEG_F | SEG_G,         // 6
        SEG_A | SEG_B | SEG_C,                                 // 7
        SEG_A | SEG_B | SEG_C | SEG_D | SEG_E | SEG_F | SEG_G, // 8
        SEG_A | SEG_B | SEG_C | SEG_D | SEG_F | SEG_G,         // 9
        SEG_A | SEG_D | SEG_E | SEG_F | SEG_G,                 // E  10
        SEG_E | SEG_G,                                         // r  11
        SEG_B | SEG_C | SEG_E | SEG_F | SEG_G,                 // H  12
        0x00,                                                  // null
};

#define CONST_RESPIRATION_LAMP_SERIES 80

const unsigned char RESPIRATION_LAMP_TABLE[] =
    {
        1,
        1,
        1,
        1,
        1,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        3,
        3,
        3,
        3,
        3,
        4,
        4,
        4,
        5,
        5,
        5,
        6,
        6,
        6,
        7,
        7,
        8,
        9,
        9,
        10,
        11,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        20,
        21,
        23,
        24,
        26,
        28,
        30,
        32,
        34,
        37,
        39,
        42,
        45,
        48,
        52,
        56,
        60,
        64,
        68,
        73,
        79,
        84,
        90,
        97,
        104,
        111,
        119,
        128,
        137,
        147,
        157,
        168,
        180,
        193,
        207,
        222,
        238,
        255,
        255};

void isr(void) __interrupt(0) // 64us  8MHz 2T
{
    static unsigned char timerCnt;
    static unsigned char led_lamp;
    static unsigned char respiration_lamp_series;

    if (TM0IF)
    {
        TM0IF = 0;
        // TMR0 = 0;//125 138;//0x0F;  34.8us

        // P_LED_G ^= 1;

        timerCnt++;

        if (!(timerCnt & 0x0F))
        {
            // P_TEST ^= 1;
            //  P_LED_G ^= 1;  //1.03125ms
            bFlag_gSysTick_Change = 1; // 1ms

            if (!(timerCnt))
            {
                // P_LED_G ^= 1; // 16.4ms
                bFlag_slice_16ms = 1;
            }
            // io_led_scan();
        }
        if (!(timerCnt & 0x07))
        {
            io_led_scan();
        }

        if (bFlag_is_breathing_mode) // 100us
        {
            respiration_lamp_timer++;

            if (!(respiration_lamp_timer))
            {
                if (bFlag_inc_or_dec)
                {
                    if (!(--respiration_lamp_series))
                    {
                        bFlag_inc_or_dec = 0;
                        // ++indicator_light_mode;
                        if (++indicator_light_mode > 2)
                        {
                            indicator_light_mode = 0;
                        }
                    }
                }
                else
                {
                    if (++respiration_lamp_series >= CONST_RESPIRATION_LAMP_SERIES)
                    {
                        respiration_lamp_series = CONST_RESPIRATION_LAMP_SERIES;
                        bFlag_inc_or_dec = 1;
                    }
                }

                led_lamp = RESPIRATION_LAMP_TABLE[respiration_lamp_series];
            }

            if (respiration_lamp_timer >= led_lamp)
            {
                P_LED_R_OFF;
                P_LED_G_OFF;
                P_LED_B_OFF; // white led
            }
            else
            {
                if (0x01 == indicator_light_mode)
                {
                    P_LED_B_ON; // white
                }
                else if (0x02 == indicator_light_mode)
                {
                    P_LED_G_ON; // green
                }
                else
                {
                    P_LED_R_ON; // orange
                }
            }
        }
    }

    if (INTFbits.PABIF)
    {
        INTFbits.PABIF = 0; // Clear PABIF(PortB input change interrupt flag bit)
    }
}
#ifdef BREATH_LED_MODE
void enable_breathing_mode(void)
{
    bFlag_is_breathing_mode = 1;
    bFlag_inc_or_dec = 0;
    indicator_light_mode = 0;
}

void disable_breathing_mode(void)
{
    bFlag_is_breathing_mode = 0;
    indicator_light_mode = 0;
    P_LED_R_CLR;
    P_LED_G_CLR;
    P_LED_B_CLR;
}
#endif

void _dly_us(unsigned char cnt)
{
    while (cnt)
    {
        cnt--;
    }
}

void io_led_scan(void)
{
    static unsigned char indexScan = 0; // 扫描指针

    P_LED_SEG1_INPUT;
    P_LED_SEG2_INPUT;
    P_LED_SEG3_INPUT;
    P_LED_SEG4_INPUT;
    P_LED_SEG5_INPUT;

    switch (indexScan)
    {
    case 0:
        if (displayDecade & SEG_A) // 2A
        {
            P_LED_SEG2_SET;
            P_LED_SEG2_OUTPUT;
            P_LED_SEG3_CLR;
            P_LED_SEG3_OUTPUT;
        }
        break;

    case 1:
        if (displayDecade & SEG_B) // 2B
        {
            P_LED_SEG3_SET;
            P_LED_SEG3_OUTPUT;
            P_LED_SEG2_CLR;
            P_LED_SEG2_OUTPUT;
        }
        break;

    case 2:
        if (displayDecade & SEG_C) // 2C
        {
            P_LED_SEG4_SET;
            P_LED_SEG4_OUTPUT;
            P_LED_SEG3_CLR;
            P_LED_SEG3_OUTPUT;
        }
        break;

    case 3:
        if (displayDecade & SEG_D) // 2D
        {
            P_LED_SEG4_SET;
            P_LED_SEG4_OUTPUT;
            P_LED_SEG2_CLR;
            P_LED_SEG2_OUTPUT;
        }
        break;

    case 4:
        if (displayDecade & SEG_E) // 2E
        {
            P_LED_SEG5_SET;
            P_LED_SEG5_OUTPUT;
            P_LED_SEG2_CLR;
            P_LED_SEG2_OUTPUT;
        }
        break;

    case 5:
        if (displayDecade & SEG_F) // 2F
        {
            P_LED_SEG5_SET;
            P_LED_SEG5_OUTPUT;
            P_LED_SEG3_CLR;
            P_LED_SEG3_OUTPUT;
        }
        break;

    case 6:
        if (displayDecade & SEG_G) // 2G
        {
            P_LED_SEG5_SET;
            P_LED_SEG5_OUTPUT;
            P_LED_SEG4_CLR;
            P_LED_SEG4_OUTPUT;
        }
        break;

    case 7:
        if (displayDigit & SEG_A) // 3A
        {
            P_LED_SEG1_SET;
            P_LED_SEG1_OUTPUT;
            P_LED_SEG2_CLR;
            P_LED_SEG2_OUTPUT;
        }
        break;

    case 8:
        if (displayDigit & SEG_B) // 3B
        {
            P_LED_SEG2_SET;
            P_LED_SEG2_OUTPUT;
            P_LED_SEG1_CLR;
            P_LED_SEG1_OUTPUT;
        }
        break;

    case 9:
        if (displayDigit & SEG_C) // 3C
        {
            P_LED_SEG1_SET;
            P_LED_SEG1_OUTPUT;
            P_LED_SEG3_CLR;
            P_LED_SEG3_OUTPUT;
        }
        break;

    case 10:
        if (displayDigit & SEG_D) // 3D
        {
            P_LED_SEG3_SET;
            P_LED_SEG3_OUTPUT;
            P_LED_SEG1_CLR;
            P_LED_SEG1_OUTPUT;
        }
        break;

    case 11:
        if (displayDigit & SEG_E) // 3E
        {
            P_LED_SEG1_SET;
            P_LED_SEG1_OUTPUT;
            P_LED_SEG4_CLR;
            P_LED_SEG4_OUTPUT;
        }
        break;

    case 12:
        if (displayDigit & SEG_F) // 3F
        {
            P_LED_SEG4_SET;
            P_LED_SEG4_OUTPUT;
            P_LED_SEG1_CLR;
            P_LED_SEG1_OUTPUT;
        }
        break;

    case 13:
        if (displayDigit & SEG_G) // 3G OK
        {
            P_LED_SEG5_SET;
            P_LED_SEG5_OUTPUT;
            P_LED_SEG1_CLR;
            P_LED_SEG1_OUTPUT;
        }
        break;

    case 14:
        if (displayHundred & SEG_B) // 1B OK
        {
            P_LED_SEG3_SET;
            P_LED_SEG3_OUTPUT;
            P_LED_SEG4_CLR;
            P_LED_SEG4_OUTPUT;
        }
        break;

    case 15:
        if (displayHundred & SEG_C) // 1C OK
        {
            P_LED_SEG2_SET;
            P_LED_SEG2_OUTPUT;
            P_LED_SEG4_CLR;
            P_LED_SEG4_OUTPUT;
        }

        break;

        // case 16:

        //     if (displayHundred & SEG_A) // 1A H--OUT
        //     {
        //         P_LED_SEG4_SET;
        //         P_LED_SEG4_OUTPUT;
        //         P_LED_SEG5_CLR;
        //         P_LED_SEG5_OUTPUT;
        //     }

        //     break;

    case 16:
        if (displayHundred & SEG_D) // 1D quick
        {
            P_LED_SEG3_SET;
            P_LED_SEG3_OUTPUT;
            P_LED_SEG5_CLR;
            P_LED_SEG5_OUTPUT;
        }
        break;

    case 17:
        if (displayHundred & SEG_E) // 1E wireless
        {
            P_LED_SEG2_SET;
            P_LED_SEG2_OUTPUT;
            P_LED_SEG5_CLR;
            P_LED_SEG5_OUTPUT;
        }
        break;

    default:
        break;
    }
    indexScan++; //! 1ms 调用一次
#if 0
   
    if (0 == forceDispTimer)
    {
        if (displayHundred & SEG_B) // 100
        {
            if (indexScan == 6) // 3G
            {
                indexScan++;
            }

            if (indexScan == 13) // 2G
            {
                indexScan++;
            }
        }
        else
        {
            if (indexScan == 14) // 1B
            {
                indexScan++;
                indexScan++; // 1C
            }
            // if (indexScan == 15)  //1C
            // {
            //     indexScan++;
            // }
        }
    }
#endif
    if (indexScan > 17) //
    {
        indexScan = 0;
    }
}

// bms
// NOP()
void io_uart_tx(unsigned char sendByte)
{

    unsigned char bCount;

    bCount = 8;
    DISI(); // GIE = 0;
    P_IO_UART_TX_OUTPUT;
    P_IO_UART_TX_CLR; // 输出高
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();

    while (bCount)
    {
        if (sendByte & 0x01)
        {
            P_IO_UART_TX_SET; // 输出高
            NOP();
            NOP();
        }
        else
        {
            P_IO_UART_TX_CLR; // 输出低
            NOP();
            NOP();
            NOP();
            NOP();
            NOP();
        }
        bCount--;
        sendByte >>= 1;
    }

    NOP();
    P_IO_UART_TX_SET; // 输出高
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    NOP();
    ENI(); // GIE = 1;
}

KEY_EVENT gpioKeyScan(void)
{
    P_KEY_INPUT;
    _dly_us(5);
    if (gpioKeyWaitTimer)
    {
        gpioKeyWaitTimer--;
    }

    indexKey = 0;

    if (P_KEY)
    {
        indexKey = 1;
        P_KEY_IPS_SET;
        P_KEY_IPS_INPUT;
    }

    switch (gpioKeyState)
    {
    case GPIO_KEY_STATE_IDLE:
        if (indexKey)
        {
            // bFlag_wakeup_4sleep = 0;
            return MSG_NONE;
        }

        // PreKeyIndex = indexKey;
        // timer_set(&gpioKeyWaitTimer, GPIO_KEY_JTTER_TIME);
        gpioKeyWaitTimer = GPIO_KEY_JTTER_TIME; // gSysTick_current;
        // DBG(("GOTO JITTER!\n"));
        // io_uart_tx(0x71);
        gpioKeyState = GPIO_KEY_STATE_JITTER;

    case GPIO_KEY_STATE_JITTER:
        if (indexKey) // if(PreKeyIndex != indexKey)
        {
            // DBG(("GOTO IDLE Because jitter!\n"));
            // io_uart_tx(0x72);
            gpioKeyState = GPIO_KEY_STATE_IDLE;
        }
        // else if(timer_expired(&gpioKeyWaitTimer))
        else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_JTTER_TIME)
        {
            // DBG(("GOTO PRESS_DOWN!\n"));
            // P_KEY_OUT = 0;
            // UARTSendDataByte(0xA1);
            // timer_set(&gpioKeyWaitTimer, GPIO_KEY_CP_TIME);
            // io_uart_tx(0x73);
            gpioKeyWaitTimer = GPIO_KEY_CP_TIME; // gSysTick_current;
            gpioKeyState = GPIO_KEY_STATE_PRESS_DOWN;
            P_KEY_IPS_CLR;
            P_KEY_IPS_OUTPUT;
            // return MSG_NONE;//GpioKeyEvent[PreKeyIndex][0];//PDS(鎸夐敭寮濮?
        }

        break;

    case GPIO_KEY_STATE_PRESS_DOWN: // short key
        if (indexKey)               // if(PreKeyIndex != indexKey)
        {
            // short key
            //  DBG(("ADC KEY SP!*****\n"));
            // io_uart_tx(0x74);
            gpioKeyState = GPIO_KEY_STATE_IDLE;

            return MSG_MODE; // GpioKeyEvent[PreKeyIndex][1]; //SPR
        }
        // else if(timer_expired(&gpioKeyWaitTimer))
        else if (!gpioKeyWaitTimer) // if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_CP_TIME)
        {

            // long key press
            // io_uart_tx(0x75);
            // DBG(("ADC KEY CP!********\n"));
            // timer_set(&gpioKeyWaitTimer, GPIO_KEY_CPH_TIME);
            // tune up gpioKeyWaitTimer = GPIO_KEY_CPH_TIME;//gSysTick_current;
            gpioKeyState = GPIO_KEY_STATE_CP;
            // bFlag_send_cmd_left = 1;
            // bFlag_enable_get_0x1bcmd = 1;
            // indicator_light_mode = 3; // 白灯
            // always_light_timer_shadow = 0;
            // enable_breathing_mode();
            // dispTimerForce = 10; // 强制显示
            // set_cmd_left(CMD_IN_PAIRING_MODE);
            // set_cmd_left(CMD_IN_PAIRING_MODE);
            // set_cmd_left(CMD_IN_PAIRING_MODE);
            //! close motor
            //! test if (bFlag_motor_plugin)
            // {
            //     motor_close();
            // }
            return MSG_POWER_ON; // GpioKeyEvent[PreKeyIndex][2];  //CPS
        }

        break;

    case GPIO_KEY_STATE_CP:
        if (indexKey) // if(PreKeyIndex != indexKey)
        {
            // DBG(("ADC KEY CPR!*************\n"));
            // UARTSendDataByte(0xA4);
            // P_LED_R_OFF;
            // io_uart_tx(0x76);
            gpioKeyState = GPIO_KEY_STATE_IDLE;
            // return MSG_NONE;//GpioKeyEvent[PreKeyIndex][4]; //CPR
        }

        // else if(timer_expired(&gpioKeyWaitTimer))
        // tune up
        /*else if(!gpioKeyWaitTimer)//if(gSysTick_current - gpioKeyWaitTimer > GPIO_KEY_CPH_TIME)
        {
            //DBG(("ADC KEY CPH!*************\n"));
            //timer_set(&gpioKeyWaitTimer, GPIO_KEY_CPH_TIME);
            gpioKeyWaitTimer = GPIO_KEY_CPH_TIME;//gSysTick_current;
            return MSG_NONE;//GpioKeyEvent[PreKeyIndex][3]; // CPH
        }*/

        break;

    default:
        gpioKeyState = GPIO_KEY_STATE_IDLE;
        break;
    }

    return MSG_NONE;
}

//-----------------------------------------------------------------------------------------
//! OK
void i2c_start(void)
{
    P_I2C_SDA_SET;
    P_I2C_SCL_SET;
    P_I2C_SDA_OUTPUT;
    P_I2C_SCL_OUTPUT;
    _dly_us(10);
    P_I2C_SDA_CLR;
    _dly_us(10);
    P_I2C_SCL_CLR;
}

//! OK
void i2c_stop(void)
{
    P_I2C_SCL_CLR;
    P_I2C_SDA_CLR;
    _dly_us(10);
    P_I2C_SCL_SET;
    _dly_us(10);
    P_I2C_SDA_SET;
}

//! ok
unsigned char i2c_chk_ack(void)
{

    P_I2C_SCL_CLR;                                  // slave send ACK
    P_I2C_SDA_INPUT;                                // Allow slave to send ACK
    unsigned char getAckTime = CONST_TIMER_GET_ACK; // 返回ACK信号延时等待时间
    _dly_us(0);
    P_I2C_SCL_SET;
    _dly_us(0);
    while (P_I2C_SDA)
    {
        --getAckTime;

        if (0 == getAckTime)
        {
            return 1;
        }
    }

    P_I2C_SCL_CLR;
    P_I2C_SDA_OUTPUT;
    return 0;
}
//! OK 产生ACK应答
void i2c_send_ack(void)
{
    P_I2C_SCL_CLR;
    P_I2C_SDA_CLR;
    _dly_us(10);
    P_I2C_SCL_SET;
    _dly_us(10);
    P_I2C_SCL_CLR;
    P_I2C_SDA_CLR;
}
//! OK
void i2c_send_nack(void)
{
    P_I2C_SCL_CLR;
    P_I2C_SDA_SET;
    _dly_us(10);
    P_I2C_SCL_SET;
    _dly_us(10);
    P_I2C_SCL_CLR;
    P_I2C_SDA_CLR;
}
//! OK
unsigned char i2c_writeByte(unsigned char sendByte)
{
    unsigned char i = 8;

    while (i--) // I2C_SDA脚从高位至低位发送数据
    {
        P_I2C_SCL_CLR; // 拉低I2C_SCL,以允许I2C_SDA脚w位数据发生变化
        _dly_us(0);
        if (sendByte & 0x80) /* MSB output first */
        {
            P_I2C_SDA_SET;
        }
        else
        {
            P_I2C_SDA_CLR;
        }
        sendByte <<= 1;
        P_I2C_SCL_SET; // 拉高I2C_SCL
        _dly_us(0);
        NOP();
    }

    return i2c_chk_ack();
}
// OK
unsigned char i2c_readByte(void)
{
    unsigned char i = 8;
    unsigned char readByte = 0;

    P_I2C_SCL_CLR;   // 拉低I2C_SCL
    P_I2C_SDA_INPUT; // 设置I2C_SDA为输入

    while (i--)
    {
        // _dly_us(10);
        P_I2C_SCL_SET; // 拉高I2C_SCL
        _dly_us(0);
        readByte <<= 1;

        if (P_I2C_SDA)
        {
            readByte |= 0x01;
        }

        P_I2C_SCL_CLR; // 拉低I2C_SCL
        _dly_us(0);
    }

    // _dly_us(10);
    P_I2C_SDA_OUTPUT; // 设置I2C_SDA为输出
    return readByte;  // 返回数据
}

BOOL ip53xs_writeByte(unsigned char deviceAddr, unsigned char regAddr, unsigned char sendByte)
{
    if (P_I2C_INT)
    {
        i2c_start();

        if (i2c_writeByte(deviceAddr | IIC_WRITE))
        {
            i2c_stop();
            return FALSE;
        }

        if (i2c_writeByte(regAddr))
        {
            i2c_stop();
            return FALSE;
        }

        if (i2c_writeByte(sendByte))
        {
            i2c_stop();
            return FALSE;
        }

        i2c_stop();
    }

    return TRUE;
}

unsigned char ip53xs_readByte(unsigned char deviceAddr, unsigned char regAddr) //(unsigned char regAddr)
{
    unsigned char readByte = 0;
    if (P_I2C_INT)
    {
        i2c_start();

        if (i2c_writeByte(deviceAddr | IIC_WRITE))
        {
            i2c_stop();
            return FALSE;
        }

        if (i2c_writeByte(regAddr))
        {
            i2c_stop();
            return FALSE;
        }

        i2c_start();

        if (i2c_writeByte(deviceAddr | IIC_READ))
        {
            i2c_stop();
            return FALSE;
        }

        readByte = i2c_readByte();
        i2c_send_nack();
        i2c_stop();
    }

    return readByte;
}

BOOL ip55xs_write4Bytes(unsigned int regAddr, unsigned char *pdata)
{
    unsigned char reg_ip55xs;
    unsigned char timer_out;
    // pdata = IP_DATA;
    ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
    ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
    ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x55);
    ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x55);
    timer_out = 100;
    reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
    // if (0xAA != reg_ip55xs)
    do
    {
        if (timer_out)
        {
            timer_out--;
        }
        else
        {
            return FALSE;
        }
    } while (0xAA != reg_ip55xs);
    ip53xs_writeByte(0xEA, 0x10, *pdata); // DATA0
    pdata++;
    ip53xs_writeByte(0xEA, 0x11, *pdata); // DATA1

    ip53xs_writeByte(0xEA, 0x12, 0x66);

    ip53xs_writeByte(0xEA, 0x13, 0x66);
    timer_out = 100;
    reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
    // if (0x55 != reg_ip55xs) //! if (0xAA != reg_ip55xs)
    do
    {
        if (timer_out)
        {
            timer_out--;
        }
        else
        {
            return FALSE;
        }
    } while (0x55 != reg_ip55xs);

    pdata++;
    ip53xs_writeByte(0xEA, 0x10, *pdata); // DATA2
    pdata++;
    ip53xs_writeByte(0xEA, 0x11, *pdata); // DATA3
    ip53xs_writeByte(0xEA, 0x12, 0x77);

    ip53xs_writeByte(0xEA, 0x13, 0x77);
    timer_out = 100;
    reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
    // if (0xFF != reg_ip55xs)
    do
    {
        if (timer_out)
        {
            timer_out--;
        }
        else
        {
            return FALSE;
        }
    } while (0xFF != reg_ip55xs);
    return TRUE;
}

BOOL ip55xs_read4Bytes(/*unsigned char deviceAddr,*/ unsigned int regAddr) //(unsigned char regAddr)
{
    // unsigned char readByte = 0;

    unsigned char reg_ip55xs;
    unsigned char timer_out;
    ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
    ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
    ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x11);
    ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x11);
    timer_out = 100;

    // if (0xAA != reg_ip55xs)
    do
    {
        reg_ip55xs = ip53xs_readByte(0xEA, 0x00);
        if (0 == timer_out)
        {
            return FALSE;
        }
        else
        {

            timer_out--;
        }
    } while (0xAA != reg_ip55xs);
    IP_DATA[0] = ip53xs_readByte(0xEA, 0x0C);
    IP_DATA[1] = ip53xs_readByte(0xEA, 0x0D);
    IP_DATA[2] = ip53xs_readByte(0xEA, 0x0E);
    IP_DATA[3] = ip53xs_readByte(0xEA, 0x0F);
    ip53xs_writeByte(0xEA, 0x10, (unsigned char)regAddr);        // ADDR_L
    ip53xs_writeByte(0xEA, 0x11, (unsigned char)(regAddr >> 8)); // ADDR_H
    ip53xs_writeByte(0xEA, 0x12, (unsigned char)0x22);
    ip53xs_writeByte(0xEA, 0x13, (unsigned char)0x22);
    return TRUE;
}

void init_ip53xs(void)
{

    // 0X400000C0[26]=0和0X400000C0[24]=0
    // 对应的寄存器应该是0X00C0
    // 你转换试下吧
    // 刚才是不能充15的
    // 你初始化配置这两个bit后再试下
    // 0X00C0的bit24和26都配置为0

    ip55xs_read4Bytes(0X00C0);
    // IP_DATA[3] |= (BIT2 | BIT0); // bit24,bit26
    IP_DATA[3] &= ~(BIT2); // bit24,bit26
    IP_DATA[3] &= ~(BIT0);
    ip55xs_write4Bytes(0X00C0, IP_DATA);
}

#define CONST_P_VIN_FILTER 31
void get_p_ext_int_status(void)
{
    static unsigned char counter;

    if (bFlag_p_ext_int_is_high)
    {
        if (!P_I2C_INT)
        {
            if (++counter > CONST_P_VIN_FILTER)
            {
                counter = 0;
                bFlag_p_ext_int_is_high = 0;
                bFlag_charger_on = 0; //! 放电
                // io_uart_tx(0x22);
                // io_uart_tx(0x22);
                // bFlag_init_ip53xs = 1;
                // bFlag_charger_on = 0;
                // displayData = 0x00; // SEG_ALL_OFF;
                // ledDispTimer = 0;
                // bFlag_all_led_is_off = 1;
                // if (delaySleepTimer > 1)
                // {
                //     delaySleepTimer = 1;
                // }
            }
        }
        else
        {
            counter = 0;
        }
    }
    else
    {
        if (P_I2C_INT)
        {
            if (++counter > CONST_P_VIN_FILTER)
            {
                counter = 0;
                bFlag_p_ext_int_is_high = 1;
                // io_uart_tx(0x11);
                // io_uart_tx(0x11);
                ip55xs_read4Bytes(0X00C0);
                // IP_DATA[3] |= (BIT2 | BIT0); // bit24,bit26
                IP_DATA[3] &= ~(BIT2); // bit24,bit26
                IP_DATA[3] &= ~(BIT0);
                ip55xs_write4Bytes(0X00C0, IP_DATA);
                delaySleepTimer = CNST_TIMER_DLY_SLP;
                // init_ip53xs();
            }
        }
        else
        {
            counter = 0;
        }
    }
}
//! 充电状态标志位： 0X1090[11]=1
// 充满标志位： 0X1090[14:12]=101
// 充电电压判断： 0X1090[5:4]
// B 口 VIN 充电判断：0X1090[6]=1
// C 口 VBUS 充电判断：0X1090[7]=1
// 充电输入电流：读 0x1034[13:0]
// 充电电池电流：读 0x1028[29:16]
//! 边充边放标志位：0X1090[31]=1
//! 升压输出标志位：0X1090[19]=1
// A1（VOUT1）口输出打开标志位：0X1090[28]=1
// A2（VOUT2）口输出打开标志位：0X1090[29]=1
// C（VBUS）口输出打开标志位：0X1090[30]=1
// 升压输出电压：读 0x102C[14:0]
// 升压输出总电流：读 0x102C[29:16]
// A1（VOUT1）口输出电流：读 0x1038[13:0]
// A2（VOUT2）口输出电流：读 0x1038[29:16]
// C（VBUS）口输出电流：读 0x1034[29:16
void is_chg_or_dischg(void)
{

    unsigned char reg_ip53xs;
    static unsigned char counter;

    ip55xs_read4Bytes(0X1090);
    // reg_ip53xs = (IP_DATA[0] & BIT3);
    // io_uart_tx(0x33);
    // io_uart_tx(IP_DATA[0]);
    // io_uart_tx(IP_DATA[1]);
    // io_uart_tx(IP_DATA[2]);
    // io_uart_tx(IP_DATA[3]);
    // io_uart_tx(0x33);
    bFlag_qc_ok = 0;

    if (bFlag_charger_on) //! 在充电状态下
    {
        delaySleepTimer = CONST_DSL_SHORT; //! 防止充电状态MCU关5356

        reg_ip53xs = (IP_DATA[2] & BIT3); // bit19
        if (reg_ip53xs)
        {
            // io_uart_tx(0xDD);
            // io_uart_tx(0xDD);
            bFlag_chg_or_dischg = 0;
            if (++counter > 5) // CNST_FILTER_COM
            {
                counter = 0;
                bFlag_charger_on = 0; //! 放电
                disable_breathing_mode();
            }
        }
        else
        {
            counter = 0;
            // bit15 ==1
            if (IP_DATA[1] & BIT7)
            {
                bFlag_qc_ok = 1;
            }
            bFlag_chg_or_dischg = 1;
        }
#ifdef IPC_FUNC
        get_input_voltage_status();
#endif
    }
    else // 在放电状态下
    {
        reg_ip53xs = (IP_DATA[1] & BIT3); // bit11
        if (reg_ip53xs)
        {
            bFlag_chg_or_dischg = 1;
            if (++counter > CNST_FILTER_COM) // 2次
            {
                counter = 0;
                bFlag_charger_on = 1; //! 充电
                if (displayData < 100)
                {
                    enable_breathing_mode();
                }
                forceDispTimer = 10;
            }
        }
        else
        {
            counter = 0;
            bFlag_chg_or_dischg = 0;
            if (IP_DATA[3] & BIT3)
            {
                bFlag_qc_ok = 1;
            }
            // if (0 == bFlag_light_load) //! 非轻载
            if ((IP_DATA[2] & BIT3)) // bit19
            {
                displayTimer = CONST_TIMER_DISP_XSEC; //! 电量==0的时候 闪烁5秒后熄灭,反之一直显示
                // io_uart_tx(0xCC);
                // io_uart_tx(0xCC);
            }
            else
            { //! 轻载

                // if (bFlag_typec_in) //! 解决 typeC to lightning  线在 不需要小电流模式 也不需要轻载关机  但不能解决 C口轻载两分钟会关输出，有协议时 规格书要求C口 只灭灯不关输出
                // {
                //     delaySleepTimer = CNST_TIMER_DLY_SLP; //! C口轻载只要关灯 不需要120秒后关机 也不需要小电流模式
                // }
            }
        }
    }
}
void get_cap(void)
{
    // 0x10C0 [7:0]
    ip55xs_read4Bytes(0x10C0);
    displayData = IP_DATA[0];
    // io_uart_tx(0x66);
    // io_uart_tx(displayData);
    // io_uart_tx(0x66);
}
// app_display_all
void app_display_all(void) // 500ms ONE  time
{
    unsigned char i, j;
    // bFlag_disp_timer = 0;

    if (forceDispTimer)
    {
        forceDispTimer--;
        displayHundred = DispTable[1];

        displayHundred |= (SEG_E | SEG_D);
        displayDecade = DispTable[8];
        displayDigit = DispTable[8];

        if (!forceDispTimer)
        {
            displayHundred = DISP_ALL_OFF;
            displayDecade = DISP_ALL_OFF;
            displayDigit = DISP_ALL_OFF;
        }
    }

    //--------------------------------------------------------------------------//充电显示部分
    else if (bFlag_charger_on) // bFlag_charger_nbFlag_vin_plug_in
    {
        underVoltageDispTimer = 0;

        displayTimer = CONST_TIMER_DISP; // 拨出显示5秒

        if (displayData < 100) // 充电
        {
            displayHundred = DISP_ALL_OFF;
            if (bFlag_qc_ok)
            {
                displayHundred |= SEG_D;
            }

            if (bFlag_blink)
            {
                i = displayData / 10;
                j = displayData % 10;
                displayDecade = DISP_ALL_OFF;

                if (i) // 十位是0 不显示
                {
                    displayDecade = DispTable[i];
                }

                displayDigit = DispTable[j];
            }
            else
            {
                displayDigit = DISP_ALL_OFF; // 个位闪烁 充电
            }
        }
        else // 充满
        {
            disable_breathing_mode();
            P_LED_G_ON;
            displayHundred = DispTable[1];
            if (bFlag_qc_ok)
            {
                displayHundred |= SEG_D;
            }
            displayDecade = DispTable[0];
            displayDigit = DispTable[0];
        }
    }

    //--------------------------------------------------------------------------以下为放电部分显示
    else
    {
        if (underVoltageDispTimer) // 欠压关机显示
        {
            underVoltageDispTimer--;
            displayTimer = 0;
            displayHundred = DISP_ALL_OFF;
            if (bFlag_qc_ok)
            {
                displayHundred |= SEG_D;
            }

            // if (bFlag_power_on)
            // {
            //     gBatteryCapacity = (unsigned long)0; // 这里有风险吗
            //     bFlag_Chargering_From_Empty = 1;
            // }

            if (underVoltageDispTimer % 2)
            {
                i = displayData / 10;
                j = displayData % 10;

                if (i)
                {
                    displayDecade = DispTable[i];
                }
                else
                {
                    displayDecade = DISP_ALL_OFF;
                }

                displayDigit = DispTable[j];
            }
            else
            {
                if (0 == displayData)
                {
                    displayDigit = DISP_ALL_OFF;
                }
            }

            if (0 == underVoltageDispTimer)
            {
                if (displayData)
                {
                    displayData--;
                    underVoltageDispTimer = (CONST_TIMER_DISP_UV - 1);
                }
            }
        }
        else if (displayTimer)
        {
            displayHundred = DISP_ALL_OFF;

            displayTimer--;
            // io_uart_tx(0xCC);
            // io_uart_tx(displayTimer);
            // io_uart_tx(0xCC);

            if (displayData < 100)
            {
                displayHundred = DISP_ALL_OFF;
                if (bFlag_qc_ok)
                {
                    displayHundred |= SEG_D;
                }

                if (bFlag_blink)
                {
                    i = displayData / 10;
                    j = displayData % 10;

                    if (i)
                    {
                        displayDecade = DispTable[i];
                    }
                    else
                    {
                        displayDecade = DISP_ALL_OFF;
                    }

                    displayDigit = DispTable[j];
                }
                else
                {

                    if (0 == displayData)
                    {
                        displayDigit = DISP_ALL_OFF;
                    }
                }
            }
            else
            {
                displayHundred = DispTable[1];
                if (bFlag_qc_ok)
                {
                    displayHundred |= SEG_D;
                }
                displayDecade = DispTable[0];
                displayDigit = DispTable[0];
            }
        }
        else
        {
            displayHundred = DISP_ALL_OFF;
            displayDecade = DISP_ALL_OFF;
            displayDigit = DISP_ALL_OFF;
        }
    }
}

// INT KEY—MCU
// void enterSleepMode(void)
// {
//     AWUCON = 0x00; // Disable PA input change wakeup function
//     // A. Normal mode into Halt mode. While PB1 input change then wakeup and set PB2 outputs low
//     UPDATE_REG(PORTB);  // Read PORTB Data buffer
//     INTF = 0x00;        // Clear all interrupt flags
//     PCONbits.WDTEN = 0; // Disable WDT
//     // choice one way to enter Halt mode
//     SLEEP(); // 1. Execute instruction to enters Halt mode (from Normal mode)
//     // OSCCR = HALT_MODE | FHOSC_SEL     // 2. Set OSCCR register to enters Halt mode (from Normal mode)
//     PCONbits.WDTEN = 1; // Enable WDT
//     PORTBbits.PB3 = 0;  // while wakeup from Halt mode then set PB3 outputs low
//     INTFbits.PABIF = 0; // Clear PABIF(PortB input change interrupt flag bit)

//     // B. Normal mode into standby mode. While PB1 input change then wakeup and set PB2 outputs high
//     UPDATE_REG(PORTB);                    // Read PORTB Data buffer
//     INTF = 0x00;                          // Clear all interrupt flags
//     PCONbits.WDTEN = 0;                   // Disable WDT
//     OSCCR = C_Standby_Mode | C_FHOSC_Sel; // set OSCCR register to enters Standby mode (from Normal mode)
//     PCONbits.WDTEN = 1;                   // Enable WDT
//     PORTBbits.PB3 = 1;                    // while wakeup from Standby mode then set PB3 outputs high
//     INTFbits.PABIF = 0;                   // Clear PABIF(PortB input change interrupt flag bit)
// }
// end

void main(void)
{
    DISI();
    // Initial GPIO
    BPHCON = (unsigned char)~C_PB0_PHB; // Enable PB1 Pull-High resistor
    BWUCON = C_PB0_Wakeup;              // Enable PB1 input change wakeup function

    IOSTA = 0xFF;
    IOSTB = 0xFF;
    // IOSTB = C_PB0_Input;                // Set PB1 to input mode,others set to output mode
    PORTA = 0x00; // PORTB data buffer=0x00
    PORTB = 0x00;
    // Initial Interrupt Setting
    // INTE = C_INT_PABKey; // Enable PortB input change interrupt
    // INTF = 0x00;         // Clear all interrupt flags

    // Normal mode into Slow mode
    OSCCR = C_FLOSC_Sel; // OSCCR[0]=0 , FOSC is Low-frequency oscillation (FLOSC)

    // Slow mode into Normal mode
    OSCCR = C_FHOSC_Sel; // OSCCR[0]=1 , FOSC is high-frequency oscillation (FHOSC)

    // Chioce while wakeup from Halt mode or Standby mode,the procedure will enter
    // interrupt service routine or not.
    // ENI();                                // 1. Enable all unmasked interrupts.
    // 2. After wakeup frorm Halt mode or
    //    Standby mode, the procedure will
    //    enter interrupt service routine

    // DISI(); // 1. Disable all interrupts.
    //  2. After wakeup frorm Halt mode or
    //     Standby mode. The procedure will
    //     not enter interrupt service routine

    // add
    PCON1 = 0x00; // Disable Timer0
    // TMR0 = CONST_TIMER_34P8;                                       // Load 0x00 to TMR0 (Initial Timer0 register)
    // T0MD = 0x00;
    T0MD = 0x0F; // 8M,2T  Prescaler0 to wdt,
    // T0MD = 0x08;  //4M,2T  125us
    // T0MD = 0x00;                                    // 4M,2T// Prescaler0 is assigned to Timer0, Prescaler0 dividing rate = 1:2,clock source is instruction clock
    // T0MD = 0x08;//C_PS0_WDT     2M,2T             // Prescaler0 is assigned to WDT, Prescaler0 dividing rate = 1:2 (WDT select interrupt)
    // init_cmdQueueArray();
    // io_uart_rx.CNT = 2;
    // UART_INIT();
    // GpioKeyInit();
    // Setting Interrupt Enable Register
    INTE = 0x01; // Timer0 overflow interrupt enable bit

    // Initial Power control register
    PCON = 0xC8; //  C_WDT_En | C_LVR_En;                // Enable WDT ,  Enable LVR
    //;Enable Timer0 & Global interrupt bit
    PCON1 = 0x01; //  C_TMR0_En;                          // Enable Timer0
    ENI();

    delaySleepTimer = CONST_DELAY_SLEEP_TIME;
    bFlag_power_on = 1;

    // end

    // PORTBbits.PB3 = 1; // Set PB3 outputs high
    forceDispTimer = 20;
    P_LED_R_OUTPUT;
    P_LED_R_OFF;
    P_LED_G_OUTPUT;
    P_LED_G_OFF;
    P_LED_B_OUTPUT;
    P_LED_B_OFF;

    displayTimer = CONST_TIMER_DISP;
    // io_uart_tx(0x11);
    // io_uart_tx(0x22);
    // io_uart_tx(0x33);

    while (TRUE)
    {
        CLRWDT();
        if (bFlag_gSysTick_Change)
        {
            bFlag_gSysTick_Change = 0;
            if (bFlag_slice_16ms)
            {

                bFlag_slice_16ms = 0;
                timer_slice_16ms++;
                gpioKeyScan();
                get_p_ext_int_status();
                if (bFlag_p_ext_int_is_high)
                {
                    is_chg_or_dischg();
                }

                if (!(timer_slice_16ms & 0x1F))
                {
                    bFlag_blink ^= 1;
                    // io_uart_tx(0x55);
                    // io_uart_tx(0x55);
                    // io_uart_tx(0x55);
                    // P_LED_G ^= 1; //!实测 520ms
                    if (bFlag_p_ext_int_is_high)
                    {
                        get_cap();
                    }
                    app_display_all();
                }
                if (!(timer_slice_16ms & 0x3F))
                {
                    // P_LED_G ^= 1; //! 实测 1.03sec
#if 1

                    if ((0 == bFlag_charger_on) && (!P_I2C_INT))
                    {
                        // io_uart_tx(0xAA);
                        // io_uart_tx(delaySleepTimer);
                        // io_uart_tx(0xAA);
                        if (!delaySleepTimer)
                        {
                            // RB2 RA1 --> wake up
                            // io_uart_tx(0x33);
                            // io_uart_tx(0x22);
                            // io_uart_tx(0x11);
                            DISI();
                            CLRWDT();
                            INTE = 0x00;  // Timer0 overflow interrupt enable bit
                            PCON = 0x58;  // PCON = 0xC8;
                            PCON1 = 0x00; // Disable Timer0
                            // BPHCON = (unsigned char)~C_PB1_PHB;     // Enable PB1 Pull-High resistor
                            // BWUCON = C_PB1_Wakeup;                    // Enable PB1 input change wakeup function
                            // IOSTB  = C_PB1_Input;                 // Set PB1 to input mode,others set to output mode
                            // PORTB  = 0;                               // PORTB data buffer=0x00
                            // init_gpio();
                            // APHCON = 0xBF; //(unsigned char)(~C_PA7_PHB);
                            // BPHCON = 0xEF;
                            PORTA = 0x00;
                            PORTB = 0x00;
                            IOSTA = 0x00;
                            IOSTB = 0x00;
                            P_KEY_INPUT;
                            P_KEY_IPS_INPUT;
                            // IOSTA = 0x73; // PA5 Input <-- Set PA5 to open drain output
                            // IOSTB = 0xF0; // PB5 output PB4 Input
                            // APHCON = 0xBF; //(unsigned char)(~C_PA7_PHB);
                            // BPHCON = 0xEF;
                            // BODCON = 0x00; // PB4 open-drain

                            // P_LED_R_OFF;
                            // P_LED_G_OFF;
                            // P_LED_B_OFF;
                            // P_LED_R_OUTPUT;
                            // P_LED_G_OUTPUT;
                            // P_LED_B_OUTPUT;
                            // P_LED_SEG1_CLR;
                            // P_LED_SEG2_CLR;
                            // P_LED_SEG3_CLR;
                            // P_LED_SEG4_CLR;
                            // P_LED_SEG5_CLR;
                            // P_LED_SEG1_OUTPUT;
                            // P_LED_SEG2_OUTPUT;
                            // P_LED_SEG3_OUTPUT;
                            // P_LED_SEG4_OUTPUT;
                            // P_LED_SEG5_OUTPUT;
                            AWUCON = (C_PA2_Wakeup); // OK
                            BWUCON = C_PB0_Wakeup;   // OK
                            // Initial Interrupt Setting
                            INTE = C_INT_PABKey; // Enable PortB input change interrupt
                            INTF = 0;
                            // ADMD  =   C_ADC_CH_Dis | C_Quarter_VDD ;
                            // ADMDbits.GCHS = 0;                              // disable global ADC channel    (SFR "ADMD")
                            //                        bFlag_display_always = 0;
                            //                        bFlag_display_flash = 0;
                            //                        bFlag_display_flash_green = 0;
                            if (!P_KEY)
                            {
                                goto skip_sleep;
                            }
                            UPDATE_REG(PORTB);
                            UPDATE_REG(PORTA);
                            NOP();
                            SLEEP();
                            NOP();
                        skip_sleep:
                            INTFbits.PABIF = 0;
                            // INTFbits.PAIF = 0;
                            // OSCCR = C_Standby_Mode | C_FHOSC_Sel;
                            //-------------------------------休眠-----------------------------------//
                            delaySleepTimer = CONST_DELAY_SLEEP_TIME;
                            // if(!P_KEY_POWER)
                            //{
                            // dispTimer = LED_DISP_TIME;
                            // }
                            //! FUCK PCON = 0x98;
                            PCON = 0xC8;
                            // CMPCR = C_RBias_High_Dis | C_RBias_Low_Dis | C_CMPFINV_Dis | 0x0A; // initial SFR CMPCR (CMPF_INV=0) measure LVD_L
                            // PCON = 0xFC;
                            // PCONbits.LVDEN = 1;
                            // PCON1 &= 0xC3;
                            // if (bFlag_bat_low)
                            // {
                            //     PCON1 |= C_LVD_3P15V;
                            // }
                            // else
                            // {
                            //     PCON1 |= C_LVD_3P45V; // Set LVDS[3:0]=0101b (2.8V) , Timer0 disable
                            // }
                            PCON1 |= C_TMR0_En;            // Enable Timer0
                            INTE = (0x01 /*| C_INT_LVD*/); // Timer0 overflow interrupt enable bit
                            ENI();
                        }
                        else
                        {
                            delaySleepTimer--;
                        }
                    }

#endif
                }
            }
        }
    }
}
