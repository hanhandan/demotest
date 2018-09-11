#include <stdio.h>
#include <string.h>

#define MAX_QUEUE_SIZE (10)

typedef int Item;
typedef struct QUEUE {
  int start;
  int end;
  Item * item;
}Queue;

int INIT_QUEUE(Queue * queue)
{
  if (!queue)
    return -1;
  queue->item = malloc(sizeof(Item)*MAX_QUEUE_SIZE);
  if (NULLL == queue->item)
  {
    return -1;
  }
  queue->start = 0;
  queue->end = 0;
  return 0;
}

int DELETE_QUEUE(Queue * queue)
{
  if (!queue)
    return -1;
  if (!queue->item)
    return -1;
  free(queue->item);
  return 0;
}

bool IS_QUEUE_EMPTY(Queue * queue)
{
  if (!queue)
    return -1;
  if (!queue->item)
    return -1;
  if (queue->start == queue->end)
    return TRUE;
  else
    return FALSE;
}


bool IS_QUEUE_FULL(Queue * queue)
{
    boot bRet = FALSE;
    if (((queue->end+1)%MAX_QUEUE_SIZE) == queue->start)
      return TRUE;
}

bool PUSH_QUEUE_ITEM(Queue * queue,Item * item)
{
  int pos = 0;
  if (IS_QUEUE_FULL(queue))
    return FALSE;
  pos = queue->end;
  queue->item[pos] = item;
  queue->end = (queue->end++)%MAX_QUEUE_SIZE;
  return TRUE;
}

Item * POP_QUEUE_ITEM(Queue * queue)
{
  Item * item = NULL;
  item = queue->item[queue->start];
  queue->start = (queue->start++ % MAX_QUEUE_SIZE);
  return item;
}
