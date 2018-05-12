#include "rc4.h"

char* rc4_getPassword(void) {
    unsigned char* pass = malloc(PASS_MAX + 1);
    pointer_alloc_check(pass);
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

void rc4_encode_string(String* pString, char* password) {
    int keySchedule[256];
    size_t key_len = strlen(password);
    int j = 0, out;

    // KEY EXCHANGE
    for (int i = 0; i < KEY_SCHEDULE_LENGTH; i++)
        keySchedule[i] = i;
    int temp;
    for (int i = 0; i < KEY_SCHEDULE_LENGTH; i++) {
        j = (j + keySchedule[i] + password[i % key_len]) % KEY_SCHEDULE_LENGTH;
        temp = keySchedule[i];
        keySchedule[i] = keySchedule[j];
        keySchedule[j] = temp;
    }

    // PRGA
    int i = 0;
    j = 0;
    for (size_t k = 0; k < pString->len; k++) {
        i = (i + 1) % KEY_SCHEDULE_LENGTH;
        j = (j + keySchedule[i]) % KEY_SCHEDULE_LENGTH;
        temp = keySchedule[i];
        keySchedule[i] = keySchedule[j];
        keySchedule[j] = temp;
        out = (unsigned char) keySchedule[(keySchedule[i] + keySchedule[j]) % KEY_SCHEDULE_LENGTH];
        pString->data[k] ^= out; // XOR to encode/decode
    }
}