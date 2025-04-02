#include <stdio.h>
#include <ctype.h>
#include "operation.h"
#include "memory.h"
#include "buffer.h"
#include "list.h"
#include "rpc.h"

#define PKGBUILD_CMD(item) "echo -n $(cd %s && echo $(less PKGBUILD | grep " \
#item "= | cut -f2 -d '=') | tr -d \"'\\\"\")"

bool epoch_update(List *pkg, char *pkgver);
char *not_on_aur(char *pkgname);
void install(const char *pkgname);

void target_clone(const char *url) {

    char *cmd = NULL, pkgname[NAME_LEN] = {'\0'};
    register int i;

    get_str(&cmd, "git clone %s", url);
    system(cmd);
    free(cmd);
    while (*url++ != '\0');
    while (*url != '/') {
        url--;
    }
    url++;
    for (i = 0; *url != '.'; i++) {
        pkgname[i] = *url++;
    }

    less_prompt(pkgname);
}

void aur_clone(const char *pkgname) {

    char *cmd = NULL;

    get_str(&cmd, "git clone https://aur.archlinux.org/%s.git", pkgname);
    system(cmd);

    less_prompt(pkgname);

    free(cmd);
}

void less_prompt(const char *pkgname) {

	char c, *cmd = NULL;
	register int i;

    printf("\033[1;34m:: \e[0;1mView %s PKGBUILD in less? [Y/n]\e[0m ", pkgname);
    for (;;) {
        c = tolower(getchar());
        if (c != '\n') {
			while (getchar() != '\n');
		}
        if (c == 'y' || c == '\n') {
            get_str(&cmd, "cd %s && less PKGBUILD", pkgname);
            system(cmd);
            free(cmd);
            printf("\033[1;34m:: \e[0;1mContinue to install? [Y/n]\e[0m ");
            for(;;) {
                c = tolower(getchar());
                if (c != '\n') {
                    while (getchar() != '\n');
                }
                if (c == 'y' || c == '\n') {
                    install(pkgname);
                    return;
                } else if (c == 'n') {
                    return;
                } 
            } 
        } else if (c == 'n') {
            free(cmd);
            install(pkgname);
            return;
        }
    }
}

void install(const char *pkgname) {
    
    char *cmd = NULL;

    get_str(&cmd, "cd %s && makepkg -sirc OPTIONS=-debug && git clean -dfx", pkgname); // don't build -debug packages for now.
    system(cmd);
    free(cmd);
}

void uninstall(char *pkgname) {

    char *cmd = NULL;
    
    get_str(&cmd, "sudo pacman -Rsc %s", pkgname);
    system(cmd);

    if (pkgname == NULL) {
        free(pkgname);
    }
    free(cmd);

    clean();
}

void clean(void) {

    char *cmd = NULL;
    List *dir, *pacman, *temp1, *temp2;

    get_list(&pacman, "echo -n $(pacman -Qmq)");
    get_list(&dir, "echo -n $(ls)");
    temp1 = pacman;
    temp2 = dir;
    
	temp1 = pacman;
    temp2 = dir;
    while (dir != NULL) {
        if (pacman == NULL || strcmp(dir->pkgname, pacman->pkgname) != 0) {
            printf("Removing %s from AUR directory...\n", dir->pkgname); 
            get_str(&cmd, "rm -rf %s", dir->pkgname);
            system(cmd);
        } else {
            get_str(&cmd, "cd %s && git clean -dfx", dir->pkgname);
            system(cmd);
            pacman = pacman->next;
            }
        dir = dir->next;
    }
    free(cmd);
    clear_list(temp1);
    clear_list(temp2);
}

void print_search(char *pkgname) {

    char *url = NULL;
    List *rpc_pkglist, *temp;

    get_str(&url, "https://aur.archlinux.org//rpc/v5/search/%s?by=name", pkgname);
    rpc_pkglist = get_rpc_data(url);

    for (temp = rpc_pkglist; temp != NULL; temp = temp->next) {
        printf("\e[1m%s \e[1;32m%s\e[0m\n", temp->pkgname, temp->pkgver);
    }

    free(url);
    clear_list(rpc_pkglist);
}

void list_packages(void) {
    
    system("pacman -Qm");
}

void update(void) {
	
	char c, *cmd = NULL, *update_list = NULL, *pkgver = NULL;
	register int i;
	List *pkglist, *rpc_pkg, *temp;

	str_malloc(&update_list, sizeof(char)); 	// must malloc here in order to realloc later on with strlen(update_list)

	get_list(&pkglist, "echo -n $(pacman -Qmq)");
	add_pkgver(pkglist);

	for (temp = pkglist; pkglist != NULL; pkglist = pkglist->next) {
	
		get_str(&cmd, "https://aur.archlinux.org/rpc/v5/info?arg[]=%s" , pkglist->pkgname);
		rpc_pkg = get_rpc_data(cmd);
		if (rpc_pkg->pkgname != NULL) {
			pkgver = rpc_pkg->pkgver;
		} else {
			pkgver = not_on_aur(pkglist->pkgname);
		}
		
		if (strcmp(pkglist->pkgver, pkgver) < 0 || epoch_update(pkglist, pkgver)) {  
			pkglist->update = true;
			str_malloc(&cmd, (strlen(pkglist->pkgname) + strlen(pkglist->pkgver) + strlen(pkgver) + 68));
			sprintf(cmd, "\e[0m\t%-30s\033[38;5;8m%-20s\e[0m->\t\e[1;32m%s\e[0m\n", pkglist->pkgname, pkglist->pkgver, pkgver);
			str_malloc(&update_list, (strlen(update_list) + strlen(cmd) + 1));
			strcat(update_list, cmd);
		}

		if (rpc_pkg->pkgname == NULL) {
			free(pkgver);
		}
		clear_list(rpc_pkg);
	}
	free(cmd);

	pkglist = temp;
	if (update_list[0] == '\0') {
		printf(" Nothing to do.\n");
		free(update_list);
		clear_list(pkglist);
		exit(EXIT_SUCCESS);
	} else {
		printf("\033[1;34m:: \e[0;1mUpdates are available for:\n\n%s\n", update_list);
		free(update_list);
	}

	printf("\033[1;34m:: \e[0;1mProceed with installation? [Y/n]\e[0m ");
	for(;;) {
		c = tolower(getchar());
		if (c != '\n') {
			while (getchar() != '\n');
		}
		if (c == 'y' || c == '\n') {
			List *temp = pkglist;
			while (pkglist != NULL) {
				if (pkglist->update == true) {
					pkglist->update = false;
					less_prompt(pkglist->pkgname);
				}
				pkglist = pkglist->next;
			}
			clear_list(temp);
			break;
		} else if (c == 'n') {
			clear_list(pkglist);
			break;
		}
	}
}

bool epoch_update(List *pkg, char *pkgver) {

	char *ins_pkgver, *upd_pkgver;
	
	ins_pkgver = pkg->pkgver;
	upd_pkgver = pkgver;

	while (*ins_pkgver != ':' && *ins_pkgver != '\0') {
		ins_pkgver++;
	}
	while (*upd_pkgver != ':' && *upd_pkgver != '\0') {
		upd_pkgver++;
	}

	if (*ins_pkgver == '\0' && *upd_pkgver == ':') {
		return true;
	} else {
		return false;
	}
}

char *not_on_aur(char *pkgname) {

	char *cmd = NULL, *full_ver = NULL;
	Buffer epoch = NULL, pkgver = NULL, pkgrel = NULL;

	// update pkgname source folder in ~/.config/aurmor
	get_str(&cmd, "cd %s && git pull &> /dev/null", pkgname);
	system(cmd);

	// get epoch for current pkgname from pkgbuild
	get_str(&cmd, PKGBUILD_CMD(epoch), pkgname);
	retrieve(cmd, &epoch);

	// get pkgver for current pkgname from pkgbuild
	get_str(&cmd, PKGBUILD_CMD(pkgver), pkgname);
	retrieve(cmd, &pkgver);

	// get pkgrel for current pkgname from pkgbuild
	get_str(&cmd, PKGBUILD_CMD(pkgrel), pkgname);
	retrieve(cmd, &pkgrel);	

	// copy epoch:pkgver-pkgrel into full_ver
	str_malloc(&full_ver, (strlen(epoch) + strlen(pkgver) + strlen(pkgrel)) + 3);
	if (epoch[0] == '\0') {
		sprintf(full_ver, "%s-%s", pkgver, pkgrel);
	} else if (pkgrel[0] == '\0') {
		sprintf(full_ver, "%s:%s", epoch, pkgver);
	} else if (epoch[0] == '\0' && pkgrel[0] == '\0') {
		sprintf(full_ver, "%s", pkgver);
	} else {
		sprintf(full_ver, "%s:%s-%s", epoch, pkgver, pkgrel);
	}
	free(cmd);
	free(epoch);
	free(pkgver);
	free(pkgrel);

	return full_ver;
}
