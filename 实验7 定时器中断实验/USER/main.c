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
void ram_func() __attribute__((section("RAMCODE")));
extern void jump(uint32_t address);
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
	printf("hello word!\r\n");
	
	/*RW_IRAM1�����μ���(�洢)��ַ*/
	extern void* Load$$ER_IROM1$$RO$$Base;
	/*RW_IRAM1�����γ���*/
	extern unsigned int Load$$ER_IROM1$$RO$$Length;
	
	/*ram_funcִ�е�ַ*/
	extern void* RAMCODE$$Base;
	/*ram_func����*/
	extern unsigned int RAMCODE$$Length;
	printf("%x,%d\r\n",(char*)&RAMCODE$$Base,(unsigned int)&RAMCODE$$Length);
	/**RW_IRAM1������ִ�е�ַ*/
	extern void* Image$$ER_IROM1$$RO$$Base;
	extern unsigned int Image$$ER_IROM1$$RO$$Length;
	printf("%x,%d\r\n",(char*)&Image$$ER_IROM1$$RO$$Base,(unsigned int)&Image$$ER_IROM1$$RO$$Length);
	unsigned char* load_address = (unsigned char*)0x24040000;
	memcpy(load_address,(char*)&Load$$ER_IROM1$$RO$$Base,(unsigned int)&Load$$ER_IROM1$$RO$$Length);
	
	
	
	//memcpy(load_address,(unsigned char*)&RAMCODE$$Base,(unsigned int)&RAMCODE$$Length);
	//ram_func();
	printf("%x,%x\r\n",(unsigned char*)&RAMCODE$$Base,(unsigned char*)(&Image$$ER_IROM1$$RO$$Base));
	uint32_t offset = (unsigned char*)(&RAMCODE$$Base)-(unsigned char*)(&Image$$ER_IROM1$$RO$$Base);
	printf("offset:%d\r\n",offset);
	jump(((uint32_t)load_address)+offset);
	//((void(*)(void))(load_address))();
  //ram_func();	
	//#pragma asm 
	//	LDR r0,#1
	//#pragma endasm
	
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


void ram_func(){
	printf("I am in ram!\n");
	return ;
}




