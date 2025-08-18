/* hfc.h */

#ifndef HFC_H
#define HFC_H

#include "get.h"
#include "hfc.h"

#define MAX_ENTRIES     100
#define MAX_LINE_LEN    256
#define HFC_VERSION "0.0.1"

extern int domain_count;
extern int in_help_mode;
extern int highlight;
extern int updates_count;
extern int entry_count;
extern int is_checking;
extern volatile int update_progress;

extern int selected[MAX_ENTRIES];
extern int update_pipe[2];
extern int updates_counts[MAX_ENTRIES];
extern int domains_counts[MAX_ENTRIES];

extern Domain domains[MAX_ENTRIES];
extern char *entries[MAX_ENTRIES];
extern char urls_path[256];
extern char counts_path[256];
extern const char *hosts_path;

#endif
