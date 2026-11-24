#define _GNU_SOURCE
#include <dlfcn.h>
#include <string.h>

typedef void *(*dlopen_fn)(const char *, int);

/*
 * STM32CubeProgrammer's JLink loader cannot find its bundled JLink library
 * when launched with the system JVM on Wayland: it builds paths like
 * /usr/lib/jvm/<jdk>/bin../lib/libjlinkarm.so (missing '/') and the Java
 * side may also request a bare 'libjlinkarm.so'. Redirect any request for
 * these two library names to the bundled copies; pass everything else
 * through untouched.
 */
void *dlopen(const char *filename, int flags) {
    static dlopen_fn real_dlopen;
    if (!real_dlopen)
        real_dlopen = (dlopen_fn)dlsym(RTLD_NEXT, "dlopen");

    if (filename && strstr(filename, "libjlinkarm.so"))
        return real_dlopen("/opt/stm32cubeprog/lib/libjlinkarm.so", flags);
    if (filename && strstr(filename, "libpsa_sdm.so"))
        return real_dlopen("/opt/stm32cubeprog/lib/libpsa_sdm.so", flags);

    return real_dlopen(filename, flags);
}
