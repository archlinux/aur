#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <resolv.h>
#include <netinet/in.h>
#include <arpa/nameser.h>
#include <cjson/cJSON.h>
#include <unistd.h> // For getopt

#define GREEN "\033[32m"
#define CYAN "\033[36m"
#define RED "\033[31m"
#define YELLOW "\033[33m"
#define RESET "\033[0m"

struct MemoryStruct {
    char *memory;
    size_t size;
};

size_t WriteMemoryCallback(void *contents, size_t size, size_t nmemb, void *userp) {
    size_t total = size * nmemb;
    struct MemoryStruct *mem = (struct MemoryStruct *)userp;
    char *ptr = realloc(mem->memory, mem->size + total + 1);
    if (!ptr) return 0;
    mem->memory = ptr;
    memcpy(&(mem->memory[mem->size]), contents, total);
    mem->size += total;
    mem->memory[mem->size] = 0;
    return total;
}

char *get_asn_from_ip(const char *ip) {
    static char asn[16] = {0};
    int a, b, c, d;
    if (sscanf(ip, "%d.%d.%d.%d", &a, &b, &c, &d) != 4) return NULL;
    char query[256];
    snprintf(query, sizeof(query), "%d.%d.%d.%d.origin.asn.cymru.com", d, c, b, a);
    unsigned char response[512];
    ns_msg handle;
    ns_rr rr;
    int len = res_query(query, ns_c_in, ns_t_txt, response, sizeof(response));
    if (len < 0) return NULL;
    if (ns_initparse(response, len, &handle) < 0) return NULL;
    if (ns_parserr(&handle, ns_s_an, 0, &rr) < 0) return NULL;
    const unsigned char *rdata = ns_rr_rdata(rr);
    int txt_len = rdata[0];
    char txt[256];
    strncpy(txt, (char *)&rdata[1], txt_len);
    txt[txt_len] = '\0';
    sscanf(txt, "%15s", asn);
    return asn;
}

void fetch_ip_ranges(const char *asn) {
    CURL *curl = curl_easy_init();
    if (!curl) return;
    char url[256];
    snprintf(url, sizeof(url), "https://api.hackertarget.com/aslookup/?q=AS%s", asn);
    struct MemoryStruct chunk = {malloc(1), 0};
    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteMemoryCallback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)&chunk);
    curl_easy_setopt(curl, CURLOPT_USERAGENT, "asnlookup-c-client/1.0");
    CURLcode res = curl_easy_perform(curl);
    if (res == CURLE_OK) {
        printf(CYAN "\nIP Ranges:\n" RESET "%s\n", chunk.memory);
    } else {
        fprintf(stderr, RED "Error fetching IP ranges: %s\n" RESET, curl_easy_strerror(res));
    }
    curl_easy_cleanup(curl);
    free(chunk.memory);
}

void fetch_bgpview_info(const char *asn) {
    CURL *curl = curl_easy_init();
    if (!curl) return;
    char url[256];
    snprintf(url, sizeof(url), "https://api.bgpview.io/asn/%s", asn);
    struct MemoryStruct chunk = {malloc(1), 0};
    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteMemoryCallback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)&chunk);
    curl_easy_setopt(curl, CURLOPT_USERAGENT, "asnlookup-c-client/1.0");
    CURLcode res = curl_easy_perform(curl);
    if (res != CURLE_OK) {
        fprintf(stderr, RED "Error fetching BGPView info: %s\n" RESET, curl_easy_strerror(res));
        curl_easy_cleanup(curl);
        free(chunk.memory);
        return;
    }
    cJSON *root = cJSON_Parse(chunk.memory);
    if (!root) {
        fprintf(stderr, RED "Failed to parse JSON.\n" RESET);
        curl_easy_cleanup(curl);
        free(chunk.memory);
        return;
    }
    cJSON *data = cJSON_GetObjectItem(root, "data");
    if (!data) {
        fprintf(stderr, RED "No data in JSON.\n" RESET);
        cJSON_Delete(root);
        curl_easy_cleanup(curl);
        free(chunk.memory);
        return;
    }
    printf(GREEN "\n\nASN Number: %d\n" RESET, cJSON_GetObjectItem(data, "asn")->valueint);
    printf(GREEN "Name: %s\n" RESET, cJSON_GetObjectItem(data, "name")->valuestring);
    printf(GREEN "Description: %s\n" RESET, cJSON_GetObjectItem(data, "description_short")->valuestring);
    printf(GREEN "Country: %s\n" RESET, cJSON_GetObjectItem(data, "country_code")->valuestring);
    printf(GREEN "Website: %s\n" RESET, cJSON_GetObjectItem(data, "website")->valuestring);
    cJSON *emails = cJSON_GetObjectItem(data, "email_contacts");
    if (emails) {
        printf(CYAN "\nEmail Contacts:\n" RESET);
        for (int i = 0; i < cJSON_GetArraySize(emails); i++) {
            printf(" - %s\n", cJSON_GetArrayItem(emails, i)->valuestring);
        }
    }
    cJSON *abuse = cJSON_GetObjectItem(data, "abuse_contacts");
    if (abuse) {
        printf(RED "\nAbuse Contacts:\n" RESET);
        for (int i = 0; i < cJSON_GetArraySize(abuse); i++) {
            printf(" - %s\n", cJSON_GetArrayItem(abuse, i)->valuestring);
        }
    }
    cJSON *address = cJSON_GetObjectItem(data, "owner_address");
    if (address) {
        printf(YELLOW "\nOwner Address:\n" RESET);
        for (int i = 0; i < cJSON_GetArraySize(address); i++) {
            printf(" %s\n", cJSON_GetArrayItem(address, i)->valuestring);
        }
    }
    printf(GREEN "\nTraffic Ratio: %s\n" RESET, cJSON_GetObjectItem(data, "traffic_ratio")->valuestring);
    printf(GREEN "Updated: %s\n" RESET, cJSON_GetObjectItem(data, "date_updated")->valuestring);
    cJSON_Delete(root);
    curl_easy_cleanup(curl);
    free(chunk.memory);
}

void print_help(const char *progname) {
    printf("Usage: %s -i <IP address>\n", progname);
    printf("Options:\n");
    printf("  -i <IP>       Specify the IP address to look up\n");
    printf("  --help        Show this help message\n");
}

int main(int argc, char *argv[]) {
    char ip[64] = {0};

    // Parse command-line arguments
    int opt;
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--help") == 0) {
            print_help(argv[0]);
            return 0;
        }
    }
    while ((opt = getopt(argc, argv, "i:")) != -1) {
        switch (opt) {
            case 'i':
                strncpy(ip, optarg, sizeof(ip) - 1);
                break;
            case '?':
                print_help(argv[0]);
                return 1;
        }
    }
    if (strlen(ip) == 0) {
        print_help(argv[0]);
        return 1;
    }

    char *asn = get_asn_from_ip(ip);
    if (!asn) {
        fprintf(stderr, RED "Failed to resolve ASN from IP.\n" RESET);
        return 1;
    }
    printf(GREEN "\nResolved ASN: %s\n" RESET, asn);
    fetch_ip_ranges(asn);
    fetch_bgpview_info(asn);
    return 0;
}
