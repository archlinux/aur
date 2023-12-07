#ifndef LINUX_COMPAT_H
#define LINUX_COMPAT_H

#ifdef __linux__

#define _GNU_SOURCE

#include <stdlib.h>
#include <errno.h>

extern char *program_invocation_short_name;

#define getprogname() program_invocation_short_name

#define __unreachable() __builtin_unreachable()
#define	__dead2		__attribute__((__noreturn__))

size_t
strlcat(char *dst, const char *src, size_t siz);

size_t
strlcpy(char *dst, const char *src, size_t siz);

void errc(int eval, int status, const char *fmt, ...) __dead2;

#define __FBSDID(x)

#endif /* __linux__ */
#endif /* LINUX_COMPAT_H */
