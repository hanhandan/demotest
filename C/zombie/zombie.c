#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <stdlib.h>

int main()
{
    int pid_count=0;
    pid_t pid;
    while (1)
    {
        pid_count ++;
        pid = fork();
        if (pid < 0)
        {
            perror("fork error:");
            fprintf (stderr,"error number,%d\n",errno);
            exit(1);
        }
        else if (pid == 0)
        {

            printf("I am child process.I am exiting. pid count %d\n",pid_count);
            exit(0);
        }
        printf("I am father process.I will sleep two seconds\n");
    //等待子进程先退出
    }
    //输出进程信息
    // system("ps -o pid,ppid,stat,comm,args");
    printf("father process is exiting.\n");
    return 0;
}