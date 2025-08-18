/* update.c - fetch remote hosts file entries to update counter
*
* headers and macros */
#define MAX_ENTRIES 100

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "get.h"
#include "update.h"
#include "hfc.h"


int
count_hosts_in_content(const char *content)
{
	const char *line, *next;
	size_t len;
	int count = 0;
	char buffer[512], *cr;

	if (!content)
		return 0;

	line = content;
	while (*line) {
		next = strchr(line, '\n');
		len = next ? (size_t)(next - line) : strlen(line);
		if (len >= sizeof(buffer))
			len = sizeof(buffer) - 1;

		memcpy(buffer, line, len);
		buffer[len] = '\0';

		cr = strchr(buffer, '\r');
		if (cr)
			*cr = '\0';

		while (*buffer == ' ' || *buffer == '\t')
			memmove(buffer, buffer + 1, strlen(buffer));

		if (strncmp(buffer, "0.0.0.0 ", 8) == 0 || strncmp(buffer, "127.0.0.1 ", 10) == 0)
			count++;

		if (!next)
			break;
		line = next + 1;
	}

	return count;
}
