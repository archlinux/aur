#include <stdio.h>
#include "memory.h"
#include "list.h"
#include "rpc.h"

void str_malloc(char **ptr, int size) {
	
	if (*ptr == NULL) {
		*ptr = malloc(size);
		if (*ptr == NULL) {
			printf("\033[1;31mERROR: \e[0;1mFailed to allocate memory for string.\e[0m\n");
			exit(EXIT_FAILURE);
		} else {
				*ptr[0] = '\0';
		}
	} else {
		char *temp;

		temp = realloc(*ptr, size);
		if (temp == NULL) {
			printf("\033[1;31mERROR: \e[0;1mFailed to reallocate memory of string.\e[0m\n");
			exit(EXIT_FAILURE);
		}
		*ptr = temp;
	}
}

List *list_malloc(void) {

	List *temp = malloc(sizeof(List));
	if (temp == NULL) {
		printf("\033[1;31mERROR: \e[0;1mFailed to allocate memory for new node.\e[0m\n");
		exit(EXIT_FAILURE);
	}

	temp->pkgname = NULL;
	temp->pkgver = NULL;
	temp->pop = 0;
	temp->update = false;
	temp->next = NULL;
	
	return temp;
}

Json_buffer *buffer_malloc(void) {

	Json_buffer *temp = malloc(sizeof(Json_buffer));
	if (temp == NULL) {
		printf("\033[1;31mERROR: \e[0;1mFailed to allocate memory for JSON buffer.\e[0m\n");
		exit(EXIT_FAILURE);
	}
	temp->response = NULL;
    str_malloc(&temp->response, sizeof(char *));
    temp->response[0] = '\0';
    temp->size = 0;

	return temp;
}
