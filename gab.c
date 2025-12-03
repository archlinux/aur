#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include "cjson/cJSON.h"

struct buffer {
    char *data;
    size_t size;
};

size_t write_cb(void *ptr, size_t size, size_t nmemb, void *userdata) {
    size_t total = size * nmemb;
    struct buffer *buf = userdata;
    char *new_data = realloc(buf->data, buf->size + total + 1);
    if (!new_data) return 0;
    buf->data = new_data;
    memcpy(buf->data + buf->size, ptr, total);
    buf->size += total;
    buf->data[buf->size] = 0;
    return total;
}

void usage() {
    printf("gab -S <pkgname>\n");
    printf("gab -R <pkgname>\n");
    printf("gab -Q <pkgname>\n");
}

char *http_get(const char *url) {
    CURL *curl = curl_easy_init();
    if (!curl) return NULL;
    struct buffer buf = {0};
    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_cb);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &buf);
    if (curl_easy_perform(curl) != CURLE_OK) {
        curl_easy_cleanup(curl);
        free(buf.data);
        return NULL;
    }
    curl_easy_cleanup(curl);
    return buf.data;
}

void search_pkg(const char *name) {
    char url[512];
    snprintf(url, sizeof(url),
        "https://aur.archlinux.org/rpc/?v=5&type=search&arg=%s", name);

    char *response = http_get(url);
    if (!response) return;

    cJSON *json = cJSON_Parse(response);
    free(response);
    if (!json) return;

    cJSON *results = cJSON_GetObjectItem(json, "results");
    if (!cJSON_IsArray(results)) {
        cJSON_Delete(json);
        return;
    }

    int count = cJSON_GetArraySize(results);
    for (int i = 0; i < count; i++) {
        cJSON *pkg = cJSON_GetArrayItem(results, i);
        cJSON *nameitem = cJSON_GetObjectItem(pkg, "Name");
        if (cJSON_IsString(nameitem)) {
            if (strstr(nameitem->valuestring, name) != NULL)
                printf("%s\n", nameitem->valuestring);
        }
    }

    cJSON_Delete(json);
}

int install_pkg(const char *pkg) {
    char url[512];
    snprintf(url, sizeof(url),
        "https://aur.archlinux.org/rpc/?v=5&type=info&arg=%s", pkg);

    char *response = http_get(url);
    if (!response) return 1;

    cJSON *json = cJSON_Parse(response);
    free(response);
    if (!json) return 1;

    cJSON *results = cJSON_GetObjectItem(json, "results");
    if (!cJSON_IsArray(results) || cJSON_GetArraySize(results) == 0) {
        cJSON_Delete(json);
        return 1;
    }

    cJSON *pkginfo = cJSON_GetArrayItem(results, 0);
    cJSON *urlpath = cJSON_GetObjectItem(pkginfo, "URLPath");

    if (!cJSON_IsString(urlpath)) {
        cJSON_Delete(json);
        return 1;
    }

    char tarurl[512];
    snprintf(tarurl, sizeof(tarurl),
        "https://aur.archlinux.org%s", urlpath->valuestring);

    char cmd[1024];
    snprintf(cmd, sizeof(cmd),
        "curl -sLO %s && tar xf %s.tar.gz && cd %s && makepkg -si --noconfirm",
        tarurl, pkg, pkg);

    int r = system(cmd);
    cJSON_Delete(json);
    return r;
}

int remove_pkg(const char *pkg) {
    char cmd[256];
    snprintf(cmd, sizeof(cmd), "sudo pacman -R %s", pkg);
    return system(cmd);
}

int main(int argc, char **argv) {
    if (argc < 2) {
        usage();
        return 0;
    }

    if (strcmp(argv[1], "-S") == 0 && argc >= 3)
        return install_pkg(argv[2]);

    if (strcmp(argv[1], "-R") == 0 && argc >= 3)
        return remove_pkg(argv[2]);

    if (strcmp(argv[1], "-Q") == 0 && argc >= 3) {
        search_pkg(argv[2]);
        return 0;
    }

    usage();
    return 0;
}
