#include "rc4.h"

char* rc4_getPassword() {
    unsigned char* pass = malloc(PASS_MAX + 1);
    if (pass == NULL) {
        fprintf(stderr, "malloc() failed\n");
        return NULL;
    }
    initscr();
    noecho(); // Doesn't echo chars when typed
    unsigned int c, i;
    do {
        printw("Enter Password (32 character max): ");
        memset(pass, '\0', PASS_MAX + 1);
        i = 0, c = 0;
        while (c != '\n' && (c = (unsigned) getch())) {
            if (c != BACKSPACE) {
                pass[i] = (char) c;
                i++;
                if (i > PASS_MAX) { // Breaks loop if more than max
                    c = '\n';
                    printw("\n");
                }
            } else if (i > 0) // If backspace
                pass[i - 1] = '\0';
        }
    } while (i > PASS_MAX);
    clear();
    endwin();
    return (char*) pass;
}

void rc4_key_exchange(int keySchedule[KEY_SCHEDULE_LENGTH], char* key) {
    size_t len = strlen(key);
    int j = 0;
    for (int i = 0; i < KEY_SCHEDULE_LENGTH; i++)
        keySchedule[i] = i;
    int temp;
    for (int i = 0; i < KEY_SCHEDULE_LENGTH; i++) {
        j = (j + keySchedule[i] + key[i % len]) % KEY_SCHEDULE_LENGTH;
        temp = keySchedule[i];
        keySchedule[i] = keySchedule[j];
        keySchedule[j] = temp;
    }
}

char* rc4_prga(int keySchedule[KEY_SCHEDULE_LENGTH], size_t len) {
    int i = 0, j = 0, temp;
    char* output = malloc(len);
    if (output == NULL) {
        fprintf(stderr, "malloc() failed\n");
        return NULL;
    }
    for (int k = 0; k < len; k++) {
        i = (i + 1) % KEY_SCHEDULE_LENGTH;
        j = (j + keySchedule[i]) % KEY_SCHEDULE_LENGTH;
        temp = keySchedule[i];
        keySchedule[i] = keySchedule[j];
        keySchedule[j] = temp;
        output[k] = (unsigned char) keySchedule[(keySchedule[i] + keySchedule[j]) % KEY_SCHEDULE_LENGTH];
    }
    return output;
}

void rc4_execute(char* output, char* message, size_t len) {
    for (int i = 0; i < len; i++)
        output[i] ^= message[i];
}