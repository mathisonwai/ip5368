#ifndef __APP_KEY_H_
#define __APP_KEY_H_









//#define KEY_EVENT_BASE_ADDR         0xA0

//#define MSG_NONE                  0x00
#define KEY_BREAK                   0x20     //
#define KEY_LONG_START              0x40     //
#define KEY_LONG                    0x80     //
#define KEY_LONG_BREAK              0x60     //important

#define K1                          0x01
#define K1_BREAK                    0x21
#define K1_LONG_START               0x41
#define K1_LONG                     0x81
#define K1_LONG_BREAK               0x61

//! timer 10ms
#define GPIO_KEY_JTTER_TIME             3       //30ms
#define GPIO_KEY_CP_TIME                150     //1sec5
#define GPIO_KEY_CPH_TIME               25      //250ms  


typedef enum _GPIO_KEY_STATE
{
    GPIO_KEY_STATE_IDLE,
    GPIO_KEY_STATE_JITTER,
    GPIO_KEY_STATE_PRESS_DOWN,
    GPIO_KEY_STATE_CP

} GPIO_KEY_STATE;


typedef enum _KEY_EVENT
{
    MSG_NONE = 0x00,

    MSG_FAN_MODE = K1,                         // -- [0x01,0x1F] //! PDS(按键开始)
    MSG_M_PDS,
    MSG_Y_PDS,
    MSG_MY_PDS,
    //TODO:

    MSG_MODE = K1_BREAK,             // -- [0x21,0x3F]//! SPR(短按松开)
    MSG_LIGHT_SPR,
    MSG_M_SPR,
    MSG_Y_SPR,
    MSG_MY_SPR,
    //TODO:

    MSG_POWER_ON = K1_LONG_START,   // -- [0x41,0x5F] //! CPS(长按开始)，
    MSG_LIGHT_CPS,
    MSG_M_CPS,
    MSG_Y_CPS,
    MSG_MY_CPS,
    //TODO:

    KEY_POWER_LONG_BREAK = K1_LONG_BREAK,   // -- [0x61,0x7F]
    MSG_LIGHT_CPR,
    MSG_M_CPR,
    MSG_Y_CPR,
    MSG_MY_CPR,
    //TODO:

    KEY_POWER_LONG = K1_LONG,               // -- [0x81,0x5F]
    MSG_LIGHT_CPH,
    MSG_M_CPH,
    MSG_Y_CPH,
    MSG_MY_CPH,
    //TODO:

} KEY_EVENT;


#endif/* __HC_DEFINE_H__ */
