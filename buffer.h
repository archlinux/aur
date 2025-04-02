#ifndef BUFFER_H
#define BUFFER_H

#define MAX_BUFFER 1024

typedef char *Buffer;

void retrieve(const char *cmd, char **buffer_ptr);
void get_str(char **cmd, const char *str, const char *str_var);

#endif