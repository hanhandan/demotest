#include <stdio.h>  
#include <unistd.h>  
#include <strings.h>  
#include <stdlib.h>  
#include <sys/types.h>  
#include <sys/socket.h>  
#include <netinet/in.h>  
#include <netdb.h>  
#include <string>  
#include <iostream>  
#include "test.pb.h"  
  
#define HOST "localhost"  
#define PORT 8888  
#define MAXDATASIZE 100  
  
using namespace std;  
  
int main(int argc, char ** argv)  
{  
  int fd, numbytes;  
  char buf[MAXDATASIZE];  
  struct hostent *he;  
  struct sockaddr_in server;  
    
  if (argc != 2) {  
    printf("Usage: %s \"IP\"\n",argv[0]);  
    exit(0);  
  }   
    
  he = gethostbyname(argv[1]);  
  fd = socket(AF_INET, SOCK_STREAM, 0);  
  bzero(&server, sizeof(server));  
  server.sin_family = AF_INET;  
  server.sin_port = htons(PORT);  
  server.sin_addr = *((struct in_addr *)he->h_addr);  
  
  connect(fd, (struct sockaddr *)&server, sizeof(struct sockaddr));  
  
  send(fd, "GET PEOPLE", 20, 0);  
  
  numbytes = recv(fd, buf, MAXDATASIZE, 0);  
  buf[numbytes] = '\0';  
  string data = buf;  
  test::People p;  
  p.ParseFromString(data);  
  cout << "People: " << endl;  
  cout << "Name: " << p.name() << endl;  
  cout << "ID: " << p.id() << endl;  
  cout << "Email: " << p.email() << endl;  
  
  close(fd);  
  return 0;  
}
