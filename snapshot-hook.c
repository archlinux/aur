#define _GNU_SOURCE
#include <dlfcn.h>
#include <string.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>

#define TYPORA_DIR "/usr/lib/typora"
#define ELECTRON "__ELECTRON__"

typedef int (*open_t)(const char *, int, ...);
typedef int (*openat_t)(int, const char *, int, ...);

static open_t real_open;
static openat_t real_openat;

__attribute__((constructor))
static void init(void) {
	real_open = (open_t)dlsym(RTLD_NEXT, "open");
	real_openat = (openat_t)dlsym(RTLD_NEXT, "openat");
}

/* Redirect snapshot file opens from electron dir to typora dir */
static const char *redirect_snapshot(const char *path) {
	if (!path) return NULL;
	const char *p = strstr(path, "/" ELECTRON "/");
	if (!p) return NULL;
	p = strrchr(p, '/') + 1; /* skip to filename after last / */
	if (strcmp(p, "snapshot_blob.bin") == 0)
		return "snapshot_blob.bin";
	if (strcmp(p, "v8_context_snapshot.bin") == 0)
		return "v8_context_snapshot.bin";
	return NULL;
}

static int do_open(const char *path, int flags, mode_t mode,
		   int (*real)(const char *, int, ...)) {
	const char *name = redirect_snapshot(path);
	if (name) {
		char newpath[512];
		snprintf(newpath, sizeof(newpath), "%s/%s", TYPORA_DIR, name);
		return real(newpath, flags, mode);
	}
	return real(path, flags, mode);
}

int open(const char *path, int flags, ...) {
	va_list ap;
	va_start(ap, flags);
	mode_t mode = (flags & O_CREAT) ? va_arg(ap, mode_t) : 0;
	va_end(ap);
	return do_open(path, flags, mode, real_open);
}

int open64(const char *path, int flags, ...) {
	va_list ap;
	va_start(ap, flags);
	mode_t mode = (flags & O_CREAT) ? va_arg(ap, mode_t) : 0;
	va_end(ap);
	return do_open(path, flags, mode, real_open);
}

int openat(int dirfd, const char *path, int flags, ...) {
	va_list ap;
	va_start(ap, flags);
	mode_t mode = (flags & O_CREAT) ? va_arg(ap, mode_t) : 0;
	va_end(ap);
	const char *name = redirect_snapshot(path);
	if (name) {
		char newpath[512];
		snprintf(newpath, sizeof(newpath), "%s/%s", TYPORA_DIR, name);
		return real_openat(dirfd, newpath, flags, mode);
	}
	return real_openat(dirfd, path, flags, mode);
}
