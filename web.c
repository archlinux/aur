#include "web.h"

STRING string_init() {
    String* pString = (String*) malloc(sizeof(String));
    if (pString != NULL) {
        pString->len = 0;
        pString->data = (char*) malloc(sizeof(char));
        if (pString->data == NULL) {
            fprintf(stderr, "malloc() failed\n");
            exit(EXIT_FAILURE);
        }
        pString->data[0] = '\0';
    } else {
        fprintf(stderr, "malloc() failed\n");
        exit(EXIT_FAILURE);
    }
    return pString;
}

size_t writefunc(void* ptr, size_t size, size_t nmemb, STRING hString) {
    String* pString = (String*) hString;
    size_t new_len = pString->len + size * nmemb;
    pString->data = realloc(pString->data, new_len + 1);
    if (pString->data == NULL) {
        fprintf(stderr, "realloc() failed\n");
        exit(EXIT_FAILURE);
    }
    memcpy(pString->data + pString->len, ptr, size * nmemb);
    pString->data[new_len] = '\0';
    pString->len = new_len;
    return size * nmemb;
}

void string_write_data_cmc(STRING hString, char* id) {
    String* pString = (String*) hString;
    CURL* curl = curl_easy_init();
    CURLcode res;
    size_t len = strlen(id);
    char* cmc = malloc(len + 41);
    memcpy(cmc, "https://api.coinmarketcap.com/v1/ticker/", 40);
    memcpy(&cmc[40], id, len);
    cmc[40 + len] = '\0';
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, cmc);
        free(cmc);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writefunc);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &pString->data);
        res = curl_easy_perform(curl);
        curl_easy_cleanup(curl);
        if (res != CURLE_OK) {
            printf("Failed to receive response from server!\n");
            exit(EXIT_FAILURE);
        }
        if (pString->data[0] != '[') {
            printf("Invalid currency!\n");
            exit(EXIT_FAILURE);
        }
    }
}

void string_destroy(STRING* phString) {
    String* pString = (String*) *phString;
    free(pString->data);
    free(*phString);
    *phString = NULL;
}