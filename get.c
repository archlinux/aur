/* get.c - download and save hosts entries from URL sources
*
* headers and macros */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <ctype.h>

#include "get.h"
#include "hfc.h"

#define HOSTS_FILE_PATH "/etc/hosts"

struct MemoryStruct {
	char *memory;
	size_t size;
};

static size_t
WriteMemoryCallback(void *contents, size_t size, size_t nmemb, void *userp)
{
	size_t realsize;
	char *ptr;
	struct MemoryStruct *mem;

	realsize = size * nmemb;
	mem = (struct MemoryStruct *)userp;

	ptr = realloc(mem->memory, mem->size + realsize + 1);
	if (!ptr)
		return 0;

	mem->memory = ptr;
	memcpy(&(mem->memory[mem->size]), contents, realsize);
	mem->size += realsize;
	mem->memory[mem->size] = '\0';

	return realsize;
}

char *
download_url(const char *url, char *error_msg, size_t err_size)
{
	CURL *curl_handle;
	CURLcode res;
	struct MemoryStruct chunk;

	chunk.memory = malloc(1);
	chunk.size = 0;

	curl_handle = curl_easy_init();
	if (!curl_handle) {
		snprintf(error_msg, err_size, "Could not initialize CURL");
		free(chunk.memory);
		return NULL;
	}

	char user_agent[64];
	snprintf(user_agent, sizeof(user_agent), "hfc/%s", HFC_VERSION);

	curl_easy_setopt(curl_handle, CURLOPT_URL, url);
	curl_easy_setopt(curl_handle, CURLOPT_WRITEFUNCTION, WriteMemoryCallback);
	curl_easy_setopt(curl_handle, CURLOPT_WRITEDATA, (void *)&chunk);
	curl_easy_setopt(curl_handle, CURLOPT_USERAGENT, user_agent);
	curl_easy_setopt(curl_handle, CURLOPT_ERRORBUFFER, error_msg);
	curl_easy_setopt(curl_handle, CURLOPT_VERBOSE, 0L);

	res = curl_easy_perform(curl_handle);
	if (res != CURLE_OK) {
		free(chunk.memory);
		chunk.memory = NULL;
	} else {
		error_msg[0] = '\0';
	}

	curl_easy_cleanup(curl_handle);
	return chunk.memory;
}

long
get_remote_content_length(const char *url)
{
	CURL *curl;
	CURLcode res;
	curl_off_t clength = -1;

	curl = curl_easy_init();
	if (!curl)
		return -1;

	char user_agent[64];
	snprintf(user_agent, sizeof(user_agent), "hfc/%s", HFC_VERSION);
	curl_easy_setopt(curl, CURLOPT_USERAGENT, user_agent);
	curl_easy_setopt(curl, CURLOPT_URL, url);
	curl_easy_setopt(curl, CURLOPT_NOBODY, 1L);
	curl_easy_setopt(curl, CURLOPT_FAILONERROR, 1L);
	curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
	curl_easy_setopt(curl, CURLOPT_TIMEOUT, 10L);
	curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, 5L);

	res = curl_easy_perform(curl);
	if (res == CURLE_OK) {
		if (curl_easy_getinfo(curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD_T, &clength) != CURLE_OK)
			clength = -1;
	}

	curl_easy_cleanup(curl);
	return (clength >= 0) ? (long)clength : -1;
}

int
contains_valid_hosts_entry(const char *content)
{
	const char *line, *next_line;
	size_t len;
	char *cr;
	char buffer[512];

	if (!content)
		return 0;

	line = content;
	while (*line) {
		next_line = strchr(line, '\n');
		len = next_line ? (size_t)(next_line - line) : strlen(line);

		if (len >= sizeof(buffer))
			len = sizeof(buffer) - 1;

		if (len > 0) {
			memcpy(buffer, line, len);
			buffer[len] = '\0';

			cr = strchr(buffer, '\r');
			if (cr)
				*cr = '\0';

			while (*buffer == ' ' || *buffer == '\t')
				memmove(buffer, buffer + 1, strlen(buffer));

			if (strncmp(buffer, "0.0.0.0 ", 8) == 0 ||
				strncmp(buffer, "127.0.0.1 ", 10) == 0)
				return 1;
		}

		if (!next_line)
			break;
		line = next_line + 1;
	}

	return 0;
}

int
save_to_hosts_file(const char *content, const char *url, int number)
{
	FILE *fp;
	const char *line, *next_line;
	size_t len;
	char *cr;
	char buffer[512], ip[16], domain[256];

	if (!content)
		return 0;

	fp = fopen(HOSTS_FILE_PATH, "a");
	if (!fp)
		return 0;

	fprintf(fp, "# %d. %s\n", number, url);

	line = content;
	while (*line) {
		next_line = strchr(line, '\n');
		len = next_line ? (size_t)(next_line - line) : strlen(line);

		if (len >= sizeof(buffer))
			len = sizeof(buffer) - 1;

		if (len > 0) {
			memcpy(buffer, line, len);
			buffer[len] = '\0';

			cr = strchr(buffer, '\r');
			if (cr)
				*cr = '\0';

			while (*buffer == ' ' || *buffer == '\t')
				memmove(buffer, buffer + 1, strlen(buffer));

			if (sscanf(buffer, "%15s %255s", ip, domain) == 2) {
				if (!strcmp(ip, "127.0.0.1") || !strcmp(ip, "0.0.0.0"))
					fprintf(fp, "0.0.0.0 %s\n", domain);
			}
		}

		if (!next_line)
			break;
		line = next_line + 1;
	}

	fclose(fp);
	return 1;
}
