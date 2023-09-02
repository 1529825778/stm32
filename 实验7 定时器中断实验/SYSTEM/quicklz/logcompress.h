#ifndef LOG_COMPRESS_H
#define LOG_COMPRESS_H


#include <stdlib.h>
#include <time.h>
#include <string.h>
#include "quicklz.h"
#include <stdint.h>

#include "timer.h"

extern int8_t CompressInit(uint32_t size);

extern int8_t  LogCompress(const unsigned char* src,uint32_t src_len,unsigned char* output_buffer,uint32_t* output_len);


extern int8_t CompressRelease(unsigned char* output_buffer,uint32_t* output_len);

static int8_t RealCompress(unsigned char* output_buffer,uint32_t* output_len);

#endif
