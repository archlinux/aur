#include "rc4.h"

char* rc4_ncurses_get_password(void) {
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

void rc4_encode_string(String* pString, const char password[PASS_MAX]) {
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

int rc4_ncurses_decrypt_string(String* pString, char** password_ref) {
    int status = 1;
    Json* jobj = json_tokener_parse(pString->data); // Make sure portfolio is JSON formatted
    if (jobj == NULL || !json_object_is_type(jobj, json_type_array)) { // if not JSON array, decrypt
        char* password = rc4_ncurses_get_password();
        puts("Decrypting portfolio...");
        rc4_encode_string(pString, password); // Decode using password
        jobj = json_tokener_parse(pString->data);
        if (jobj == NULL || !json_object_is_type(jobj, json_type_array)) { // Wrong pw if not JSON[]
            puts("Wrong password!");
            status = 0; // false
            free(password);
        } else if (password_ref != NULL) // If provided a string reference, strcpy
            *password_ref = password; // This is used for re-encrypting the portfolio
        else free(password);
    }
    json_object_put(jobj);
    return status;
}

void portfolio_write_encrypt_decrypt(int crypt_opt) {
    char* password = NULL;
    String* pString = file_get_string(portfolio_file_path);
    if (pString == NULL) // Error reading portfolio
        return;

    if (!rc4_ncurses_decrypt_string(pString, &password)) // Error decrypting
        goto cleanup;

    if (crypt_opt == ENCRYPT && password != NULL) // Trying to encrypt an encrypted portfolio
        GOTO_CLEAN_MSG("Portfolio is already encrypted.")

    if (crypt_opt == DECRYPT && password == NULL) // Trying to decrypt a plaintext portfolio
        GOTO_CLEAN_MSG("Portfolio isn't encrypted.")

    if (crypt_opt == DECRYPT) {
        string_write_file(pString, portfolio_file_path);
        GOTO_CLEAN_MSG("Decrypted successfully")
    }

    // ENCRYPT
    password = rc4_ncurses_get_password();
    puts("You will be asked to enter your password again to make sure the entries match.");
    sleep(2); // Sleep so user can read above message before ncurses initscr()
    char* password_check = rc4_ncurses_get_password(); // Get password a second time
    if (!streq(password, password_check)) { // Make sure the two passwords are the same
        free(password_check);
        GOTO_CLEAN_MSG("Passwords do not match!")
    }
    rc4_encode_string(pString, password);
    string_write_file(pString, portfolio_file_path);
    puts("Encrypted successfully");
    free(password_check);
    cleanup: // CLEANUP
    free(password);
    string_destroy(&pString);
}