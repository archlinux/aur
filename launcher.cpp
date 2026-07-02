#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <unistd.h>

const char* TARGET_PKG_JSON = "resources/app/package.json";
const char* ORIGINAL_MAIN = "\"main\": \"./application.asar/app_launcher/index.js\"";
const char* NEW_MAIN = "\"main\": \"./loadNapCat.js\"";

static char* g_modified_package_json = nullptr;
static size_t g_modified_len = 0;

#define EXPORT_HOOK __attribute__((visibility("default")))

static bool ends_with(const char* path, const char* suffix)
{
    if (!path || !suffix)
        return false;
    size_t path_len = strlen(path);
    size_t suffix_len = strlen(suffix);
    if (path_len < suffix_len)
        return false;
    return strcmp(path + path_len - suffix_len, suffix) == 0;
}

static void init_modified_packagejson(const char* real_path)
{
    if (g_modified_package_json)
        return;

    static FILE* (*real_fopen)(const char*, const char*) = nullptr;
    if (!real_fopen)
        real_fopen = (FILE * (*)(const char*, const char*)) dlsym(RTLD_NEXT, "fopen");

    FILE* fp = real_fopen(real_path, "r");
    if (!fp)
        return;

    fseek(fp, 0, SEEK_END);
    long file_size = ftell(fp);
    fseek(fp, 0, SEEK_SET);

    char* buffer = (char*)malloc(file_size + 1);
    if (!buffer) {
        fclose(fp);
        return;
    }

    size_t bytes_read = fread(buffer, 1, file_size, fp);
    buffer[bytes_read] = 0;
    fclose(fp);

    char* main_pos = strstr(buffer, ORIGINAL_MAIN);
    if (!main_pos) {
        g_modified_package_json = buffer;
        g_modified_len = bytes_read;
        return;
    }

    size_t prefix_size = main_pos - buffer;
    size_t new_main_len = strlen(NEW_MAIN);
    size_t suffix_size = strlen(main_pos + strlen(ORIGINAL_MAIN));
    size_t new_size = prefix_size + new_main_len + suffix_size;

    g_modified_package_json = (char*)malloc(new_size + 1);
    if (g_modified_package_json) {
        memcpy(g_modified_package_json, buffer, prefix_size);
        memcpy(g_modified_package_json + prefix_size, NEW_MAIN, new_main_len);
        memcpy(g_modified_package_json + prefix_size + new_main_len, main_pos + strlen(ORIGINAL_MAIN), suffix_size);
        g_modified_package_json[new_size] = '\0';
        g_modified_len = new_size;
    }
    free(buffer);
}

static int create_memfd(const char* name, const char* content, size_t length)
{
    if (!content)
        return -1;
    int fd = syscall(SYS_memfd_create, name, 0);
    if (fd < 0)
        return -1;
    if (write(fd, content, length) != (ssize_t)length) {
        close(fd);
        return -1;
    }
    lseek(fd, 0, SEEK_SET);
    return fd;
}

static int handle_target_file(const char* pathname)
{
    if (pathname && ends_with(pathname, TARGET_PKG_JSON)) {
        init_modified_packagejson(pathname);
        if (g_modified_package_json) {
            return create_memfd("mem_package_json", g_modified_package_json, g_modified_len);
        }
    }
    return -1;
}

extern "C" {

EXPORT_HOOK int open(const char* pathname, int flags, ...)
{
    static int (*real_open)(const char*, int, ...) = nullptr;
    if (!real_open)
        real_open = (int (*)(const char*, int, ...))dlsym(RTLD_NEXT, "open");
    int target_fd = handle_target_file(pathname);
    if (target_fd >= 0)
        return target_fd;

    int mode = 0;
    if (flags & (O_CREAT | O_TMPFILE)) {
        va_list args;
        va_start(args, flags);
        mode = va_arg(args, int);
        va_end(args);
        return real_open(pathname, flags, mode);
    }
    return real_open(pathname, flags);
}

EXPORT_HOOK int open64(const char* pathname, int flags, ...)
{
    static int (*real_open64)(const char*, int, ...) = nullptr;
    if (!real_open64)
        real_open64 = (int (*)(const char*, int, ...))dlsym(RTLD_NEXT, "open64");
    int target_fd = handle_target_file(pathname);
    if (target_fd >= 0)
        return target_fd;

    int mode = 0;
    if (flags & (O_CREAT | O_TMPFILE)) {
        va_list args;
        va_start(args, flags);
        mode = va_arg(args, int);
        va_end(args);
        return real_open64(pathname, flags, mode);
    }
    return real_open64(pathname, flags);
}

EXPORT_HOOK int openat(int dirfd, const char* pathname, int flags, ...)
{
    static int (*real_openat)(int, const char*, int, ...) = nullptr;
    if (!real_openat)
        real_openat = (int (*)(int, const char*, int, ...))dlsym(RTLD_NEXT, "openat");
    int target_fd = handle_target_file(pathname);
    if (target_fd >= 0)
        return target_fd;

    int mode = 0;
    if (flags & (O_CREAT | O_TMPFILE)) {
        va_list args;
        va_start(args, flags);
        mode = va_arg(args, int);
        va_end(args);
        return real_openat(dirfd, pathname, flags, mode);
    }
    return real_openat(dirfd, pathname, flags);
}

EXPORT_HOOK int openat64(int dirfd, const char* pathname, int flags, ...)
{
    static int (*real_openat64)(int, const char*, int, ...) = nullptr;
    if (!real_openat64)
        real_openat64 = (int (*)(int, const char*, int, ...))dlsym(RTLD_NEXT, "openat64");
    int target_fd = handle_target_file(pathname);
    if (target_fd >= 0)
        return target_fd;

    int mode = 0;
    if (flags & (O_CREAT | O_TMPFILE)) {
        va_list args;
        va_start(args, flags);
        mode = va_arg(args, int);
        va_end(args);
        return real_openat64(dirfd, pathname, flags, mode);
    }
    return real_openat64(dirfd, pathname, flags);
}

EXPORT_HOOK FILE* fopen(const char* pathname, const char* mode)
{
    static FILE* (*real_fopen)(const char*, const char*) = nullptr;
    if (!real_fopen)
        real_fopen = (FILE * (*)(const char*, const char*)) dlsym(RTLD_NEXT, "fopen");
    int target_fd = handle_target_file(pathname);
    if (target_fd >= 0) {
        FILE* fp = fdopen(target_fd, mode);
        if (!fp)
            close(target_fd);
        return fp;
    }
    return real_fopen(pathname, mode);
}

EXPORT_HOOK FILE* fopen64(const char* pathname, const char* mode)
{
    static FILE* (*real_fopen64)(const char*, const char*) = nullptr;
    if (!real_fopen64)
        real_fopen64 = (FILE * (*)(const char*, const char*)) dlsym(RTLD_NEXT, "fopen64");
    int target_fd = handle_target_file(pathname);
    if (target_fd >= 0) {
        FILE* fp = fdopen(target_fd, mode);
        if (!fp)
            close(target_fd);
        return fp;
    }
    return real_fopen64(pathname, mode);
}

} // extern "C"
