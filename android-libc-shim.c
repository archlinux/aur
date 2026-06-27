#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

int __cxa_atexit(void (*func)(void *), void *arg, void *dso_handle) {
    (void)func;
    (void)arg;
    (void)dso_handle;
    return 0;
}

void __cxa_finalize(void *dso_handle) {
    (void)dso_handle;
}

void *memcpy(void *dest, const void *src, size_t n) {
    unsigned char *d = dest;
    const unsigned char *s = src;
    for (size_t i = 0; i < n; i++)
        d[i] = s[i];
    return dest;
}

void *memset(void *s, int c, size_t n) {
    unsigned char *p = s;
    for (size_t i = 0; i < n; i++)
        p[i] = (unsigned char)c;
    return s;
}

void *__memcpy_chk(void *dest, const void *src, size_t len, size_t destlen) {
    if (len > destlen)
        abort();
    return memcpy(dest, src, len);
}

int printf(const char *fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    int ret = vfprintf(stdout, fmt, ap);
    va_end(ap);
    return ret;
}

int puts(const char *s) {
    int ret = fputs(s, stdout);
    if (ret < 0)
        return ret;
    return fputc('\n', stdout);
}

int putchar(int c) {
    return fputc(c, stdout);
}

void __stack_chk_fail(void) {
    abort();
}
