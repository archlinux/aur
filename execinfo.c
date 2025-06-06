#define _GNU_SOURCE
#include <sys/types.h>
#include <sys/uio.h>
#include <dlfcn.h>
#include <math.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdint.h>
#include <errno.h>

#include "execinfo.h"
#include "stacktraverse.h"

#define D10(x) ceil(log10(((x) == 0) ? 2 : ((x) + 1)))

/* Maximum safe buffer size for stack allocation */
#define MAX_STACK_BUFFER 4096

inline static void *
realloc_safe(void *ptr, size_t size)
{
    void *nptr;

    /* Check for size overflow */
    if (size == 0 || size > SIZE_MAX / 2) {
        free(ptr);
        return NULL;
    }

    nptr = realloc(ptr, size);
    if (nptr == NULL) {
        free(ptr);
        errno = ENOMEM;
    }
    return nptr;
}

int
backtrace(void **buffer, int size)
{
    int i;

    /* Note: buffer is marked __nonnull but we check anyway for robustness */
    if (size <= 0)
        return 0;

    for (i = 1; getframeaddr(i + 1) != NULL && i != size + 1; i++) {
        buffer[i - 1] = getreturnaddr(i);
        if (buffer[i - 1] == NULL)
            break;
    }

    return i - 1;
}

char **
backtrace_symbols(void *const *buffer, int size)
{
    size_t clen, alen;
    int i;
    char **rval;
    Dl_info info;
    ptrdiff_t offset;

    /* Note: buffer is marked __nonnull but we check anyway for robustness */
    if (size <= 0)
        return NULL;

    clen = size * sizeof(char *);
    rval = malloc(clen);
    if (rval == NULL)
        return NULL;

    for (i = 0; i < size; i++) {
        if (dladdr(buffer[i], &info) != 0) {
            if (info.dli_sname == NULL)
                info.dli_sname = "???";
            if (info.dli_saddr == NULL)
                info.dli_saddr = buffer[i];
            
            /* Use ptrdiff_t for safe pointer arithmetic */
            offset = (char *)buffer[i] - (char *)info.dli_saddr;
            
            /* "0x01234567 <function+offset> at filename" */
            alen = 2 +                      /* "0x" */
                   (sizeof(void *) * 2) +   /* "01234567" */
                   2 +                      /* " <" */
                   strlen(info.dli_sname) + /* "function" */
                   1 +                      /* "+" */
                   20 +                     /* offset (increased for safety) */
                   5 +                      /* "> at " */
                   strlen(info.dli_fname) + /* "filename" */
                   1;                       /* "\0" */
            
            rval = realloc_safe(rval, clen + alen);
            if (rval == NULL)
                return NULL;
            
            snprintf((char *) rval + clen, alen, "%p <%s+%td> at %s",
              buffer[i], info.dli_sname, offset, info.dli_fname);
        } else {
            alen = 2 +                      /* "0x" */
                   (sizeof(void *) * 2) +   /* "01234567" */
                   1;                       /* "\0" */
            rval = realloc_safe(rval, clen + alen);
            if (rval == NULL)
                return NULL;
            snprintf((char *) rval + clen, alen, "%p", buffer[i]);
        }
        rval[i] = (char *) clen;
        clen += alen;
    }

    for (i = 0; i < size; i++)
        rval[i] += (uintptr_t) rval;

    return rval;
}

void
backtrace_symbols_fd(void *const *buffer, int size, int fd)
{
    int i, len;
    char *buf;
    char static_buf[MAX_STACK_BUFFER];
    Dl_info info;
    ptrdiff_t offset;
    ssize_t written;

    /* Note: buffer is marked __nonnull but we check anyway for robustness */
    if (size <= 0 || fd < 0)
        return;

    for (i = 0; i < size; i++) {
        if (dladdr(buffer[i], &info) != 0) {
            if (info.dli_sname == NULL)
                info.dli_sname = "???";
            if (info.dli_saddr == NULL)
                info.dli_saddr = buffer[i];
            
            offset = (char *)buffer[i] - (char *)info.dli_saddr;
            
            /* "0x01234567 <function+offset> at filename" */
            len = 2 +                      /* "0x" */
                  (sizeof(void *) * 2) +   /* "01234567" */
                  2 +                      /* " <" */
                  strlen(info.dli_sname) + /* "function" */
                  1 +                      /* "+" */
                  D10(offset) +            /* "offset */
                  5 +                      /* "> at " */
                  strlen(info.dli_fname) + /* "filename" */
                  2;                       /* "\n\0" */
            
            /* Use stack buffer for small allocations, malloc for large ones */
            if (len <= MAX_STACK_BUFFER) {
                buf = static_buf;
            } else {
                buf = malloc(len);
                if (buf == NULL)
                    return;
            }
            
            snprintf(buf, len, "%p <%s+%td> at %s\n",
              buffer[i], info.dli_sname, offset, info.dli_fname);
        } else {
            len = 2 +                      /* "0x" */
                  (sizeof(void *) * 2) +   /* "01234567" */
                  2;                       /* "\n\0" */
            
            if (len <= MAX_STACK_BUFFER) {
                buf = static_buf;
            } else {
                buf = malloc(len);
                if (buf == NULL)
                    return;
            }
            
            snprintf(buf, len, "%p\n", buffer[i]);
        }
        
        /* Handle write() return value to suppress warning */
        written = write(fd, buf, strlen(buf));
        (void)written; /* Suppress unused variable warning */
        
        /* Free dynamically allocated buffer */
        if (buf != static_buf)
            free(buf);
    }
}
