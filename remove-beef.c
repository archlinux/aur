#include <stdio.h>

int main(){
           system("sudo rm -rf /usr/share/beef /usr/bin/beef-xss-update /usr/bin/beef-xss");
           system("sudo pacman -Rsn beef-xss-git");
           printf("\033[22;34mSuccessfully uninstalled beef-xss\033[0m\n");
           return 0;
}
