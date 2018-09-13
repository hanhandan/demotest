#include<stdio.h>
#include<string.h>

/*
* Quick sort
*/

int quick_sort(int data[],int len)
{
  int value;
  int i = 1;
  int index = 0;
  int j = len - 1;
  int pos = 0;
  value = data[0];

  if (len == 1)
    return 0;

  while (i<j)
  {

    if (pos<i)
    {
      do{
        if(data[j] < value)
        {
          data[pos] = data[j];
          pos = j;
          j--;
          break;
        }
        j--;
      }while(j>i);
    }

    if (pos > i)
    {
      do{
        if(data[i] > value)
        {
          data[pos] = data[i];
          pos = i;
          i++;
          break;
        }
        i++;
      }while(j>i);
    }
    // for (index=0;index<len;index++)
    // {
    //   printf(" %d",data[index]);
    // }
    //
    // printf("     i %d,j %d,pos %d\n", i,j,pos);
  }

  data[pos] = value;
  // for (index=0;index<len;index++)
  // {
  //   printf(" %d",data[index]);
  // }
  // printf("\n");
  //
  quick_sort(&data[0],pos+1);
  quick_sort(&(data[pos+1]),len-pos-1);
}

int main()
{
    int data[10] = {88,20,50,10,59,381,305,60,1,99};
    int i =0;
    for (i=0;i<10;i++)
    {
      printf(" %d",data[i]);
    }
    printf("\n");
    quick_sort(data,10);
    for (i=0;i<10;i++)
    {
      printf(" %d",data[i]);
    }
    printf("\n");
}
