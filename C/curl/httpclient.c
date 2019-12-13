#include <string.h>
#include <json-c/json.h>
#include <curl/curl.h>

#ifdef __ZLOG_SUPPORT__
#define PLUGIN_LOG     do { \
        assert (level >= PLUGIN_FATAL && level <= PLUGIN_DEBUG); \
        dzlog(__FILE__, sizeof(__FILE__) - 1, __func__, sizeof(__func__) - 1, __LINE__, g_plugin_debug_level_to_zlog[level], format, ##args); \
    } while (0)
#else
#define PLUGIN_LOG(level, format, args...)  fprintf(stderr,"Line:%d__Function:%s() \t"format, __LINE__, __FUNCTION__, ##args )
#endif
char buffer[1024] = {0};

int  add_data(char * input,char * buffer)
{
    int offset = 0;
    char * ptr = buffer;
    offset = snprintf(ptr,strlen(input)+1,"%s",input);
    ptr[offset]=0x01;
    return offset;
}

void build_buffer(char * buffer)
{
    char * ptr = buffer;
    int i=0;
    int offset=0;
    int total=0;
    offset = add_data("VVVVVVVVVVVVVVVVV",ptr);
    // for (i = 0;i<=offset;i++)
    // {
    //     printf("%c=0x%x, ",ptr[i],ptr[i]);
    // }
    // printf ("\noffset %d\n",offset);

    ptr += offset+1;

    offset = add_data("1.0.25",ptr);
    // for (i = 0;i<=offset;i++)
    // {
    //     printf("%c=0x%x, ",ptr[i],ptr[i]);
    // }
    // printf ("\noffset %d\n",offset);
    ptr += offset+1;



    offset = add_data("1",ptr);
    ptr += offset+1;
    offset = add_data("5000",ptr);
    ptr += offset+1;
    offset = add_data("100000",ptr);
    ptr += offset+1;
    offset = add_data("100000",ptr);
    ptr += offset+1;
    offset = add_data("82340",ptr);
    ptr += offset+1;
    offset = add_data("63423",ptr);
    ptr += offset+1;
    offset = add_data("183.2.223.28",ptr);
    ptr += offset+1;
    offset = add_data("2",ptr);
    ptr += offset+1;
    offset = add_data("www.baidu.com",ptr);
    ptr += offset+1;
    offset = add_data("14.215.177.39",ptr);
    ptr += offset+1;
    offset = add_data("10",ptr);
    ptr += offset+1;
    offset = add_data("20",ptr);
    ptr += offset+1;    
    offset = add_data("23",ptr);
    ptr += offset+1;
    offset = add_data("25",ptr);
    ptr += offset;
    *ptr='\0';  
}

int init_curl(char * buffer)
{
    CURL * curl = NULL;
    CURLcode res = CURLE_OK;
    char url[256] = {0};
    int response_code = 0;
    struct curl_slist *http_headers = NULL;
    int ret = 0;

    curl_global_init(CURL_GLOBAL_ALL);
    
    curl = curl_easy_init();
    if (!curl)
    {
        PLUGIN_LOG(PLUGIN_ERROR, "curl init fail");
        return -1;
    }

    build_buffer(buffer);

    // snprintf(url, sizeof(url)-1,"http://%s/?client_ip=0.0.0.0",choose_random_server());
    snprintf(url, sizeof(url)-1,"http://127.0.0.1:5/ret/ate");
    
    PLUGIN_LOG(PLUGIN_NOTICE, "curl ask for [%s]",url);

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 20L);
    curl_easy_setopt(curl, CURLOPT_NOSIGNAL, 1L);

    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, buffer);

    res = curl_easy_perform(curl);
    if (CURLE_OK != res)
    {
        PLUGIN_LOG(PLUGIN_ERROR, "curl perform fail");
        ret = -1;
        goto CURL_RETURN;
    }
    
CURL_RETURN:
    curl_easy_cleanup(curl);
    curl_global_cleanup();

	return ret;
}

int main(int argc,void * argvp[])
{
    init_curl(buffer);
    return 0;
}
