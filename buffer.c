#include <stdio.h>
#include "buffer.h"
#include "memory.h"

void retrieve(const char *cmd, char **buffer_ptr) {
	
	char *temp = NULL;
	FILE *p;	
	
	str_malloc(&temp, MAX_BUFFER);

	p = popen(cmd, "r");
	if (p == NULL) {
		printf("\033[1;31mERROR: \e[0;1mFailed in buffer().\e[0m");
		exit(EXIT_FAILURE);
	}
	fgets(temp, MAX_BUFFER, p);
	str_malloc(buffer_ptr, (strlen(temp) + 1));
	strcpy(*buffer_ptr, temp);
	free(temp);

	pclose(p);
}

void get_str(char **cmd, const char *str, const char *str_var) {
	
	if (str_var != NULL) {
		str_malloc(cmd, strlen(str) + strlen(str_var) - 1);
		sprintf(*cmd, str, str_var);
	} else {
		str_malloc(cmd, strlen(str) + 1);
		sprintf(*cmd, str);
	}
}
