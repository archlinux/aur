#define _GNU_SOURCE
#include <dlfcn.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

#define TYPORA_DIR "/usr/lib/typora"
#define ELECTRON "__ELECTRON__"
#define SNAPSHOT_VERSION_OFFSET 16
#define SNAPSHOT_VERSION_SIZE 64

typedef int (*open_t)(const char *, int, ...);
typedef int (*openat_t)(int, const char *, int, ...);

static open_t real_open;
static openat_t real_openat;

__attribute__((constructor)) static void init(void) {
	real_open = (open_t)dlsym(RTLD_NEXT, "open");
	real_openat = (openat_t)dlsym(RTLD_NEXT, "openat");
}

static const char *snapshot_name(const char *path) {
	if (!path) return NULL;

	const char *p = strstr(path, "/" ELECTRON "/");
	if (!p) return NULL;

	p = strrchr(p, '/') + 1;
	if (strcmp(p, "snapshot_blob.bin") == 0) return "snapshot_blob.bin";
	if (strcmp(p, "v8_context_snapshot.bin") == 0)
		return "v8_context_snapshot.bin";
	return NULL;
}

/*
 * Typora's bytecode needs its bundled snapshots, but V8 rejects snapshots
 * whose version string differs from the running Electron binary. Return an
 * in-memory copy of Typora's snapshot with the version field taken from the
 * system Electron snapshot. Keeping this dynamic also handles Electron
 * package upgrades without rewriting files under /usr.
 */
static int patched_snapshot(const char *system_path, const char *name) {
	int system_fd = -1;
	int typora_fd = -1;
	int patched_fd = -1;
	char typora_path[512];
	char version[SNAPSHOT_VERSION_SIZE];
	char buffer[64 * 1024];
	struct stat st;

	system_fd = real_open(system_path, O_RDONLY | O_CLOEXEC);
	if (system_fd < 0) goto fail;
	if (pread(system_fd, version, sizeof(version),
		  SNAPSHOT_VERSION_OFFSET) != sizeof(version))
		goto fail;

	snprintf(typora_path, sizeof(typora_path), "%s/%s", TYPORA_DIR, name);
	typora_fd = real_open(typora_path, O_RDONLY | O_CLOEXEC);
	if (typora_fd < 0 || fstat(typora_fd, &st) < 0) goto fail;

	patched_fd = memfd_create(name, MFD_CLOEXEC);
	if (patched_fd < 0 || ftruncate(patched_fd, st.st_size) < 0) goto fail;

	for (;;) {
		ssize_t count = read(typora_fd, buffer, sizeof(buffer));
		if (count == 0) break;
		if (count < 0) goto fail;

		char *p = buffer;
		while (count > 0) {
			ssize_t written = write(patched_fd, p, count);
			if (written <= 0) goto fail;
			p += written;
			count -= written;
		}
	}

	if (pwrite(patched_fd, version, sizeof(version),
		   SNAPSHOT_VERSION_OFFSET) != sizeof(version) ||
	    lseek(patched_fd, 0, SEEK_SET) < 0)
		goto fail;

	close(system_fd);
	close(typora_fd);
	return patched_fd;

fail:
	if (system_fd >= 0) close(system_fd);
	if (typora_fd >= 0) close(typora_fd);
	if (patched_fd >= 0) close(patched_fd);
	return -1;
}

static int do_open(const char *path, int flags, mode_t mode,
		   int (*real)(const char *, int, ...)) {
	const char *name = snapshot_name(path);
	if (name) {
		int fd = patched_snapshot(path, name);
		if (fd >= 0) return fd;
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

	const char *name = snapshot_name(path);
	if (name) {
		int fd = patched_snapshot(path, name);
		if (fd >= 0) return fd;
	}
	return real_openat(dirfd, path, flags, mode);
}
