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

String* api_curl_data(char* url, char* post_field) {
    String* pString = api_string_init();
    CURL* curl = curl_easy_init();
    CURLcode res;
    curl_global_init(CURL_GLOBAL_DEFAULT);
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, api_string_writefunc);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &pString->data);
        struct curl_slist* list = NULL;
        if (url[12] == 'g') {
            list = curl_slist_append(list, "Content-Type: application/json");
            curl_easy_setopt(curl, CURLOPT_HTTPHEADER, list);
            curl_easy_setopt(curl, CURLOPT_POSTFIELDS, post_field);
            curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, strlen(post_field));
        }
        res = curl_easy_perform(curl);
        if (url[12] == 'g')
            curl_slist_free_all(list);
        curl_easy_cleanup(curl);
        if (res != CURLE_OK)
            return NULL;
    }
    return pString;
}

double* api_get_current_price(char* ticker_name_string) {
    double* val;
    if (strlen(ticker_name_string) > 5) {
        val = coinmarketcap_get_price(ticker_name_string);
        return val;
    }
    val = iex_get_price(ticker_name_string);
    if (val != NULL)
        return val;
    val = morningstar_get_price(ticker_name_string);
    if (val != NULL)
        return val;
    val = coinmarketcap_get_price(ticker_name_string);
    if (val != NULL)
        return val;
    return NULL;
}

double* iex_get_price(char* ticker_name_string) {
    char* iex_api_string = calloc(64, sizeof(char));
    sprintf(iex_api_string, "%s%s%s", "https://api.iextrading.com/1.0/stock/", ticker_name_string, "/quote");
    String* pString = api_curl_data(iex_api_string, NULL);
    free(iex_api_string);
    if (strcmp(pString->data, "Unknown symbol") == 0) {
        api_string_destroy(&pString);
        return NULL;
    }
    Json* jobj = json_tokener_parse(pString->data);
    double* ret = malloc(sizeof(double) * 2);
    char* price_string = (char*) json_object_to_json_string(json_object_object_get(jobj, "latestPrice"));
    char* close_price_string = (char*) json_object_to_json_string(json_object_object_get(jobj, "previousClose"));
    ret[0] = strtod(price_string, NULL);
    ret[1] = strtod(close_price_string, NULL);
    api_string_destroy(&pString);
    json_object_put(jobj);
    return ret;
}

double* morningstar_get_price(char* ticker_name_string) {
    time_t now = time(NULL);
    struct tm* ts;
    char* today_char = calloc(16, 1);
    char* yesterday_char = calloc(16, 1);
    ts = localtime(&now);
    if (ts->tm_wday == 0) //if sunday
        ts->tm_mday -= 2;
    else if (ts->tm_hour <= 16 || ts->tm_wday == 6) //if before market close or saturday
        ts->tm_mday--;
    mktime(ts);
    strftime(today_char, 16, "%Y-%m-%d", ts);
    ts->tm_mday--;
    mktime(ts);
    strftime(yesterday_char, 16, "%Y-%m-%d", ts);
    char* morningstar_api_string = calloc(512, 1);
    sprintf(morningstar_api_string, "%s%s%s%s|%s%s",
            "http://globalquote.morningstar.com/globalcomponent/RealtimeHistoricalStockData.ashx?ticker=",
            ticker_name_string,
            "&showVol=true&dtype=his&f=d&curry=USD&range=", yesterday_char, today_char,
            "&isD=true&isS=true&hasF=true&ProdCode=DIRECT");
    String* pString = api_curl_data(morningstar_api_string, NULL);
    free(morningstar_api_string);
    free(today_char);
    free(yesterday_char);

    Json* jobj = json_tokener_parse(pString->data);
    if (strcmp("null", pString->data) == 0) {
        api_string_destroy(&pString);
        return NULL;
    }
    double* ret = malloc(sizeof(double) * 2);
    Json* price_data_list = json_object_object_get(jobj, "PriceDataList");
    Json* price_data = json_object_array_get_idx(price_data_list, 0);
    Json* current = json_object_object_get(price_data, "Datapoints");
    Json* yesterday = json_object_array_get_idx(json_object_array_get_idx(current, 1), 0);
    char* price = (char*) json_object_to_json_string(yesterday);
    ret[0] = strtod(price, NULL);
    Json* today = json_object_array_get_idx(json_object_array_get_idx(current, 0), 0);
    price = (char*) json_object_to_json_string(today);
    ret[1] = strtod(price, NULL);
    json_object_put(jobj);
    api_string_destroy(&pString);
    return ret;
}

double* coinmarketcap_get_price(char* ticker_name_string) {
    char* coinmarketcap_api_string = calloc(64, sizeof(char));
    sprintf(coinmarketcap_api_string, "%s%s", "https://api.coinmarketcap.com/v1/ticker/", ticker_name_string);
    String* pString = api_curl_data(coinmarketcap_api_string, NULL);
    free(coinmarketcap_api_string);
    if (pString->data[0] == '{') {
        api_string_destroy(&pString);
        return NULL;
    }
    Json* jobj = json_tokener_parse(pString->data);
    Json* data = json_object_array_get_idx(jobj, 0);
    Json* usd = json_object_object_get(data, "price_usd");
    Json* percent_change_1d = json_object_object_get(data, "percent_change_24h");
    char* price = (char*) json_object_get_string(usd);
    char* change_1d = (char*) json_object_get_string(percent_change_1d);
    double* ret = malloc(sizeof(double) * 2);
    ret[0] = strtod(price, NULL);
    ret[1] = ret[0] - ((strtod(change_1d, NULL) / 100) * ret[0]);
    api_string_destroy(&pString);
    json_object_put(jobj);
    return ret;
}

void news_print_top_three(char* ticker_name_string) {
    time_t now = time(NULL);
    struct tm* ts;
    char* yearchar = calloc(64, 1);
    ts = localtime(&now);
    ts->tm_mday -= 14;
    mktime(ts);
    strftime(yearchar, 64, "%Y-%m-%d", ts);
    char* news_api_string = calloc(256, sizeof(char));
    sprintf(news_api_string, "%s&from=%s&q=%s",
            "https://newsapi.org/v2/everything?sortBy=relevancy&pageSize=3&language=en&apiKey=1163c352d041460381f0a8273e60a9d1",
            yearchar, ticker_name_string);
    free(yearchar);
    String* pString = api_curl_data(news_api_string, NULL);
    //printf("%s\n", pString->data);
    //printf("%s\n", news_api_string);
    Json* jobj = json_tokener_parse(pString->data);
    if (strtol(json_object_to_json_string(json_object_object_get(jobj, "totalResults")), NULL,
               10) > 0)
        json_print_news(jobj);
    else printf("No articles. Try a different input.\n");
    free(news_api_string);
    api_string_destroy(&pString);
    json_object_put(jobj);
}

void json_print_news(Json* jobj) {
    Json* article_list = json_object_object_get(jobj, "articles");
    Json* article;
    char* author_string, * title_string, * source_string, * date_string, * url_string;
    int results = (int) strtol(json_object_to_json_string(json_object_object_get(jobj, "totalResults")), NULL,
                               10);
    for (int i = 0; i < results && i < 3; i++) {
        article = json_object_array_get_idx(article_list, (size_t) i);
        author_string = (char*) json_object_to_json_string(json_object_object_get(article, "author"));
        title_string = (char*) json_object_to_json_string(json_object_object_get(article, "title"));
        source_string = (char*) json_object_to_json_string(
                json_object_object_get(json_object_object_get(article, "source"), "name"));
        date_string = (char*) json_object_to_json_string(json_object_object_get(article, "publishedAt"));

        url_string = (char*) json_object_to_json_string(json_object_object_get(article, "url"));
        char* url_final = calloc(strlen(url_string + 1), 1);
        for (int k = 0, j = 0; j < strlen(url_string); k++, j++) {
            if (url_string[j] == '\\' || url_string[j] == '\"')
                j++;
            url_final[k] = url_string[j];
        }

        char* shorten = (char*) google_shorten_link(url_final);
        printf("Title: %s Source: %s ", title_string, source_string);
        if (strcmp(author_string, "null") != 0)
            printf("Author: %s ", author_string);
        if (strcmp(date_string, "null") != 0) {
            date_string[11] = '\"';
            date_string[12] = '\0';
            printf("Date: %s ", date_string);
        }
        printf("Url: %s\n", shorten);
        free(url_final);
        free((void*) shorten);
    }
}

const char* google_shorten_link(char* url_string) {
    char* google_api_string = "https://www.googleapis.com/urlshortener/v1/url?key=AIzaSyAoMAvMPpc7U8lfrnGMk2ZKl966tU2pppU";
    char* post_string = calloc(1024, 1);
    sprintf(post_string, "{\"longUrl\": \"%s\"}", url_string);
    String* pString = api_curl_data(google_api_string, post_string);
    free(post_string);
    Json* jobj = json_tokener_parse(pString->data);
    Json* short_url = json_object_object_get(jobj, "id");
    const char* short_url_string = json_object_to_json_string(short_url);
    char* copy = calloc(1024, 1);
    strcpy(copy, short_url_string);
    char* final = calloc(strlen(copy) + 1, 1);
    for (int i = 0, j = 0; j < strlen(copy); i++, j++) {
        if (copy[j] == '\\' || copy[j] == '\"')
            j++;
        final[i] = copy[j];
    }
    json_object_put(jobj);
    free(copy);
    api_string_destroy(&pString);
    return final;
}

void api_string_destroy(String** phString) {
    String* pString = *phString;
    free(pString->data);
    free(*phString);
    *phString = NULL;
}