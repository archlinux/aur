#ifndef __POSTINSTALL_H__
#define __POSTINSTALL_H__

int create_env_variable(void);
int backup_shell(void);
void sub_variables(char *dest, size_t size, const char *src);
int edit_shell_json(void);
int postinstall(void);

#endif // __POSTINSTALL_H__
