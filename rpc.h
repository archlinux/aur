#ifndef RPC_H
#define RPC_H

typedef struct curl {
    char *response;
    int size;
} Json_buffer;

typedef struct node List;

char *curl(char *url);
List *get_rpc_data(char *url);
List *json(char *buffer); 

#endif