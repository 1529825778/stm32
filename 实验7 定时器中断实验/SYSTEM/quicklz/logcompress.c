#include "logcompress.h"

static uint32_t count =0;

static uint32_t CompressSize[4096];

static uint32_t total_time;

//static int CompressFile;

//static FILE* CompressFile;

typedef struct compress_worker_t{
    uint32_t total_size;
    uint32_t used_size;
    qlz_state_compress* state_compress;
    unsigned char* begin_ptr;
    unsigned char* work_ptr;
}compress_worker_t;

static compress_worker_t* compress_worker;

qlz_state_compress *state_compress;

//init :create file
int8_t CompressInit(uint32_t size){

     //time_t timep;
    //struct tm *t;
    //time(&timep);
    //t = localtime(&timep);
    //char filename[20];
    //sprintf(filename,"%d_%d_%d_%d_%d_%d.log",1900+t->tm_year,1+t->tm_mon,t->tm_mday,t->tm_hour,t->tm_min,t->tm_sec);
    //CompressFile = fopen(filename,"ab+");
    /*
    CompressFile = fopen(filename,"ab+");
    */
    //if(CompressFile ==NULL){
    //    return 0;
    //}
    compress_worker =(compress_worker_t*)malloc(sizeof(compress_worker_t));
    memset(compress_worker,0x00,sizeof(compress_worker_t));
    if(compress_worker==NULL){
        return 0;
    }

    compress_worker->total_size = size +1024;
    compress_worker->state_compress = (qlz_state_compress*)malloc(sizeof(qlz_state_compress));
		if(compress_worker->state_compress==NULL){
			return 0;
		}
    memset(compress_worker->state_compress,0x00,sizeof(qlz_state_compress));
    
   
    compress_worker->begin_ptr = (unsigned char*)malloc(compress_worker->total_size);
    memset(compress_worker->begin_ptr,0x00,compress_worker->total_size);


    compress_worker->work_ptr = compress_worker->begin_ptr;
    compress_worker->used_size = 0;

   

    return 1;
}


int8_t RealCompress(unsigned char* output_buffer,uint32_t* output_len){
    unsigned char out[compress_worker->used_size];
    memset(compress_worker->state_compress,0x00,sizeof(qlz_state_compress));
	  my_time = 0;
    *output_len = qlz_compress(compress_worker->begin_ptr,(char *)output_buffer,compress_worker->used_size,compress_worker->state_compress);
	  total_time += my_time;
	//printf("size:%d,time:%d\n",compress_worker->used_size,my_time);
    if(*output_len>0){
        CompressSize[count++] = *output_len; 
        compress_worker->work_ptr = compress_worker->begin_ptr;
        compress_worker->used_size=0;
        //fwrite(out,*output_len,1,CompressFile);
        //fflush(CompressFile);
        return 1;
        
    }
    else return -1;    
}

/*
* @brief compress log
* @param[in] src           -the address of log need compress
* @param[in] src_len       -the length of the log 
* @param[in] output_buffer -the buffer store log compressed (suggest space's size equal to the paramter of function CompressInit)
* @param[in] output_len    -store length of log compressed  
*/

int8_t LogCompress(const unsigned char* src,uint32_t src_len,unsigned char* output_buffer,uint32_t* output_len){
    /*compress*/
   
    memcpy(compress_worker->work_ptr,src,src_len);
    compress_worker->work_ptr+=src_len;
    compress_worker->used_size+=src_len;
    if(compress_worker->used_size>=compress_worker->total_size-1024){
        return RealCompress(output_buffer,output_len);
    }
    return 0;

}
int8_t  CompressRelease(unsigned char* output_buffer,uint32_t* output_len){
    int8_t ret = RealCompress(output_buffer,output_len);
    //for(int i=0;i<count;i++){
    //    fwrite(&CompressSize[i],sizeof(uint32_t),1,CompressFile);
    //}
    //fwrite(&count,sizeof(uint32_t),1,CompressFile);
    free(compress_worker->state_compress);
    free(compress_worker->work_ptr);
    free(compress_worker);
	  double speed  = (double)6000*1000/total_time;
	printf("total_time:%dms\r\n",total_time);
	printf("speed:%lfByte/ms\r\n",speed);
    //fclose(CompressFile);
    return ret;

}


/*test*/
// void main(){
//     // int x;
//     // scanf("%d",&x);
//     FILE* file = fopen("rtk_0718-1.log","r");
//     char buf[2048];
   
//     if(!init(50*1024)){
//         printf("init fail!\n");
//     }

//     while (fgets(buf, sizeof(buf), file) != NULL)
//     {
//         LogCompress(buf,strlen(buf));
//     }
//     //  scanf("%d",&x);
    
//      release();
//     //scanf("%d",&x);
// }


