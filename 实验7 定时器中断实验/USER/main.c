#include "sys.h"
#include "delay.h"
#include "usart.h" 
#include "led.h"
#include "key.h"
#include "timer.h"

#include "logcompress.h"

/************************************************
 ALIENTEK 阿波罗STM32H7开发板 实验7
 定时器中断实验-HAL库函数版
 技术支持：www.openedv.com
 淘宝店铺：http://eboard.taobao.com 
 关注微信公众平台微信号："正点原子"，免费获取STM32资料。
 广州市星翼电子科技有限公司  
 作者：正点原子 @ALIENTEK
************************************************/

int main(void)
{	
  u32 hclkfre=0;
	Cache_Enable();                		//打开L1-Cache
	HAL_Init();				        	//初始化HAL库
	Stm32_Clock_Init(160,5,2,4);  	    //设置时钟,400Mhz 
	delay_init(400);					//延时初始化
	uart_init(115200);					//串口初始化
	LED_Init();							//初始化LED
    TIM3_Init(10-1,20000-1);      	//定时器3初始化，定时器时钟为200M，分频系数为20000-1，
										//所以定时器3的频率为200M/20000=10K，自动重装载为10-1，那么定时器周期就是1ms
	  TIM4_Init(10-1,100-1);
    	unsigned char buffer[1000];
	unsigned char output_buffer[50*1024];
  uint32_t output_len;
	CompressInit(50*1024);
	printf("hello word!\n");
	for(int i=0;i<6000;i++){
	for(int j=0;j<1000;j++){
		srand(seed);
		buffer[j] = rand()%256;	
	}
	LogCompress(buffer,1000,output_buffer,&output_len);
}
	CompressRelease(output_buffer,&output_len);
	while(1){}
}

