#include <stdio.h>
#include <stdlib.h>
#include <time.h>



int main(int argc, char *argv[]) {
    if (argv[1]) {
        time_t arg = atoi(argv[1]);
        time_t ts = arg; 
        char *date = ctime(&ts);
        printf("%s", date);
    } else {
        printf("\nTimestamp expected, usage: Filename <timestamp>");
        exit(1);
    }
}