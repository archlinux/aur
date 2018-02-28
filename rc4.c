#include "rc4.h"

char* rc4_getPassword(void) {
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
    for (int k = 0; k < (int) len; k++) {
        i = (i + 1) % KEY_SCHEDULE_LENGTH;
        j = (j + keySchedule[i]) % KEY_SCHEDULE_LENGTH;
        temp = keySchedule[i];
        keySchedule[i] = keySchedule[j];
        keySchedule[j] = temp;
        output[k] = (unsigned char) keySchedule[(keySchedule[i] + keySchedule[j]) % KEY_SCHEDULE_LENGTH];
    }
    return output;
}

void rc4_execute(char* output, String* pString) {
    for (int i = 0; i < (int) pString->len; i++)
        output[i] ^= pString->data[i];
}

char* rc4_encode_string(String* pString, char* password){
    int keySchedule[256];
    rc4_key_exchange(keySchedule, password);
    char* output = rc4_prga(keySchedule, pString->len);
    rc4_execute(output, pString);
    return output;
}

String* rc4_get_crypted_string(String* input_pString, char* password, int option) {
    String* output_pString = NULL;
    int free_pw = (password == NULL);
    Json* jobj = json_tokener_parse(input_pString->data);
    if (option == ENCRYPT && jobj == NULL) // If trying to encrypt an encrypted portfolio
        printf("Your portfolio is already encrypted.\n");
    else if (option == DECRYPT && jobj != NULL) // If trying to decrypt an unencrypted portfolio
        printf("Your portfolio isn't encrypted.\n");
    else {
        if (password == NULL) { // Get password if not provided
            password = rc4_getPassword();
            if (option == ENCRYPT) { // When encrypting, ask to enter pw twice to make sure
                printf("You will be asked to enter your password again to make sure the entries match.\n");
                sleep(2);
                char* passwordCheck = rc4_getPassword();
                if (strcmp(password, passwordCheck) != 0) {
                    printf("Passwords do not match!\n");
                    free(password);
                    free(passwordCheck);
                    json_object_put(jobj);
                    return NULL;
                }
                free(passwordCheck);
            }
        }
        output_pString = string_init(); // Set ouput string to en/decrypted data
        free(output_pString->data);
        output_pString->data = rc4_encode_string(input_pString, password);
        output_pString->len = input_pString->len;
        if (option == DECRYPT) {
            json_object_put(jobj);
            output_pString->data = realloc(output_pString->data, output_pString->len + 1);// Realloc to add null terminator for json parsing
            if (output_pString->data == NULL) {                // Dealing with len is annoying so it's easier to just realloc
                fprintf(stderr, "realloc() failed\n");
                exit(EXIT_FAILURE);
            }
            output_pString->data[output_pString->len] = '\0'; // Null terminate string for parsing
            jobj = json_tokener_parse(output_pString->data);
            if (jobj == NULL) { // If after decrypting, the portfolio is not JSON formatted,
                printf("Wrong password!\n"); // then it's the wrong password
                free(password);
                string_destroy(&output_pString);
                return NULL;
            }
        }
        if (free_pw) { // If being called from main
            free(password);
            if (option == ENCRYPT)
                printf("Successfully encrypted your portfolio.\n");
            else printf("Successfully decrypted your portfolio.\n");
        }
    }
    json_object_put(jobj);
    return output_pString;
}