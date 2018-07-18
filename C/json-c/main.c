#include <stdio.h>
#include <json-c/json.h>
json_object *json_array = NULL;
int init_array (void)
{
    json_array = json_object_new_array();
    int i =0;

    for (i = 0;i <10; i++)
    {
    json_object* json_object = json_object_new_object();
    json_object_object_add(json_object, "timestamp", json_object_new_string("12345678"));
    json_object_object_add(json_object, "sn", json_object_new_string("OCPG110200033"));
    json_object_object_add(json_object, "package", json_object_new_string("package_name"));
    json_object_object_add(json_object, "status", json_object_new_string("installed"));
    json_object_object_add(json_object, "version", json_object_new_string("1.0.1"));
    json_object_object_add(json_object, "latest_version", json_object_new_string("1.0.0"));
    json_object_object_add(json_object, "installed_time", json_object_new_string("11223344"));
    json_object_array_add(json_array,      json_object);
    }
    json_object_put(json_array);
}
void test_jsonc()  
{  
  
    struct json_object *infor_object = NULL;  
    infor_object = json_object_new_object();  
    if (NULL == infor_object)  
    {  
        printf("new json object failed.\n");  
        return;  
    }  
  
    struct json_object *para_object = NULL;  
    para_object = json_object_new_object();  
    if (NULL == para_object)  
    {  
        json_object_put(infor_object);//free  
        printf("new json object failed.\n");  
        return;  
    }  
  
    struct json_object *array_object = NULL;  
    array_object = json_object_new_array();  
    if (NULL == array_object)  
    {  
        json_object_put(infor_object);//free  
        json_object_put(para_object);//free  
        printf("new json object failed.\n");  
        return;  
    }  
  
    /*添加json值类型到数组中*/  
    json_object_array_add(array_object, json_object_new_int(256));  
    json_object_array_add(array_object, json_object_new_int(257));  
    json_object_array_add(array_object, json_object_new_int(258));  
  
    json_object_object_add(para_object, "DeviceId", json_object_new_string("sn_iso_9000"));  
    json_object_object_add(para_object, "MacAddr", json_object_new_string("AA:BB:CC:DD:EE:FF"));  
    json_object_object_add(para_object, "Visible", json_object_new_int(1));  
  
    /*添加json名称和值到json对象集合中*/  
    json_object_object_add(infor_object, "method", json_object_new_string("GetSystemInfo"));  
    json_object_object_add(infor_object, "param", para_object);  
    json_object_object_add(infor_object, "id", json_object_new_string("101"));  
  
    /*添加数组集合到json对象中*/  
    json_object_object_add(infor_object, "array", array_object);  
    json_object_to_file("1.json",infor_object); 
    
    struct json_object *result_object = NULL;  
    
    result_object =  json_object_object_get(infor_object, "method");  
    printf("-----------result_object method ---------------------------\n");  
    printf("%s\n", json_object_to_json_string(result_object));  
    printf("-----------result_object method---------------------------\n");  
  
    result_object =  json_object_object_get(infor_object, "param");  
    printf("-----------result_object param ---------------------------\n");  
    printf("%s\n", json_object_to_json_string(result_object));  
    printf("-----------result_object param---------------------------\n");  
  
    result_object =  json_object_object_get(infor_object, "array");  
    printf("-----------result_object  array---------------------------\n");  
    printf("%s\n", json_object_to_json_string(result_object));  
    printf("-----------result_object array---------------------------\n");  
  
    int i;  
    for(i = 0; i < json_object_array_length(result_object); i++) {  
      struct json_object *obj = json_object_array_get_idx(result_object, i);  
      printf("\t[%d]=%s\n", i, json_object_to_json_string(obj));  
    }  
 
    struct json_object *file_object = NULL;  
    unsigned int filesize = 0;
    FILE *fp;  
    fp = fopen("1.json", "r");  
    fseek(fp, 0L, SEEK_END);  
    filesize = ftell(fp);    
    printf("filesize is %d \n",filesize);
    fclose(fp);
 
    FILE *fp2;  
    char *file;
    fp2 = fopen("1.json", "r");
    file = (char *)malloc(filesize + 1);
    fseek(fp2, SEEK_SET, 0);
    fread(file,1,filesize,fp2);
    file_object = json_tokener_parse(file);
    fclose(fp2);
    json_object_to_file("2.json",file_object);
 
    printf("-----------json infor ---------------------------\n");  
    printf("%s\n", json_object_to_json_string(infor_object));  
    printf("-----------json infor ---------------------------\n");  
 
    json_object_put(infor_object);//free 
    json_object_put(file_object);//free 
  
}  
  
  
int main(int argc, char *argv[])  
{  
    test_jsonc();  
  
    return 0;  
} 