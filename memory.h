#ifndef MEMORY_H
#define MEMORY_H

#include <string.h>
#include <stdlib.h>

#define NAME_LEN 100

typedef struct node List;
typedef struct curl Json_buffer;

void str_malloc(char **ptr, int size);
List *list_malloc(void);
Json_buffer *buffer_malloc(void);  

#endif