#include "iex.h"

String* iex_string_init() {
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

size_t iex_string_writefunc(void* ptr, size_t size, size_t nmemb, String* hString) {
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

double iex_get_current_price(char* ticker_name_string) {
    size_t ticker_name_len = strlen(ticker_name_string);
    char* iex_api_string = calloc(64, sizeof(char));
    memcpy(iex_api_string, "https://api.iextrading.com/1.0/stock/", 37);
    memcpy(&iex_api_string[37], ticker_name_string, ticker_name_len);
    memcpy(&iex_api_string[37 + ticker_name_len], "/quote/latestPrice", 18);

    String* pString = iex_string_init();
    CURL* curl = curl_easy_init();
    CURLcode res;
    curl_global_init(CURL_GLOBAL_DEFAULT);
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, iex_api_string);
        free(iex_api_string);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, iex_string_writefunc);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &pString->data);
        res = curl_easy_perform(curl);
        curl_easy_cleanup(curl);
        if (res != CURLE_OK) {
            printf("Failed to receive response from server!\n");
            return -1;
        }
        if (strcmp(pString->data, "Unknown symbol") == 0) {
            printf("Invalid stock!\n");
            return -1;
        }
    }
    double ret = strtod(pString->data, NULL);
    iex_string_destroy(&pString);
    return ret;
}

void iex_string_destroy(String** phString){
    String* pString = *phString;
    free(pString->data);
    free(*phString);
    *phString = NULL;
}

