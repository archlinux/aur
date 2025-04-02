#ifndef OPERATION_H
#define OPERATION_H

void target_clone(const char *url);
void aur_clone(const char *pkgnmae);
void less_prompt(const char *pkgname);
void uninstall(char *pkgnames);
void clean(void);
void print_search(char *pkgname);
void list_packages(void);
void update(void);

#endif