#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <resolv.h>
#include <netinet/in.h>
#include <arpa/nameser.h>
#include <cjson/cJSON.h>
#include <unistd.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <ctype.h> // Required for tolower()

#define GREEN "\033[32m"
#define CYAN "\033[36m"
#define RED "\033[31m"
#define YELLOW "\033[33m"
#define WHITE "\033[37m"
#define RESET "\033[0m"

// Max lines to store for address deduplication
#define MAX_UNIQUE_ADDRESS_LINES 15 
// Max length for a single address value
#define MAX_ADDR_VALUE_LEN 256

#ifndef VERSION
#define VERSION "unknown"
#endif

// Helper function to trim leading and trailing whitespace from a string
char *trim_whitespace(char *str) {
    char *end;
    
    // Trim leading space
    while (*str == ' ' || *str == '\t' || *str == '\r') str++;

    if (*str == 0)  // All whitespace
        return str;

    // Trim trailing space
    end = str + strlen(str) - 1;
    while (end > str && (*end == ' ' || *end == '\t' || *end == '\r')) end--;

    // Write new null terminator
    *(end + 1) = 0;

    return str;
}

// Helper function to convert a string to lower case in place
void to_lower_case(char *str) {
    for (char *p = str; *p; p++) {
        *p = tolower(*p);
    }
}

// Helper function to check if needle is a substring of haystack (case-insensitive)
int is_substring_case_insensitive(const char *haystack, const char *needle) {
    if (!*needle) return 1; // Empty string is a substring of everything
    if (strlen(needle) > strlen(haystack)) return 0;
    
    // Create temporary lowercased copies for comparison
    char *h_copy = strdup(haystack);
    char *n_copy = strdup(needle);
    if (!h_copy || !n_copy) {
        free(h_copy);
        free(n_copy);
        return 0; // Allocation failed
    }
    to_lower_case(h_copy);
    to_lower_case(n_copy);
    
    int result = (strstr(h_copy, n_copy) != NULL);

    free(h_copy);
    free(n_copy);
    
    return result;
}


void print_author_info() {
    printf(YELLOW "\nThank you for installing aslookup!\n" RESET);
    printf(CYAN "Author: Niel Nielsen\n" RESET);
    printf(CYAN "Repository: https://codeberg.org/nieldk/aslookup\n" RESET);
    printf(YELLOW "-------------------------------------------\n\n" RESET);
}

void print_installed_version() {
    printf("aslookup version: %s\n", VERSION);
}

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

void print_latest_github_version() {
    CURL *curl = curl_easy_init();
    if (!curl) {
        printf("curl init failed\n");
        return;
    }
    struct MemoryStruct chunk = {malloc(1), 0};
    curl_easy_setopt(curl, CURLOPT_URL, "https://codeberg.org/api/v1/repos/nieldk/aslookup/releases");
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteMemoryCallback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)&chunk);
    curl_easy_setopt(curl, CURLOPT_USERAGENT, "aslookup-c-client/1.0");
    CURLcode res = curl_easy_perform(curl);
    if (res == CURLE_OK) {
        cJSON *root = cJSON_Parse(chunk.memory);
        if (root && cJSON_IsArray(root) && cJSON_GetArraySize(root) > 0) {
            // Get the first item in the array (the latest release)
            cJSON *latest_release = cJSON_GetArrayItem(root, 0); 
            
            // Now, get the "tag_name" from that object
            cJSON *tag = cJSON_GetObjectItem(latest_release, "tag_name");

            if (tag && tag->valuestring) {
                printf("Latest Codeberg release: %s\n", tag->valuestring);
            } else {
                printf("Could not find version info in Codeberg release.\n");
            }
            cJSON_Delete(root);
        } else {
            printf("Failed to parse JSON from Codeberg or received an empty list.\n");
        }
    } else { 
        printf("Failed to fetch release info from Codeberg: %s\n", curl_easy_strerror(res));
    }
    curl_easy_cleanup(curl);
    free(chunk.memory);
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

void fetch_ip_ranges(const char *asn, FILE *output) {
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
        fprintf(output, CYAN "\nIP Ranges:\n" WHITE "%s\n" RESET, chunk.memory);
    } else {
        fprintf(stderr, RED "Error fetching IP ranges: %s\n" RESET, curl_easy_strerror(res));
    }
    curl_easy_cleanup(curl);
    free(chunk.memory);
}

// WHOIS function with enhanced filtering and deduplication logic
void fetch_whois_contact(const char *asn, FILE *output) {
    int sockfd;
    struct addrinfo hints, *servinfo, *p;
    int rv;
    char query[256];
    char recv_buffer[1024];
    ssize_t bytes_received;

    char *whois_data = malloc(1); 
    size_t total_size = 0;
    
    // Data structures for address deduplication
    char unique_addresses_normalized[MAX_UNIQUE_ADDRESS_LINES][MAX_ADDR_VALUE_LEN]; 
    char *unique_addresses_original[MAX_UNIQUE_ADDRESS_LINES] = { NULL };           
    int unique_count = 0;
    int address_found = 0;
    
    char *org_name = NULL;
    char *as_name = NULL;
    char *email = NULL;
    char *abuse_email = NULL;
    
    const char *WHOIS_SERVER = "whois.ripe.net";
    const char *WHOIS_PORT = "43"; 

    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC; 
    hints.ai_socktype = SOCK_STREAM; 

    if ((rv = getaddrinfo(WHOIS_SERVER, WHOIS_PORT, &hints, &servinfo)) != 0) {
        fprintf(stderr, RED "\nWHOIS Error: getaddrinfo failed for %s: %s\n" RESET, WHOIS_SERVER, gai_strerror(rv));
        free(whois_data); 
        return;
    }

    for (p = servinfo; p != NULL; p = p->ai_next) {
        if ((sockfd = socket(p->ai_family, p->ai_socktype, p->ai_protocol)) == -1) continue; 
        if (connect(sockfd, p->ai_addr, p->ai_addrlen) == -1) {
            close(sockfd);
            continue; 
        }
        break; 
    }

    if (p == NULL) {
        fprintf(stderr, RED "\nWHOIS Error: Failed to connect to %s:%s\n" RESET, WHOIS_SERVER, WHOIS_PORT);
        freeaddrinfo(servinfo);
        free(whois_data);
        return;
    }

    freeaddrinfo(servinfo);
    snprintf(query, sizeof(query), "AS%s\r\n", asn); 

    if (send(sockfd, query, strlen(query), 0) == -1) {
        fprintf(stderr, RED "\nWHOIS Error: Failed to send query.\n" RESET);
        close(sockfd);
        free(whois_data);
        return;
    }

    while ((bytes_received = recv(sockfd, recv_buffer, sizeof(recv_buffer) - 1, 0)) > 0) {
        char *temp_ptr = realloc(whois_data, total_size + bytes_received + 1);
        if (!temp_ptr) {
            fprintf(stderr, RED "Memory allocation error during WHOIS fetch.\n" RESET);
            free(whois_data);
            close(sockfd);
            return;
        }
        whois_data = temp_ptr;
        memcpy(whois_data + total_size, recv_buffer, bytes_received);
        total_size += bytes_received;
        whois_data[total_size] = '\0';
    }
    
    close(sockfd);

    if (total_size == 0) {
        fprintf(output, YELLOW "\nWHOIS lookup returned no data.\n" RESET);
        free(whois_data);
        return;
    }

    // --- Start Filtering and Deduplication Logic ---
    fprintf(output, CYAN "\n--- Filtered Contact Information (via WHOIS) ---\n" RESET);

    char *data_copy = strdup(whois_data); 
    char *saveptr_data;
    char *line = strtok_r(data_copy, "\n", &saveptr_data);

    // Pass 1: Collect Name, Email, and Unique Address Lines
    while (line != NULL) {
        char *value_start = strchr(line, ':');

        if (value_start) {
            value_start += 2; // Skip ': '
            
            char *trimmed_value = trim_whitespace(value_start);

            // Name (Prioritize org-name, then as-name)
            if (strncmp(line, "org-name:", 9) == 0 && !org_name) {
                org_name = strdup(trimmed_value);
            } else if (strncmp(line, "as-name:", 8) == 0 && !as_name) {
                as_name = strdup(trimmed_value);
            }
            // Email (Prioritize abuse-mailbox, then general e-mail)
            else if (strncmp(line, "abuse-mailbox:", 14) == 0 && !abuse_email) {
                abuse_email = strdup(trimmed_value);
            } else if (strncmp(line, "e-mail:", 7) == 0 && !email) {
                email = strdup(trimmed_value);
            }
            // Process Address lines with Deduplication
            else if (strncmp(line, "address:", 8) == 0) {
                 if (unique_count < MAX_UNIQUE_ADDRESS_LINES) {
                    
                    char normalized_current[MAX_ADDR_VALUE_LEN];
                    strncpy(normalized_current, trimmed_value, MAX_ADDR_VALUE_LEN - 1);
                    normalized_current[MAX_ADDR_VALUE_LEN - 1] = '\0';
                    to_lower_case(normalized_current); 

                    int is_redundant = 0; 
                    int add_index = unique_count; // Default to adding at the end

                    for (int i = 0; i < unique_count; i++) {
                        // Skip if already marked for removal
                        if (unique_addresses_original[i] == NULL) continue;
                        
                        // Rule A: Exact Match (redundant)
                        if (strcmp(normalized_current, unique_addresses_normalized[i]) == 0) {
                            is_redundant = 1;
                            break;
                        }
                        
                        // Rule B: Existing line is a substring of the new line (New line is more complete)
                        // Example: '8660' is a substring of 'skanderborg 8660'
                        if (is_substring_case_insensitive(normalized_current, unique_addresses_normalized[i])) {
                            // Mark the existing (shorter) line for removal and reuse its slot
                            free(unique_addresses_original[i]);
                            unique_addresses_original[i] = NULL;
                            if (add_index == unique_count) {
                                add_index = i; 
                            }
                            // Do not break, keep checking for other shorter lines to replace
                        }
                        
                        // Rule C: New line is a substring of existing line (New line is redundant)
                        // Example: '8660' is a substring of 'dk-8660 skanderborg'
                        else if (is_substring_case_insensitive(unique_addresses_normalized[i], normalized_current)) {
                            is_redundant = 1;
                            break; // New line is redundant, discard it.
                        }
                    }

                    if (!is_redundant) {
                        // If add_index is still unique_count, we add to a new slot
                        if (add_index == unique_count) {
                            unique_count++; 
                        }
                        
                        // Store original trimmed string for printing
                        unique_addresses_original[add_index] = strdup(trimmed_value);
                        // Store normalized copy for comparison
                        strncpy(unique_addresses_normalized[add_index], normalized_current, MAX_ADDR_VALUE_LEN);
                        address_found = 1;
                    }
                }
            }
        }
        line = strtok_r(NULL, "\n", &saveptr_data);
    }
    
    // Print Name and Email
    fprintf(output, GREEN "Organization Name: %s\n" RESET, (org_name ? org_name : (as_name ? as_name : "N/A")));
    fprintf(output, RED "Abuse/General Email: %s\n" RESET, (abuse_email ? abuse_email : (email ? email : "N/A")));
    
    // --- Print Deduplicated Addresses ---
    fprintf(output, YELLOW "Address:\n" RESET);
    
    if (address_found) {
        for (int i = 0; i < unique_count; i++) {
            // Print only the lines that were not marked for deletion (NULL pointer)
            if (unique_addresses_original[i] != NULL) {
                fprintf(output, WHITE "  %s\n" RESET, unique_addresses_original[i]);
            }
        }
    } else {
        fprintf(output, WHITE "  N/A\n" RESET);
    }
    
    fprintf(output, RESET);

    // Clean up dynamic memory
    free(whois_data);
    free(data_copy);
    if (org_name) free(org_name);
    if (as_name) free(as_name);
    if (email) free(email);
    if (abuse_email) free(abuse_email);
    for (int i = 0; i < unique_count; i++) {
        if (unique_addresses_original[i] != NULL) {
            free(unique_addresses_original[i]);
        }
    }
}


void print_help(const char *progname, FILE *output) {
    fprintf(output, CYAN "Usage: %s <options>\n", progname);
    fprintf(output, CYAN "Options:\n");
    fprintf(output, WHITE " -i <IP[,IP,...]> Specify one or more IP addresses (comma-separated)\n");
    fprintf(output, WHITE " -d <domain[,domain,...]> Specify one or more domain names (comma-separated)\n");
    fprintf(output, WHITE " -f <file> Save output to a formatted text file\n");
    fprintf(output, WHITE " --help Show this help message\n");
    fprintf(output, WHITE " --version Show installed version\n");
    fprintf(output, WHITE " --ghversion Show latest GitHub release version\n");
}

char *resolve_domain_to_ip(const char *domain) {
    struct addrinfo hints, *res;
    static char ip[INET6_ADDRSTRLEN] = {0};
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    if (getaddrinfo(domain, NULL, &hints, &res) != 0) {
        return NULL;
    }
    struct sockaddr_in *ipv4 = (struct sockaddr_in *)res->ai_addr;
    inet_ntop(AF_INET, &(ipv4->sin_addr), ip, sizeof(ip));
    freeaddrinfo(res);
    return ip;
}

int main(int argc, char *argv[]) {
    print_author_info();
    char ips[1024] = {0};
    char domains[1024] = {0};
    char filename[256] = {0};
    FILE *output = stdout;
    int opt;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--version") == 0) {
            print_installed_version();
            return 0;
        }
        if (strcmp(argv[i], "--ghversion") == 0) {
            print_latest_github_version();
            return 0;
        }
        if (strcmp(argv[i], "--help") == 0) {
            print_help(argv[0], stdout);
            return 0;
        }
    }

    while ((opt = getopt(argc, argv, "i:d:f:")) != -1) {
        switch (opt) {
            case 'i':
                strncpy(ips, optarg, sizeof(ips) - 1);
                break;
            case 'd':
                strncpy(domains, optarg, sizeof(domains) - 1);
                break;
            case 'f':
                strncpy(filename, optarg, sizeof(filename) - 1);
                break;
            case '?':
                print_help(argv[0], stdout);
                return 1;
        }
    }

    if (strlen(filename) > 0) {
        output = fopen(filename, "w");
        if (!output) {
            fprintf(stderr, RED "Failed to open file for writing.\n");
            return 1;
        }
    }

    if (strlen(ips) == 0 && strlen(domains) == 0) {
        print_help(argv[0], output);
        if (output != stdout) fclose(output);
        return 1;
    }

    char *token;
    if (strlen(ips) > 0) {
        token = strtok(ips, ",");
        while (token != NULL) {
            char *asn = get_asn_from_ip(token);
            if (!asn) {
                fprintf(stderr, RED "Failed to resolve ASN from IP: %s\n" RESET, token);
            } else {
                fprintf(output, GREEN "Resolved ASN for IP %s: %s\n", token, asn);
                fetch_ip_ranges(asn, output);
                // Correctly calling the filtered WHOIS function
                fetch_whois_contact(asn, output);
            }
            token = strtok(NULL, ",");
        }
    }

    if (strlen(domains) > 0) {
        token = strtok(domains, ",");
        while (token != NULL) {
            char *resolved_ip = resolve_domain_to_ip(token);
            if (!resolved_ip) {
                fprintf(stderr, RED "Failed to resolve domain to IP: %s\n" RESET, token);
            } else {
                char *asn = get_asn_from_ip(resolved_ip);
                if (!asn) {
                    fprintf(stderr, RED "Failed to resolve ASN from domain %s (IP %s)\n" RESET, token, resolved_ip);
                } else {
                    fprintf(output, GREEN "Resolved ASN for domain %s (IP %s): %s\n", token, resolved_ip, asn);
                    fetch_ip_ranges(asn, output);
                    // Correctly calling the filtered WHOIS function
                    fetch_whois_contact(asn, output);
                }
            }
            token = strtok(NULL, ",");
        }
    }

    if (output != stdout) fclose(output);
    return 0;
}
