#include <stdio.h>
#include "list.h"
#include "memory.h"
#include "buffer.h"

void get_list(List **list, char *cmd) {

    char pkgname[NAME_LEN];
    Buffer pacman_list = NULL, temp = NULL;
    register int i;

    *list = list_malloc();
    
	retrieve(cmd, &pacman_list);
    temp = pacman_list;
    while (*pacman_list != '\0') {
		for (i = 0; i < NAME_LEN; i++) {
			pkgname[i] = '\0';
		}
		for (i = 0; *pacman_list != ' ' && *pacman_list != '\0'; i++) {
			pkgname[i] = *pacman_list++;	
		}
		if (*pacman_list != '\0') {
			pacman_list++;
		}
		add_pkgname(*list, pkgname);
    }
    free(temp);
}

// Add packages in reversed order
List *add_pkgname(List *list, char *pkgname) {
    
    if (list->pkgname == NULL) {
        str_malloc(&list->pkgname, strlen(pkgname) + 1);
        strcpy(list->pkgname, pkgname);  
    } else {
        List *cur, *prev, *temp;
        
        temp = list_malloc();
        str_malloc(&temp->pkgname, strlen(pkgname) + 1);
        strcpy(temp->pkgname, pkgname);
        for (cur = list, prev = NULL; cur != NULL; prev = cur, cur = cur->next);
        if (prev != NULL) {
            prev->next = temp;
        }
    }
    
    return list;
}

// Calls from uninstall wont have versions so this needs to be done separately.
void add_pkgver(List *list) {
    
    char *cmd = NULL;

    while (list != NULL) {
       	get_str(&cmd, "echo -n $(pacman -Qm | grep %s | cut -f2 -d ' ')", list->pkgname);
        retrieve(cmd, &list->pkgver);

        list = list->next;
    }
    free(cmd);
}

// Store data retrieved from json in rpc.c
List *add_json_data(List *list, const char *pkgname, const char *pkgver, int pop) {

    if (pkgname == NULL) {
        return list;
    } 
    
    if (list->pkgname == NULL) {
        str_malloc(&list->pkgname, strlen(pkgname) + 1);
        strcpy(list->pkgname, pkgname);
        str_malloc(&list->pkgver, strlen(pkgver) + 1);
        strcpy(list->pkgver, pkgver);
        list->pop = pop;
    } else {
        List *cur, *prev, *temp;
        
        temp = list_malloc();

        str_malloc(&temp->pkgname, strlen(pkgname) + 1);
        strcpy(temp->pkgname, pkgname);
        str_malloc(&temp->pkgver, strlen(pkgver) + 1);
        strcpy(temp->pkgver, pkgver);
        temp->pop = pop;
        for (cur = list, prev = NULL; cur != NULL && cur->pop >= temp->pop; prev = cur, cur = cur->next);
        temp->next = cur;
        if (prev == NULL) {
            list = temp;
        } else {
            prev->next = temp;
        }
    }
    return list;
}

List *find_pkg(List *list, char *pkgname) {

    List *temp;

    for (temp = list; temp != NULL; temp = temp->next) {
        if (strcmp(temp->pkgname, pkgname) == 0) {
            break;
        }
    }
    if (temp == NULL) {
        return NULL;
    } else {
        return temp;
    }
}

void clear_list(List *list) {
    
    List *temp;

    while (list != NULL) {
        temp = list;
        list = list->next;
        free(temp->pkgname);
        free(temp->pkgver);
        free(temp);
    }
}
