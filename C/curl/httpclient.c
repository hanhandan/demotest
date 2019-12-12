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
    offset = snprintf(ptr,strlen(input),"%s",input);
    ptr[offset]=0x01;
    return offset;
}

void build_buffer(char * buffer)
{
    char * ptr = buffer;
    int offset=0;
    offset = add_data("sn=OCPZ121151751",ptr);
    ptr += offset+1;
    offset = add_data("version=1.0.25",ptr);
    ptr += offset+1;
    offset = add_data("state=1",ptr);
    ptr += offset+1;
    offset = add_data("limit_min=5000",ptr);
    ptr += offset+1;
    offset = add_data("limit_max=100000",ptr);
    ptr += offset+1;
    offset = add_data("limit=100000",ptr);
    ptr += offset+1;
    offset = add_data("rate_max=82340",ptr);
    ptr += offset+1;
    offset = add_data("rate=63423",ptr);
    ptr += offset+1;
    offset = add_data("extern_ip=183.2.223.28",ptr);
    ptr += offset+1;
    offset = add_data("lost1=2",ptr);
    ptr += offset+1;
    offset = add_data("ping_host=www.baidu.com",ptr);
    ptr += offset+1;
    offset = add_data("ping_ip=14.215.177.39",ptr);
    ptr += offset+1;
    offset = add_data("lost2=10",ptr);
    ptr += offset+1;
    offset = add_data("rtt1=20",ptr);
    ptr += offset+1;    
    offset = add_data("rtt2=23",ptr);
    ptr += offset+1;
    offset = add_data("rtt3=25",ptr);
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
    snprintf(url, sizeof(url)-1,"http://127.0.0.1:51213/report/qos_state";
    
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
