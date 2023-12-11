#ifndef __APP_CFG_H_
#define __APP_CFG_H_

#define BREATH_LED_MODE

#define CONST_TIMER_DISP                (20)
#define CONST_TIMER_DISP_UV             (11)
#define DISP_ALL_OFF                    (0U)
#define CONST_DSL_SHORT                 (3)
#define CNST_FILTER_COM                 (2)
#define CONST_TIMER_DISP_XSEC           (10)
#define CNST_TIMER_DLY_SLP              (20)        // 120sec 5356 才能休眠

#ifndef TRUE
#define TRUE        (1)
#endif

#ifndef FALSE
#define FALSE       (0)
#endif


#define BIT0        (0x01)
#define BIT1        (0x02)
#define BIT2        (0x04)
#define BIT3        (0x08)
#define BIT4        (0x10)
#define BIT5        (0x20)
#define BIT6        (0x40)
#define BIT7        (0x80)

#define SEG_A               (0x01)
#define SEG_B               (0x02)
#define SEG_C               (0x04)
#define SEG_D               (0x08)
#define SEG_E               (0x10)
#define SEG_F               (0x20)
#define SEG_G               (0x40)
// #define SEG_H               (0x80)


#define  RA0        (PORTAbits.PA0)
#define  RA1        (PORTAbits.PA1)
#define  RA2        (PORTAbits.PA2)
#define  RA3        (PORTAbits.PA3)
#define  RA4        (PORTAbits.PA4)
#define  RA5        (PORTAbits.PA5)
#define  RA6        (PORTAbits.PA6)
#define  RA7        (PORTAbits.PA7)

#define  RB0        PORTBbits.PB0
#define  RB1        PORTBbits.PB1
#define  RB2        PORTBbits.PB2
#define  RB3        PORTBbits.PB3
#define  RB4        PORTBbits.PB4
#define  RB5        PORTBbits.PB5
#define  RB6        PORTBbits.PB6
#define  RB7        PORTBbits.PB7

#define TM1IE       INTEbits.T1IE
#define TM0IE       INTEbits.T0IE
#define RBIE        INTEbits.PBIE

#define RABIF       INTFbits.PABIF
#define TM1IF       INTFbits.T1IF
#define TM0IF       INTFbits.T0IF

//!--- PIN1
//PB4 PWM1
#define P_LED_R                     RB4
#define P_LED_R_CLR                 P_LED_R = 0
#define P_LED_R_SET                 P_LED_R = 1
#define P_LED_R_OUTPUT              IOSTB &= (~BIT4)
#define P_LED_R_INPUT               IOSTB |= (BIT4)

#define P_LED_R_OFF                 P_LED_R_CLR
#define P_LED_R_ON                  P_LED_R_SET

//! PIN2
// PB5 SEG1
#define P_LED_SEG1                   RB5
#define P_LED_SEG1_CLR               P_LED_SEG1 = 0
#define P_LED_SEG1_SET               P_LED_SEG1 = 1
#define P_LED_SEG1_OUTPUT            IOSTB &= (~BIT5)
#define P_LED_SEG1_INPUT             IOSTB |= (BIT5)



//! pin3 
// PA0 SEG2
#define P_LED_SEG2                   RA0
#define P_LED_SEG2_CLR               P_LED_SEG2 = 0
#define P_LED_SEG2_SET               P_LED_SEG2 = 1
#define P_LED_SEG2_OUTPUT            IOSTA &= (~BIT0)
#define P_LED_SEG2_INPUT             IOSTA |= (BIT0)

//! PIN4
//RA1    SEG3
#define P_LED_SEG3                   RA1
#define P_LED_SEG3_CLR               P_LED_SEG3 = 0
#define P_LED_SEG3_SET               P_LED_SEG3 = 1
#define P_LED_SEG3_OUTPUT            IOSTA &= (~BIT1)
#define P_LED_SEG3_INPUT             IOSTA |= (BIT1)


//!PIN5
//VDD


//!PIN6
//RA7 SEG4
#define P_LED_SEG4                   RA7
#define P_LED_SEG4_CLR               P_LED_SEG4 = 0
#define P_LED_SEG4_SET               P_LED_SEG4 = 1
#define P_LED_SEG4_OUTPUT            IOSTA &= (~BIT7)
#define P_LED_SEG4_INPUT             IOSTA |= (BIT7)






//!PIN7
//RA6 SEG5
#define P_LED_SEG5                   RA6
#define P_LED_SEG5_CLR               P_LED_SEG5 = 0
#define P_LED_SEG5_SET               P_LED_SEG5 = 1
#define P_LED_SEG5_OUTPUT            IOSTA &= (~BIT6)
#define P_LED_SEG5_INPUT             IOSTA |= (BIT6)

//!PIN8
// RA5 NC
// #define P_TEST                       RA5
// #define P_TEST_CLR               P_TEST = 0
// #define P_TEST_SET               P_TEST = 1
// #define P_TEST_OUTPUT            IOSTA &= (~BIT5)
// #define P_TEST_INPUT             IOSTA |= (BIT5)
//------------------------------------------------------------------------------------

//!PIN9
//RA4 SCL
#define P_I2C_SCL           RA4
#define P_I2C_SCL_CLR       P_I2C_SCL = 0
#define P_I2C_SCL_SET       P_I2C_SCL = 1
#define P_I2C_SCL_OUTPUT    IOSTA &= (~BIT4)
#define P_I2C_SCL_INPUT     IOSTA |= (BIT4) 


//!PIN10
//RA3 SDA
#define P_I2C_SDA           RA3 
#define P_I2C_SDA_CLR       P_I2C_SDA = 0
#define P_I2C_SDA_SET       P_I2C_SDA = 1
#define P_I2C_SDA_OUTPUT    IOSTA &= (~BIT3)
#define P_I2C_SDA_INPUT     IOSTA |= (BIT3)


//!PIN11
//RA2--AN2                      //! OK
#define P_I2C_INT           RA2 
#define P_I2C_INT_CLR       P_I2C_INT = 0
#define P_I2C_INT_SET       P_I2C_INT = 1
#define P_I2C_INT_OUTPUT    IOSTA &= (~BIT2)
#define P_I2C_INT_INPUT     IOSTA |= (BIT2)

//!PIN12
//GND


//!PIN13
//PB0 KEY-MCU
#define P_KEY                        RB0
#define P_KEY_CLR                    P_KEY = 0
#define P_KEY_SET                    P_KEY = 1
#define P_KEY_OUTPUT                 IOSTB &= (~BIT0)
#define P_KEY_INPUT                  IOSTB |= (BIT0)

#define P_IO_UART_TX                RB0 
#define P_IO_UART_TX_CLR            P_IO_UART_TX = 0
#define P_IO_UART_TX_SET            P_IO_UART_TX = 1
#define P_IO_UART_TX_OUTPUT         IOSTB &= (~BIT0)
#define P_IO_UART_TX_INPUT          IOSTB |= (BIT0)

//!PIN14
// PB1 KEY-5568
#define P_KEY_IPS                        RB1
#define P_KEY_IPS_CLR                    P_KEY_IPS = 0
#define P_KEY_IPS_SET                    P_KEY_IPS = 1
#define P_KEY_IPS_OUTPUT                 IOSTB &= (~BIT1)
#define P_KEY_IPS_INPUT                  IOSTB |= (BIT1)

//! PIN15
// LED2
#define P_LED_B                     RB2
#define P_LED_B_CLR                 P_LED_B = 0
#define P_LED_B_SET                 P_LED_B = 1
#define P_LED_B_OUTPUT              IOSTB &= (~BIT2)
#define P_LED_B_INPUT               IOSTB |= (BIT2)

#define P_LED_B_OFF                 P_LED_B_CLR
#define P_LED_B_ON                  P_LED_B_SET

//!PIN16
// LED3
#define P_LED_G                     RB3
#define P_LED_G_CLR                 P_LED_G = 0
#define P_LED_G_SET                 P_LED_G = 1
#define P_LED_G_OUTPUT              IOSTB &= (~BIT3)
#define P_LED_G_INPUT               IOSTB |= (BIT3)

#define P_LED_G_OFF                 P_LED_G_CLR
#define P_LED_G_ON                  P_LED_G_SET






#define CONST_TIMER_GET_ACK                    (250)
#define IIC_WRITE   (0) 
#define IIC_READ    (1) 

//ad 
#define CMD_ARRAY_SIZE          (28)
#define AD_ARRAY_SIZE           (8)          //采样8次，这个参数不用改动，防止AD值累加平均出错
#define AD_SUM_SHIFT            (3)           //右移3次平均
#define AD_CH_AN0               (0x00)        // AN0 -- PA0
#define AD_CH_AN1               (0x01)        // AN1 -- PA1
#define AD_CH_V_IN              (0x02)        // AN2 -- PA2
#define AD_CH_I_L               (0x03)        // AN3 -- PA3
#define AD_CH_I_R               (0x04)        // AN4 -- PA4
#define AD_CH_AN5               (0x05)        // AN5 -- PB0
#define AD_CH_AN6               (0x06)        // AN6 -- PB1
#define AD_CH_AN7               (0x07)        // AN7 -- PB2
#define AD_CH_NTC               (0x08)        // AN8 -- PB3
#define AD_CH_AN9               (0x09)        // AN9 -- PB4
#define AD_CH_AN10              (0x0A)        // AN10 -- PB5
#define AD_CH_V_BAT             (0x0B)        // AN11 -- 1/4 VDD
//ad end


#define CONST_TIMER_34P8            147
#define CONST_LOSS_TIMER            5

#define CONST_DELAY_SLEEP_TIME      20  //320ms*20 = 6sec5
//#define CONST_DISP_ALL_TIMER        7//10//5
#define LED_DISP_TIME               10
#define DISP_TIMER                  1
#define DISP_SHORT_TIMER            6
#define DISP_LONG_TIMER             20


#define CONST_PY                    0//(64)
#define CONST_AD_SET_UV             (1542+CONST_PY)        // 3.14
#define CONST_AD_BAT_CAP_0          (1552+CONST_PY)        // 3.16
#define CONST_AD_CLEAR_UV           (1695+CONST_PY)        // 3.452
#define CONST_AD_BAT_CAP_100        (2052+CONST_PY)        // 4.176
#define CONST_AD_BAT_FULL           (2057+CONST_PY)        // 4.187
#define CONST_AD_1PER               5           // (2052 - 1552)/100



#define CMD_INTERVALNUM                 (400)
#define CMD_QUEUE_SIZE                  (4)
#define CONST_SCS_START_TIMER           (625)           // 40ms
#define CONST_SCS_SEND_ONE_BIT_TIMER    (625)           // 40ms
#define CONST_INTERVAL_TIMER            (6250)          // 400ms
#define CONST_GAP_TIMER                 (4688)



#define CMD_FACTORY_SET         (0x04)          // 0000 0100  发命令给耳机恢复出厂设置
#define CMD_BT_POWER_ON         (0x0E)          // 0000 1110  BT POWER ON
#define CMD_BT_POWER_OFF        (0x10)          // 0001 0000  BT POWER OFF
#define CMD_IN_PAIRING_MODE     (0x12)          // 0001 0010  Enter Pairing Mode
#define CMD_IN_DUT_MODE         (0x20)          // 0010 0000  Enter DUT Mode



#endif/* __HC_DEFINE_H__ */
