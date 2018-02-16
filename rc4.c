#include <ncurses.h>
#include <stdlib.h>
#include "rc4.h"

#define PASS_MAX 32
#define BACKSPACE 127

char* getPassword() {
    unsigned char* pass = calloc(PASS_MAX, sizeof(char));
    initscr();
    noecho();
    unsigned int c, i = 0;
    printw("Enter Password: ");
    while ((c = (unsigned)getch()) && c != '\n' && i <= PASS_MAX) {
        if (c != BACKSPACE) {
            pass[i] = (char) c;
            i++;
        } else if (i > 0)
            pass[i - 1] = '\0';
    }
    endwin();
    return (char*)pass;
}

void keyExchange(int keySchedule[], int len, const unsigned char* key) {
    int j = 0;
    for (int i = 0; i < 256; ++i)
        keySchedule[i] = i;
    for (int i = 0; i < 256; ++i) {
        j = (j + keySchedule[i] + key[i % len]) % 256;
        int temp = keySchedule[i];
        keySchedule[i] = keySchedule[j];
        keySchedule[j] = temp;
    }
}

char* prga(int keySchedule[], int len) {
    int i = 0;
    int j = 0;
    char* output = (char*) malloc((size_t)len);
    for (int k = 0; k < len; ++k) {
        i = (i + 1) % 256;
        j = (j + keySchedule[i]) % 256;
        int temp = keySchedule[i];
        keySchedule[i] = keySchedule[j];
        keySchedule[j] = temp;
        output[k] = (unsigned char) keySchedule[(keySchedule[i] + keySchedule[j]) % 256];
    }
    return output;
}

void rc4(const unsigned char output[], const unsigned char message[], FILE* out, long int len) {
    for (int i = 0; i < len; ++i)
        fprintf(out, "%c", output[i] ^ message[i]);
    printf("\n");
}