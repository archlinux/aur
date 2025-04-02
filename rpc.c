#include <stdio.h>
#include <curl/curl.h>
#include <json-c/json.h>
#include "rpc.h"
#include "memory.h"
#include "list.h"
#include "buffer.h"

size_t callback(char *data, size_t size, size_t nmemb, void *p);

List *get_rpc_data(char *url) {

    char *response;
    List *temp;

    response = curl(url);
    temp = json(response);
    
    free(response);
    return temp;
} 

char *curl(char *url) {

    Json_buffer *buffer;
    CURLcode res;
    CURL *curl;
    char *response = NULL;

    curl_global_init(CURL_GLOBAL_ALL);
    curl = curl_easy_init();
    buffer = buffer_malloc();
    
    if(curl != NULL) {

        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, callback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *) buffer);

        res = curl_easy_perform(curl);
        get_str(&response, buffer->response, NULL);

        curl_easy_cleanup(curl);
        curl_global_cleanup();
    }
    free(buffer->response);
    free(buffer);

    return response;
}

size_t callback(char *data, size_t size, size_t nmemb, void *p) {
    
    int len = size * nmemb;
    Json_buffer *temp = (Json_buffer *)p;

    str_malloc(&temp->response, temp->size + len + 1);
    memcpy(&(temp->response[temp->size]), data, len);
    temp->size += len;
    temp->response[temp->size] = '\0';

    return len;
}

List *json(char *response) {

    register int i, n_results;
    json_object *root, *results, *name, *pop, *version, *pkg;
    
    List *temp = list_malloc();
    
    root = json_tokener_parse(response);
    results = json_object_object_get(root, "results");
    n_results = json_object_array_length(results);

    for (i = 0; i < n_results; i++) {
        pkg = json_object_array_get_idx(results, i);
        
        name = json_object_object_get(pkg, "Name");
        pop = json_object_object_get(pkg, "Popularity");
        version = json_object_object_get(pkg, "Version");

        temp = add_json_data(temp, json_object_get_string(name), json_object_get_string(version), json_object_get_int(pop));
    }
    json_object_put(root);
    
    return temp;
}
