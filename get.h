/* get.h */

#ifndef GET_H
#define GET_H

#include <stddef.h>

typedef struct Host {
    char *name;
    struct Host *next;
} Host;

typedef struct Domain {
    char *url;
    Host *hosts;
} Domain;

char *download_url(const char *url, char *error_msg, size_t err_size);
long get_remote_content_length(const char *url);
int contains_valid_hosts_entry(const char *content);
int save_to_hosts_file(const char *content, const char *url, int number);

#endif

