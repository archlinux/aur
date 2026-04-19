#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <curl/curl.h>
#include <cjson/cJSON.h>

#define BASE_URL   "https://hjonk.me/api/"
#define V1_URL     BASE_URL "v1.0/"
#define POST_URL   BASE_URL "token/post/create/"
#define PLATFORM   "curl"
#define TOKEN_FILE "/.config/hjonk/token"
#define MAXLEN     500

typedef struct {
    char *data;
    size_t len;
} Buffer;

size_t write_cb(char *ptr, size_t size, size_t nmemb, void *userdata) {
    size_t bytes = size * nmemb;
    Buffer *buf = userdata;
    buf->data = realloc(buf->data, buf->len + bytes + 1);
    memcpy(buf->data + buf->len, ptr, bytes);
    buf->len += bytes;
    buf->data[buf->len] = '\0';
    return bytes;
}

char *token_path(void) {
    const char *home = getenv("HOME");
    if (!home) return NULL;
    char *path = malloc(strlen(home) + strlen(TOKEN_FILE) + 1);
    sprintf(path, "%s%s", home, TOKEN_FILE);
    return path;
}

char *load_token(void) {
    char *path = token_path();
    if (!path) return NULL;
    FILE *f = fopen(path, "r");
    free(path);
    if (!f) return NULL;
    char *token = malloc(256);
    if (!fgets(token, 256, f)) { free(token); fclose(f); return NULL; }
    fclose(f);
    token[strcspn(token, "\n")] = '\0';
    return token;
}

int save_token(const char *token) {
    const char *home = getenv("HOME");
    if (!home) return 0;
    char dir[512];
    snprintf(dir, sizeof(dir), "%s/.config/hjonk", home);
    mkdir(dir, 0700);
    char *path = token_path();
    FILE *f = fopen(path, "w");
    free(path);
    if (!f) return 0;
    fprintf(f, "%s\n", token);
    fclose(f);
    return 1;
}

cJSON *get_json(const char *url) {
    Buffer buf = {0};
    CURL *curl = curl_easy_init();
    if (!curl) return NULL;
    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_cb);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &buf);
    CURLcode res = curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    if (res != CURLE_OK) {
        fprintf(stderr, "curl error: %s\n", curl_easy_strerror(res));
        free(buf.data);
        return NULL;
    }
    cJSON *json = cJSON_Parse(buf.data);
    free(buf.data);
    return json;
}

const char *jstr(cJSON *obj, const char *key) {
    cJSON *item = cJSON_GetObjectItem(obj, key);
    return (item && cJSON_IsString(item)) ? item->valuestring : NULL;
}

int jint(cJSON *obj, const char *key) {
    cJSON *item = cJSON_GetObjectItem(obj, key);
    return (item && cJSON_IsNumber(item)) ? item->valueint : 0;
}

void print_post(cJSON *post) {
    if (jint(post, "system_message"))
        return;

    const char *created = jstr(post, "created_at");
    printf("[user %d]  %s\n", jint(post, "user_id"), created ? created : "");

    cJSON *reply_to = cJSON_GetObjectItem(post, "replying_to");
    if (reply_to && !cJSON_IsNull(reply_to))
        printf("  > replying to post %lld\n", (long long)reply_to->valuedouble);

    const char *body = jstr(post, "body");
    if (body && *body)
        printf("%s\n", body);

    cJSON *media = cJSON_GetObjectItem(post, "media");
    if (media && cJSON_IsArray(media)) {
        cJSON *item;
        cJSON_ArrayForEach(item, media) {
            const char *type = jstr(item, "type");
            const char *path = jstr(item, "path");
            printf("  [%s: https://hjonk.me/storage/%s]\n",
                type ? type : "file",
                path ? path : "?");
        }
    }

    printf("\n");
}

void print_posts(cJSON *arr) {
    if (!arr || !cJSON_IsArray(arr)) {
        printf("nothing here.\n");
        return;
    }
    cJSON *item;
    cJSON_ArrayForEach(item, arr)
        print_post(item);
}

void cmd_auth(const char *token) {
    if (save_token(token))
        printf("token saved.\n");
    else
        fprintf(stderr, "error: could not save token\n");
}

void cmd_feed(void) {
    cJSON *json = get_json(V1_URL "feed");
    if (!json) return;
    print_posts(json);
    cJSON_Delete(json);
}

void cmd_user(const char *handle) {
    char url[256];
    snprintf(url, sizeof(url), V1_URL "user/%s", handle);
    cJSON *json = get_json(url);
    if (!json) return;

    cJSON *id3    = cJSON_GetObjectItem(json, "id3");
    cJSON *title  = id3 ? cJSON_GetObjectItem(id3, "title")  : NULL;
    cJSON *artist = id3 ? cJSON_GetObjectItem(id3, "artist") : NULL;

    const char *u;
    printf("%-12s %s\n",  "username:",  (u = jstr(json, "username"))    ? u : "N/A");
    printf("%-12s @%s\n", "handle:",    (u = jstr(json, "handle"))      ? u : "N/A");
    printf("%-12s %s\n",  "pronouns:",  (u = jstr(json, "pronouns"))    ? u : "N/A");
    printf("%-12s %s\n",  "location:",  (u = jstr(json, "location"))    ? u : "N/A");
    printf("%-12s %s\n",  "status:",    (u = jstr(json, "status"))      ? u : "N/A");
    printf("%-12s %s\n",  "hobbies:",   (u = jstr(json, "hobbies"))     ? u : "N/A");
    printf("%-12s %s\n",  "bio:",       (u = jstr(json, "description")) ? u : "N/A");
    if (id3)
        printf("%-12s %s — %s\n", "playing:",
            title  ? title->valuestring  : "N/A",
            artist ? artist->valuestring : "N/A");

    cJSON_Delete(json);
}

void cmd_posts(const char *handle) {
    char url[256];
    snprintf(url, sizeof(url), V1_URL "posts/%s", handle);
    cJSON *json = get_json(url);
    if (!json) return;
    print_posts(json);
    cJSON_Delete(json);
}

void cmd_replies(const char *id) {
    char url[256];
    snprintf(url, sizeof(url), V1_URL "replies/%s", id);
    cJSON *json = get_json(url);
    if (!json) return;
    print_posts(json);
    cJSON_Delete(json);
}

void cmd_post(const char *token, const char *content, const char *filepath) {
    if (strlen(content) > MAXLEN) {
        fprintf(stderr, "error: content exceeds %d characters\n", MAXLEN);
        return;
    }

    CURL *curl = curl_easy_init();
    if (!curl) return;

    Buffer buf = {0};

    if (filepath) {
        curl_mime *form = curl_mime_init(curl);
        curl_mimepart *part;

        part = curl_mime_addpart(form);
        curl_mime_name(part, "token");
        curl_mime_data(part, token, CURL_ZERO_TERMINATED);

        part = curl_mime_addpart(form);
        curl_mime_name(part, "content");
        curl_mime_data(part, content, CURL_ZERO_TERMINATED);

        part = curl_mime_addpart(form);
        curl_mime_name(part, "platform");
        curl_mime_data(part, PLATFORM, CURL_ZERO_TERMINATED);

        part = curl_mime_addpart(form);
        curl_mime_name(part, "files[]");
        curl_mime_filedata(part, filepath);

        curl_easy_setopt(curl, CURLOPT_URL, POST_URL);
        curl_easy_setopt(curl, CURLOPT_MIMEPOST, form);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_cb);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &buf);

        CURLcode res = curl_easy_perform(curl);
        if (res != CURLE_OK)
            fprintf(stderr, "curl error: %s\n", curl_easy_strerror(res));

        curl_mime_free(form);
    } else {
        char body[MAXLEN + 256];
        snprintf(body, sizeof(body),
            "{\"token\":\"%s\", \"content\":\"%s\", \"platform\":\"%s\"}",
            token, content, PLATFORM);

        struct curl_slist *headers = NULL;
        headers = curl_slist_append(headers, "Content-Type: application/json");

        curl_easy_setopt(curl, CURLOPT_URL, POST_URL);
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, body);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_cb);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &buf);

        CURLcode res = curl_easy_perform(curl);
        if (res != CURLE_OK)
            fprintf(stderr, "curl error: %s\n", curl_easy_strerror(res));

        curl_slist_free_all(headers);
    }

    long http_code = 0;
    curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &http_code);
    printf("HTTP %ld\n", http_code);
    if (buf.data && *buf.data)
        printf("%s\n", buf.data);
    free(buf.data);

    curl_easy_cleanup(curl);
}

void cmd_reply(const char *token, const char *post_id, const char *content, const char *filepath) {
    if (strlen(content) > MAXLEN) {
        fprintf(stderr, "error: content exceeds %d characters\n", MAXLEN);
        return;
    }

    char url[256];
    snprintf(url, sizeof(url), POST_URL "%s", post_id);

    CURL *curl = curl_easy_init();
    if (!curl) return;

    Buffer buf = {0};

    if (filepath) {
        curl_mime *form = curl_mime_init(curl);
        curl_mimepart *part;

        part = curl_mime_addpart(form);
        curl_mime_name(part, "token");
        curl_mime_data(part, token, CURL_ZERO_TERMINATED);

        part = curl_mime_addpart(form);
        curl_mime_name(part, "content");
        curl_mime_data(part, content, CURL_ZERO_TERMINATED);

        part = curl_mime_addpart(form);
        curl_mime_name(part, "platform");
        curl_mime_data(part, PLATFORM, CURL_ZERO_TERMINATED);

        part = curl_mime_addpart(form);
        curl_mime_name(part, "files[]");
        curl_mime_filedata(part, filepath);

        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_MIMEPOST, form);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_cb);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &buf);

        CURLcode res = curl_easy_perform(curl);
        if (res != CURLE_OK)
            fprintf(stderr, "curl error: %s\n", curl_easy_strerror(res));

        curl_mime_free(form);
    } else {
        char body[MAXLEN + 256];
        snprintf(body, sizeof(body),
            "{\"token\":\"%s\", \"content\":\"%s\", \"platform\":\"%s\"}",
            token, content, PLATFORM);

        struct curl_slist *headers = NULL;
        headers = curl_slist_append(headers, "Content-Type: application/json");

        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, body);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_cb);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &buf);

        CURLcode res = curl_easy_perform(curl);
        if (res != CURLE_OK)
            fprintf(stderr, "curl error: %s\n", curl_easy_strerror(res));

        curl_slist_free_all(headers);
    }

    long http_code = 0;
    curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &http_code);
    printf("HTTP %ld\n", http_code);
    if (buf.data && *buf.data)
        printf("%s\n", buf.data);
    free(buf.data);

    curl_easy_cleanup(curl);
}

void usage(void) {
    fprintf(stderr,
        "usage: hjonk <command> [args]\n"
        "\n"
        "  auth <token>                      save your API token\n"
        "  feed                              show global feed\n"
        "  user <handle>                     show a user's profile\n"
        "  posts <handle>                    show posts by a user\n"
        "  replies <id>                      show replies to a post\n"
        "  post <content>                    create a text post\n"
        "  post <content> <file>             create a post with attachment\n"
        "  reply <post_id> <content>         reply to a post\n"
        "  reply <post_id> <content> <file>  reply with attachment\n"
    );
}

int main(int argc, char *argv[]) {
    if (argc < 2) { usage(); return 1; }

    const char *cmd = argv[1];

    if (strcmp(cmd, "auth") == 0) {
        if (argc < 3) { fprintf(stderr, "usage: hjonk auth <token>\n"); return 1; }
        cmd_auth(argv[2]);

    } else if (strcmp(cmd, "feed") == 0) {
        cmd_feed();

    } else if (strcmp(cmd, "user") == 0) {
        if (argc < 3) { fprintf(stderr, "usage: hjonk user <handle>\n"); return 1; }
        cmd_user(argv[2]);

    } else if (strcmp(cmd, "posts") == 0) {
        if (argc < 3) { fprintf(stderr, "usage: hjonk posts <handle>\n"); return 1; }
        cmd_posts(argv[2]);

    } else if (strcmp(cmd, "replies") == 0) {
        if (argc < 3) { fprintf(stderr, "usage: hjonk replies <id>\n"); return 1; }
        cmd_replies(argv[2]);

    } else if (strcmp(cmd, "post") == 0) {
        if (argc < 3) { fprintf(stderr, "usage: hjonk post <content> [file]\n"); return 1; }
        char *token = load_token();
        if (!token) { fprintf(stderr, "error: no token — run: hjonk auth <token>\n"); return 1; }
        cmd_post(token, argv[2], argc >= 4 ? argv[3] : NULL);
        free(token);

    } else if (strcmp(cmd, "reply") == 0) {
        if (argc < 4) { fprintf(stderr, "usage: hjonk reply <post_id> <content> [file]\n"); return 1; }
        char *token = load_token();
        if (!token) { fprintf(stderr, "error: no token — run: hjonk auth <token>\n"); return 1; }
        cmd_reply(token, argv[2], argv[3], argc >= 5 ? argv[4] : NULL);
        free(token);

    } else {
        usage();
        return 1;
    }

    return 0;
}
