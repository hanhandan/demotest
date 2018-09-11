#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <string.h>

void DomainToIP(const char * host, const char *portStr, char *ip){
        struct addrinfo hints, *res, *res0;
        char str[32] = {0};

        memset(&hints, 0, sizeof(hints));
        hints.ai_family   = PF_UNSPEC;
        hints.ai_socktype = SOCK_STREAM;
        hints.ai_protocol = IPPROTO_TCP;
        hints.ai_flags    = AI_PASSIVE;

        int ret = getaddrinfo(host, portStr, &hints, &res0);
        if (ret != 0) {
            fprintf(stderr,"getaddrinfo: %s\n",
                    gai_strerror(ret));
             return;
        }

        for(res = res0; res; res = res->ai_next){
            if(res->ai_family == AF_INET){
                // Found IPv4 address
                inet_ntop(AF_INET,
                          &(((struct sockaddr_in *)(res->ai_addr))->sin_addr),
                          str, 32);
                strncpy(ip, str, 32);
            }else if(res->ai_family == AF_INET6){
                // Found IPv6 address
                inet_ntop(AF_INET6,
                          &(((struct sockaddr_in *)(res->ai_addr))->sin_addr),
                          str, 32);
                printf("解析出来的IP6: %s\n", str);
                strncpy(ip, str, 32);
            }
        }
        freeaddrinfo(res0);
    }

int main(int args,void * argv[])
{
  char * port = "80";
  char ip[32]={'\0'};
  DomainToIP(argv[1],port,ip);
  printf("%s %s\n",argv[1],ip);
  return 0;
}
