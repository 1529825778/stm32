;******************** (C) COPYRIGHT 2017 STMicroelectronics ********************
;* File Name          : startup_stm32h743xx.s
;* @author  MCD Application Team
;* version            : V1.2.0
;* Date               : 29-December-2017
;* Description        : STM32H7xx devices vector table for MDK-ARM toolchain. 
;*                      This module performs:
;*                      - Set the initial SP
;*                      - Set the initial PC == Reset_Handler
;*                      - Set the vector table entries with the exceptions ISR address
;*                      - Branches to __main in the C library (which eventually
;*                        calls main()).
;*                      After Reset the Cortex-M processor is in Thread mode,
;*                      priority is Privileged, and the Stack is set to Main.
;* <<< Use Configuration Wizard in Context Menu >>>   
;*******************************************************************************
; 
; Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
; You may not use this file except in compliance with the License.
; You may obtain a copy of the License at:
; 
;        http://www.st.com/software_license_agreement_liberty_v2
; 
; Unless required by applicable law or agreed to in writing, software 
; distributed under the License is distributed on an "AS IS" BASIS, 
; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; See the License for the specific language governing permissions and
; limitations under the License.
; 
;*******************************************************************************

; Amount of memory (in bytes) allocated for Stack
; Tailor this value to your application needs
; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>


; Vector Table Mapped to Address 0 at Reset
                AREA    RESET_ram, DATA, READONLY
                EXPORT  __Vectors_ram
                EXPORT  __Vectors_End_ram
                EXPORT  __Vectors_Size_ram

__Vectors_ram   DCD     0                      ; Top of Stack
                DCD     0                     ; Reset Handler
                DCD     NMI_Handler                       ; NMI Handler
                DCD     HardFault_Handler                 ; Hard Fault Handler
                DCD     MemManage_Handler                 ; MPU Fault Handler
                DCD     BusFault_Handler                  ; Bus Fault Handler
                DCD     UsageFault_Handler                ; Usage Fault Handler
                DCD     0                                 ; Reserved
                DCD     0                                 ; Reserved
                DCD     0                                 ; Reserved
                DCD     0                                 ; Reserved
                DCD     SVC_Handler                       ; SVCall Handler
                DCD     DebugMon_Handler                  ; Debug Monitor Handler
                DCD     0                                 ; Reserved
                DCD     PendSV_Handler                    ; PendSV Handler
                DCD     SysTick_Handler                   ; SysTick Handler

                ; External Interrupts
                DCD     WWDG_IRQHandler                   ; Window WatchDog interrupt ( wwdg1_it)                                         
                DCD     PVD_AVD_IRQHandler                ; PVD/AVD through EXTI Line detection                        
                DCD     TAMP_STAMP_IRQHandler             ; Tamper and TimeStamps through the EXTI line            
                DCD     RTC_WKUP_IRQHandler               ; RTC Wakeup through the EXTI line                       
                DCD     FLASH_IRQHandler                  ; FLASH                                           
                DCD     RCC_IRQHandler                    ; RCC                                             
                DCD     EXTI0_IRQHandler                  ; EXTI Line0                                             
                DCD     EXTI1_IRQHandler                  ; EXTI Line1                                             
                DCD     EXTI2_IRQHandler                  ; EXTI Line2                                             
                DCD     EXTI3_IRQHandler                  ; EXTI Line3                                             
                DCD     EXTI4_IRQHandler                  ; EXTI Line4 
                DCD     DMA1_Stream0_IRQHandler           ; DMA1 Stream 0
                DCD     DMA1_Stream1_IRQHandler           ; DMA1 Stream 1                                   
                DCD     DMA1_Stream2_IRQHandler           ; DMA1 Stream 2                                   
                DCD     DMA1_Stream3_IRQHandler           ; DMA1 Stream 3                                   
                DCD     DMA1_Stream4_IRQHandler           ; DMA1 Stream 4                                   
                DCD     DMA1_Stream5_IRQHandler           ; DMA1 Stream 5                                   
                DCD     DMA1_Stream6_IRQHandler           ; DMA1 Stream 6  
                DCD     ADC_IRQHandler                    ; ADC1, ADC2                             
                DCD     FDCAN1_IT0_IRQHandler             ; FDCAN1 interrupt line 0                        
                DCD     FDCAN2_IT0_IRQHandler             ; FDCAN2 interrupt line 0                               
                DCD     FDCAN1_IT1_IRQHandler             ; FDCAN1 interrupt line 1                        
                DCD     FDCAN2_IT1_IRQHandler             ; FDCAN2 interrupt line 1                                               
                DCD     EXTI9_5_IRQHandler                ; External Line[9:5]s                                    
                DCD     TIM1_BRK_IRQHandler               ; TIM1 Break interrupt                   
                DCD     TIM1_UP_IRQHandler                ; TIM1 Update Interrupt                 
                DCD     TIM1_TRG_COM_IRQHandler           ; TIM1 Trigger and Commutation Interrupt 
                DCD     TIM1_CC_IRQHandler                ; TIM1 Capture Compare                                   
                DCD     TIM2_IRQHandler                   ; TIM2                                            
                DCD     TIM3_IRQHandler                   ; TIM3                                            
                DCD     TIM4_IRQHandler                   ; TIM4                                            
                DCD     I2C1_EV_IRQHandler                ; I2C1 Event                                             
                DCD     I2C1_ER_IRQHandler                ; I2C1 Error                                             
                DCD     I2C2_EV_IRQHandler                ; I2C2 Event                                             
                DCD     I2C2_ER_IRQHandler                ; I2C2 Error                                               
                DCD     SPI1_IRQHandler                   ; SPI1                                            
                DCD     SPI2_IRQHandler                   ; SPI2                                            
                DCD     USART1_IRQHandler                 ; USART1                                          
                DCD     USART2_IRQHandler                 ; USART2                                          
                DCD     USART3_IRQHandler                 ; USART3                                          
                DCD     EXTI15_10_IRQHandler              ; External Line[15:10]  
                DCD     RTC_Alarm_IRQHandler              ; RTC Alarm (A and B) through EXTI Line
                DCD     0                                 ; Reserved                                          
                DCD     TIM8_BRK_TIM12_IRQHandler         ; TIM8 Break Interrupt and TIM12 global interrupt                 
                DCD     TIM8_UP_TIM13_IRQHandler          ; TIM8 Update Interrupt and TIM13 global interrupt
                DCD     TIM8_TRG_COM_TIM14_IRQHandler     ; TIM8 Trigger and Commutation Interrupt and TIM14 global interrupt
                DCD     TIM8_CC_IRQHandler                ; TIM8 Capture Compare Interrupt
                DCD     DMA1_Stream7_IRQHandler           ; DMA1 Stream7                                           
                DCD     FMC_IRQHandler                    ; FMC                             
                DCD     SDMMC1_IRQHandler                 ; SDMMC1                            
                DCD     TIM5_IRQHandler                   ; TIM5                            
                DCD     SPI3_IRQHandler                   ; SPI3                            
                DCD     UART4_IRQHandler                  ; UART4                           
                DCD     UART5_IRQHandler                  ; UART5                           
                DCD     TIM6_DAC_IRQHandler               ; TIM6 and DAC1&2 underrun errors           
                DCD     TIM7_IRQHandler                   ; TIM7           
                DCD     DMA2_Stream0_IRQHandler           ; DMA2 Stream 0                   
                DCD     DMA2_Stream1_IRQHandler           ; DMA2 Stream 1                   
                DCD     DMA2_Stream2_IRQHandler           ; DMA2 Stream 2                   
                DCD     DMA2_Stream3_IRQHandler           ; DMA2 Stream 3                   
                DCD     DMA2_Stream4_IRQHandler           ; DMA2 Stream 4                   
                DCD     ETH_IRQHandler                    ; Ethernet                        
                DCD     ETH_WKUP_IRQHandler               ; Ethernet Wakeup through EXTI line              
                DCD     FDCAN_CAL_IRQHandler              ; FDCAN calibration unit interrupt                        
                DCD     0                                 ; Reserved                              
                DCD     0                                 ; Reserved 
                DCD     0                                 ; Reserved 
                DCD     0                                 ; Reserved                      
                DCD     DMA2_Stream5_IRQHandler           ; DMA2 Stream 5                   
                DCD     DMA2_Stream6_IRQHandler           ; DMA2 Stream 6                   
                DCD     DMA2_Stream7_IRQHandler           ; DMA2 Stream 7                   
                DCD     USART6_IRQHandler                 ; USART6                           
                DCD     I2C3_EV_IRQHandler                ; I2C3 event                             
                DCD     I2C3_ER_IRQHandler                ; I2C3 error                             
                DCD     OTG_HS_EP1_OUT_IRQHandler         ; USB OTG HS End Point 1 Out                      
                DCD     OTG_HS_EP1_IN_IRQHandler          ; USB OTG HS End Point 1 In                       
                DCD     OTG_HS_WKUP_IRQHandler            ; USB OTG HS Wakeup through EXTI                         
                DCD     OTG_HS_IRQHandler                 ; USB OTG HS                    
                DCD     DCMI_IRQHandler                   ; DCMI                            
                DCD     0                                 ; Reserved                                     
                DCD     RNG_IRQHandler                    ; Rng
                DCD     FPU_IRQHandler                    ; FPU
                DCD     UART7_IRQHandler                  ; UART7
                DCD     UART8_IRQHandler                  ; UART8
                DCD     SPI4_IRQHandler                   ; SPI4
                DCD     SPI5_IRQHandler                   ; SPI5
                DCD     SPI6_IRQHandler                   ; SPI6
                DCD     SAI1_IRQHandler                   ; SAI1
                DCD     LTDC_IRQHandler                   ; LTDC
                DCD     LTDC_ER_IRQHandler                ; LTDC error
                DCD     DMA2D_IRQHandler                  ; DMA2D
                DCD     SAI2_IRQHandler                   ; SAI2
                DCD     QUADSPI_IRQHandler                ; QUADSPI
                DCD     LPTIM1_IRQHandler                 ; LPTIM1
                DCD     CEC_IRQHandler                    ; HDMI_CEC
                DCD     I2C4_EV_IRQHandler                ; I2C4 Event                             
                DCD     I2C4_ER_IRQHandler                ; I2C4 Error 
                DCD     SPDIF_RX_IRQHandler               ; SPDIF_RX
                DCD     OTG_FS_EP1_OUT_IRQHandler         ; USB OTG FS End Point 1 Out                      
                DCD     OTG_FS_EP1_IN_IRQHandler          ; USB OTG FS End Point 1 In                       
                DCD     OTG_FS_WKUP_IRQHandler            ; USB OTG FS Wakeup through EXTI                         
                DCD     OTG_FS_IRQHandler                 ; USB OTG FS                 
                DCD     DMAMUX1_OVR_IRQHandler            ; DMAMUX1 Overrun interrupt  
                DCD     HRTIM1_Master_IRQHandler          ; HRTIM Master Timer global Interrupts                              
                DCD     HRTIM1_TIMA_IRQHandler            ; HRTIM Timer A global Interrupt                                    
                DCD     HRTIM1_TIMB_IRQHandler            ; HRTIM Timer B global Interrupt                                    
                DCD     HRTIM1_TIMC_IRQHandler            ; HRTIM Timer C global Interrupt                                    
                DCD     HRTIM1_TIMD_IRQHandler            ; HRTIM Timer D global Interrupt                                    
                DCD     HRTIM1_TIME_IRQHandler            ; HRTIM Timer E global Interrupt                                    
                DCD     HRTIM1_FLT_IRQHandler             ; HRTIM Fault global Interrupt 
                DCD     DFSDM1_FLT0_IRQHandler            ; DFSDM Filter0 Interrupt   
                DCD     DFSDM1_FLT1_IRQHandler            ; DFSDM Filter1 Interrupt                                            
                DCD     DFSDM1_FLT2_IRQHandler            ; DFSDM Filter2 Interrupt                                            
                DCD     DFSDM1_FLT3_IRQHandler            ; DFSDM Filter3 Interrupt                                                                                    
                DCD     SAI3_IRQHandler                   ; SAI3 global Interrupt                                             
                DCD     SWPMI1_IRQHandler                 ; Serial Wire Interface 1 global interrupt                          
                DCD     TIM15_IRQHandler                  ; TIM15 global Interrupt                                            
                DCD     TIM16_IRQHandler                  ; TIM16 global Interrupt                                            
                DCD     TIM17_IRQHandler                  ; TIM17 global Interrupt                                            
                DCD     MDIOS_WKUP_IRQHandler             ; MDIOS Wakeup  Interrupt                                           
                DCD     MDIOS_IRQHandler                  ; MDIOS global Interrupt                                            
                DCD     JPEG_IRQHandler                   ; JPEG global Interrupt                                             
                DCD     MDMA_IRQHandler                   ; MDMA global Interrupt                                             
                DCD     0                                 ; Reserved                                               
                DCD     SDMMC2_IRQHandler                 ; SDMMC2 global Interrupt                                           
                DCD     HSEM1_IRQHandler                  ; HSEM1 global Interrupt                                             
                DCD     0                                 ; Reserved                                              
                DCD     ADC3_IRQHandler                   ; ADC3 global Interrupt                                              
                DCD     DMAMUX2_OVR_IRQHandler            ; DMAMUX Overrun interrupt                                           
                DCD     BDMA_Channel0_IRQHandler          ; BDMA Channel 0 global Interrupt                                    
                DCD     BDMA_Channel1_IRQHandler          ; BDMA Channel 1 global Interrupt                                    
                DCD     BDMA_Channel2_IRQHandler          ; BDMA Channel 2 global Interrupt                                    
                DCD     BDMA_Channel3_IRQHandler          ; BDMA Channel 3 global Interrupt                                    
                DCD     BDMA_Channel4_IRQHandler          ; BDMA Channel 4 global Interrupt                                    
                DCD     BDMA_Channel5_IRQHandler          ; BDMA Channel 5 global Interrupt                                    
                DCD     BDMA_Channel6_IRQHandler          ; BDMA Channel 6 global Interrupt                                    
                DCD     BDMA_Channel7_IRQHandler          ; BDMA Channel 7 global Interrupt                                    
                DCD     COMP1_IRQHandler                  ; COMP1 global Interrupt                                            
                DCD     LPTIM2_IRQHandler                 ; LP TIM2 global interrupt                                          
                DCD     LPTIM3_IRQHandler                 ; LP TIM3 global interrupt                                          
                DCD     LPTIM4_IRQHandler                 ; LP TIM4 global interrupt                                          
                DCD     LPTIM5_IRQHandler                 ; LP TIM5 global interrupt                                          
                DCD     LPUART1_IRQHandler                ; LP UART1 interrupt                                                
                DCD     0                                 ; Reserved                                                                              
                DCD     CRS_IRQHandler                    ; Clock Recovery Global Interrupt                                   
                DCD     0                                 ; Reserved                                              
                DCD     SAI4_IRQHandler                   ; SAI4 global interrupt                                                
                DCD     0                                 ; Reserved                                 
                DCD     0                                 ; Reserved                                    
                DCD     WAKEUP_PIN_IRQHandler             ; Interrupt for all 6 wake-up pins 
                

__Vectors_End_ram

__Vectors_Size_ram  EQU  __Vectors_End_ram - __Vectors_ram

                AREA    |.text|, CODE, READONLY
				IMPORT NMI_Handler
				IMPORT HardFault_Handler
				IMPORT MemManage_Handler
				IMPORT  BusFault_Handler                 
				IMPORT  UsageFault_Handler              
                IMPORT  SVC_Handler                     
                IMPORT  DebugMon_Handler                  
                IMPORT  PendSV_Handler                   
                IMPORT  SysTick_Handler   

				IMPORT WWDG_IRQHandler                                                          
				IMPORT PVD_AVD_IRQHandler                                             
				IMPORT TAMP_STAMP_IRQHandler                
				IMPORT RTC_WKUP_IRQHandler                            
				IMPORT FLASH_IRQHandler                                                          
				IMPORT RCC_IRQHandler                                                              
				IMPORT EXTI0_IRQHandler                                                              
				IMPORT EXTI1_IRQHandler                                                             
				IMPORT EXTI2_IRQHandler                                                              
				IMPORT EXTI3_IRQHandler                                                              
				IMPORT EXTI4_IRQHandler 
				IMPORT DMA1_Stream0_IRQHandler
				IMPORT DMA1_Stream1_IRQHandler                                  
				IMPORT DMA1_Stream2_IRQHandler                               
				IMPORT DMA1_Stream3_IRQHandler                              
				IMPORT DMA1_Stream4_IRQHandler                                  
				IMPORT DMA1_Stream5_IRQHandler                                    
				IMPORT DMA1_Stream6_IRQHandler                   
				IMPORT ADC_IRQHandler                                           
				IMPORT FDCAN1_IT0_IRQHandler
				IMPORT FDCAN2_IT0_IRQHandler
				IMPORT FDCAN1_IT1_IRQHandler
				IMPORT FDCAN2_IT1_IRQHandler
				IMPORT EXTI9_5_IRQHandler                                                
				IMPORT TIM1_BRK_IRQHandler                        
				IMPORT TIM1_UP_IRQHandler                      
				IMPORT TIM1_TRG_COM_IRQHandler  
				IMPORT TIM1_CC_IRQHandler                                               
				IMPORT TIM2_IRQHandler                                                           
				IMPORT TIM3_IRQHandler                                                           
				IMPORT TIM4_IRQHandler                                                           
				IMPORT I2C1_EV_IRQHandler                                                         
				IMPORT I2C1_ER_IRQHandler                                                         
				IMPORT I2C2_EV_IRQHandler                                                        
				IMPORT I2C2_ER_IRQHandler                                                           
				IMPORT SPI1_IRQHandler                                                          
				IMPORT SPI2_IRQHandler                                                           
				IMPORT USART1_IRQHandler                                                       
				IMPORT USART2_IRQHandler                                                       
				IMPORT USART3_IRQHandler                                                      
				IMPORT EXTI15_10_IRQHandler                                            
				IMPORT RTC_Alarm_IRQHandler                                                           
				IMPORT TIM8_BRK_TIM12_IRQHandler                      
				IMPORT TIM8_UP_TIM13_IRQHandler                       
				IMPORT TIM8_TRG_COM_TIM14_IRQHandler  
				IMPORT TIM8_CC_IRQHandler                                               
				IMPORT DMA1_Stream7_IRQHandler                                                 
				IMPORT FMC_IRQHandler                                                            
				IMPORT SDMMC1_IRQHandler                                                            
				IMPORT TIM5_IRQHandler                                                            
				IMPORT SPI3_IRQHandler                                                            
				IMPORT UART4_IRQHandler                                                          
				IMPORT UART5_IRQHandler                                                          
				IMPORT TIM6_DAC_IRQHandler                            
				IMPORT TIM7_IRQHandler                              
				IMPORT DMA2_Stream0_IRQHandler                                         
				IMPORT DMA2_Stream1_IRQHandler                                          
				IMPORT DMA2_Stream2_IRQHandler                                           
				IMPORT DMA2_Stream3_IRQHandler                                           
				IMPORT DMA2_Stream4_IRQHandler                                        
				IMPORT ETH_IRQHandler                                                         
				IMPORT ETH_WKUP_IRQHandler                                
				IMPORT FDCAN_CAL_IRQHandler                                                                                                                                                                                                                            
				IMPORT DMA2_Stream5_IRQHandler                                          
				IMPORT DMA2_Stream6_IRQHandler                                          
				IMPORT DMA2_Stream7_IRQHandler                                          
				IMPORT USART6_IRQHandler                                                        
				IMPORT I2C3_EV_IRQHandler                                                          
				IMPORT I2C3_ER_IRQHandler                                                          
				IMPORT OTG_HS_EP1_OUT_IRQHandler 
				IMPORT OTG_HS_EP1_IN_IRQHandler 
				IMPORT OTG_HS_WKUP_IRQHandler   
				IMPORT OTG_HS_IRQHandler        
				IMPORT DCMI_IRQHandler                                                            
				IMPORT RNG_IRQHandler
				IMPORT FPU_IRQHandler  
				IMPORT UART7_IRQHandler                  
				IMPORT UART8_IRQHandler                  
				IMPORT SPI4_IRQHandler                   
				IMPORT SPI5_IRQHandler                   
				IMPORT SPI6_IRQHandler                   
				IMPORT SAI1_IRQHandler                   
				IMPORT LTDC_IRQHandler                   
				IMPORT LTDC_ER_IRQHandler                 
				IMPORT DMA2D_IRQHandler   
				IMPORT SAI2_IRQHandler        
				IMPORT QUADSPI_IRQHandler
				IMPORT LPTIM1_IRQHandler
				IMPORT CEC_IRQHandler
				IMPORT I2C4_EV_IRQHandler
				IMPORT I2C4_ER_IRQHandler
				IMPORT SPDIF_RX_IRQHandler
				IMPORT OTG_FS_EP1_OUT_IRQHandler
				IMPORT OTG_FS_EP1_IN_IRQHandler 
				IMPORT OTG_FS_WKUP_IRQHandler   
				IMPORT OTG_FS_IRQHandler        
				IMPORT DMAMUX1_OVR_IRQHandler
				IMPORT HRTIM1_Master_IRQHandler               
				IMPORT HRTIM1_TIMA_IRQHandler                                                      
				IMPORT HRTIM1_TIMB_IRQHandler                                                      
				IMPORT HRTIM1_TIMC_IRQHandler                                                      
				IMPORT HRTIM1_TIMD_IRQHandler                                                      
				IMPORT HRTIM1_TIME_IRQHandler                                                      
				IMPORT HRTIM1_FLT_IRQHandler 
				IMPORT DFSDM1_FLT0_IRQHandler
				IMPORT DFSDM1_FLT1_IRQHandler                                                                
				IMPORT DFSDM1_FLT2_IRQHandler                                                                
				IMPORT DFSDM1_FLT3_IRQHandler                                                                                                                                
				IMPORT SAI3_IRQHandler                                                                    
				IMPORT SWPMI1_IRQHandler                                                 
				IMPORT TIM15_IRQHandler                                                                   
				IMPORT TIM16_IRQHandler                                                                    
				IMPORT TIM17_IRQHandler                                                                  
				IMPORT MDIOS_WKUP_IRQHandler                                                              
				IMPORT MDIOS_IRQHandler                                                                    
				IMPORT JPEG_IRQHandler                                                                      
				IMPORT MDMA_IRQHandler                                                                                                                                            
				IMPORT SDMMC2_IRQHandler                                                                  
				IMPORT HSEM1_IRQHandler                                                                                                                                       
				IMPORT ADC3_IRQHandler                                                                       
				IMPORT DMAMUX2_OVR_IRQHandler                                                            
				IMPORT BDMA_Channel0_IRQHandler                                                     
				IMPORT BDMA_Channel1_IRQHandler                                                     
				IMPORT BDMA_Channel2_IRQHandler                                                     
				IMPORT BDMA_Channel3_IRQHandler                                                     
				IMPORT BDMA_Channel4_IRQHandler                                                    
				IMPORT BDMA_Channel5_IRQHandler                                                     
				IMPORT BDMA_Channel6_IRQHandler                                                     
				IMPORT BDMA_Channel7_IRQHandler                                                    
				IMPORT COMP1_IRQHandler                                                                    
				IMPORT LPTIM2_IRQHandler                                                                
				IMPORT LPTIM3_IRQHandler                                                                 
				IMPORT LPTIM4_IRQHandler                                                                 
				IMPORT LPTIM5_IRQHandler                                                                 
				IMPORT LPUART1_IRQHandler                                                                                                                         
				IMPORT CRS_IRQHandler                                                            
				IMPORT SAI4_IRQHandler      
				IMPORT WAKEUP_PIN_IRQHandler
         
END                                     
                                                          
