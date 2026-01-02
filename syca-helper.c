#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[]){
    if(argc<2){ fprintf(stderr,"syca-helper: no command provided\n"); return 1; }
    if(setuid(0)!=0){ perror("setuid"); return 1; }
    execvp(argv[1], &argv[1]);
    perror("execvp");
    return 1;
}
