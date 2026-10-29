/*
 * OpenConnect (SSL + DTLS) VPN client
 *
 * Copyright © 2023 Jan-Michael Brummer <jan-michael.brummer1@volkswagen.de>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * version 2.1, as published by the Free Software Foundation.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <errno.h>
#include <fcntl.h>

#ifndef _WIN32
#include <pwd.h>
#endif

#define DATA_FILE_NAME "globalprotect.dat"
#define CALLBACK_PREFIX "globalprotectcallback:"

static char *get_user_cache_dir(void)
{
	char *cache_dir;
	size_t cache_dir_len;
#ifndef _WIN32
	struct passwd *pw = getpwuid(getuid());
	if (!pw || !pw->pw_dir)
		return NULL;
	char *home = strdup(pw->pw_dir);
#else
	char *home = strdup("");
#endif
	if (!home)
		return NULL;

	cache_dir_len = strlen(home) + strlen("/.cache/openconnect/") + 1;
	cache_dir = malloc(cache_dir_len);
	if (!cache_dir) {
		free(home);
		return NULL;
	}

	/* A new account may not have a cache directory yet. */
	snprintf(cache_dir, cache_dir_len, "%s/.cache", home);
	if (mkdir(cache_dir, 0700) && errno != EEXIST) {
		free(home);
		free(cache_dir);
		return NULL;
	}
	snprintf(cache_dir, cache_dir_len, "%s/.cache/openconnect/", home);
	free(home);

#ifndef _WIN32
	if (mkdir(cache_dir, 0700) && errno != EEXIST) {
		free(cache_dir);
		return NULL;
	}
#else
	mkdir(cache_dir);
#endif

	return cache_dir;
}

int main(int argc, char **argv)
{
	FILE *fp;
	char *callback_data;
	char *oc_cache_dir;
	char *data_file;
	size_t data_file_len, callback_len;
	int fd;
	struct stat st;
	int ret = -1;

	if (argc != 2 || strncmp(argv[1], CALLBACK_PREFIX,
				 sizeof(CALLBACK_PREFIX) - 1) ||
	    !argv[1][sizeof(CALLBACK_PREFIX) - 1])
		return -1;

	callback_data = argv[1];
	oc_cache_dir = get_user_cache_dir();
	if (!oc_cache_dir)
		return -1;

	data_file_len = strlen(oc_cache_dir) + strlen(DATA_FILE_NAME) + 2;
	data_file = malloc(data_file_len);
	if (!data_file) {
		free(oc_cache_dir);
		return -1;
	}
	strcpy(data_file, oc_cache_dir);
	strcat(data_file, "/");
	strcat(data_file, DATA_FILE_NAME);

	fd = open(data_file, O_WRONLY | O_CREAT | O_NOFOLLOW | O_NONBLOCK, 0600);
	if (fd < 0)
		goto out;
	if (fstat(fd, &st) || !S_ISREG(st.st_mode) || st.st_uid != getuid() ||
	    st.st_nlink != 1 || fchmod(fd, 0600) || ftruncate(fd, 0)) {
		close(fd);
		goto out;
	}
	fp = fdopen(fd, "w");
	if (fp) {
		callback_data += sizeof(CALLBACK_PREFIX) - 1;
		callback_len = strlen(callback_data);
		if (fwrite(callback_data, 1, callback_len, fp) == callback_len)
			ret = 0;
		if (fclose(fp))
			ret = -1;
	} else
		close(fd);

out:
	free(data_file);
	free(oc_cache_dir);

	return ret;
}
