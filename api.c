#include "api.h"

String* api_string_init() {
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

size_t api_string_writefunc(void* ptr, size_t size, size_t nmemb, String* hString) {
    String* pString = hString;
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

String* api_curl_data(char* url) {
    String* pString = api_string_init();
    CURL* curl = curl_easy_init();
    CURLcode res;
    curl_global_init(CURL_GLOBAL_DEFAULT);
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, api_string_writefunc);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &pString->data);
        res = curl_easy_perform(curl);
        curl_easy_cleanup(curl);
        if (res != CURLE_OK)
            return NULL;
    }
    return pString;
}

double api_get_current_price(char* ticker_name_string) {
    double val = iex_get_current_price(ticker_name_string);
    if (val != -1)
        return val;
    val = alphavantage_get_current_price(ticker_name_string);
    if (val != -1)
        return val;
    printf("Invalid symbol.\n");
    return -1;
}

double iex_get_current_price(char* ticker_name_string) {
    size_t ticker_name_len = strlen(ticker_name_string);
    char* iex_api_string = calloc(64, sizeof(char));
    memcpy(iex_api_string, "https://api.iextrading.com/1.0/stock/", 37);
    memcpy(&iex_api_string[37], ticker_name_string, ticker_name_len);
    memcpy(&iex_api_string[37 + ticker_name_len], "/quote/latestPrice", 18);

    String* pString = api_curl_data(iex_api_string);
    if (strcmp(pString->data, "Unknown symbol") == 0)
        return -1;
    free(iex_api_string);
    double ret = strtod(pString->data, NULL);
    api_string_destroy(&pString);
    return ret;
}

double alphavantage_get_current_price(char* ticker_name_string) {
    char* av_str = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&interval=1min&apikey=DFUMLJ1ILOM2G7IH&datatype=csv&symbol=";
    char* alphavantage_api_string = calloc(128, sizeof(char));
    memcpy(alphavantage_api_string, av_str, 128);
    size_t av_len = strlen(alphavantage_api_string);
    memcpy(&alphavantage_api_string[av_len], ticker_name_string, 10);
    String* pString = api_curl_data(alphavantage_api_string);
    if (pString->data[0] == '{'){
        api_string_destroy(&pString);
        memset(alphavantage_api_string, '\0', 128);
        av_str = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&apikey=DFUMLJ1ILOM2G7IH&datatype=csv&symbol=";
        memcpy(alphavantage_api_string, av_str, 128);
        av_len = strlen(alphavantage_api_string);
        memcpy(&alphavantage_api_string[av_len], ticker_name_string, 10);
        pString = api_curl_data(alphavantage_api_string);
    }
    int i = 0;
    for (int j = 0; j < 9; i++, j++)
        while (pString->data[i] != ',')
            i++;
    char* price_string = (char*)calloc(16, 1);
    for (int j = 0; pString->data[i] != ','; i++, j++)
        price_string[j] = pString->data[i];
    free(alphavantage_api_string);
    double ret = strtod(price_string, NULL);
    free(price_string);
    api_string_destroy(&pString);
    return ret;
}

void api_string_destroy(String** phString) {
    String* pString = *phString;
    free(pString->data);
    free(*phString);
    *phString = NULL;
}

