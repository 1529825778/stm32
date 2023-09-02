#include "sys.h"
#include "delay.h"
#include "usart.h" 
#include "led.h"
#include "key.h"
#include "timer.h"

#include "logcompress.h"

/************************************************
 ALIENTEK ������STM32H7������ ʵ��7
 ��ʱ���ж�ʵ��-HAL�⺯����
 ����֧�֣�www.openedv.com
 �Ա����̣�http://eboard.taobao.com 
 ��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡSTM32���ϡ�
 ������������ӿƼ����޹�˾  
 ���ߣ�����ԭ�� @ALIENTEK
************************************************/

int main(void)
{	
  u32 hclkfre=0;
	Cache_Enable();                		//��L1-Cache
	HAL_Init();				        	//��ʼ��HAL��
	Stm32_Clock_Init(160,5,2,4);  	    //����ʱ��,400Mhz 
	delay_init(400);					//��ʱ��ʼ��
	uart_init(115200);					//���ڳ�ʼ��
	LED_Init();							//��ʼ��LED
    TIM3_Init(10-1,20000-1);      	//��ʱ��3��ʼ������ʱ��ʱ��Ϊ200M����Ƶϵ��Ϊ20000-1��
										//���Զ�ʱ��3��Ƶ��Ϊ200M/20000=10K���Զ���װ��Ϊ10-1����ô��ʱ�����ھ���1ms
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

