/* Workaround for degraded performance when running Wine through a shell-based wrapper */

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <limits.h>

int main(int argc, char **argv)
{
    char path[PATH_MAX], *last_slash;

    if (!realpath("/proc/self/exe", path) || !(last_slash = strrchr(path, '/')))
    {
        perror("Failed to get binary path");
        return 1;
    }
    *last_slash = '\0';

    const char *old_path = getenv("LD_LIBRARY_PATH");
    size_t needed = strlen(path) * 3 + (old_path ? strlen(old_path) : 0) + 128;
    char *ldpath = malloc(needed);
    if (!ldpath) {
        perror("out of memory (malloc failed)");
        return 1;
    }

    snprintf(ldpath, needed, "%s/../lib64/wine/x86_64-unix:%s/../lib64/wine/i386-unix:%s/../lib/wine/i386-unix%s%s",
             path, path, path, old_path ? ":" : "", old_path ? old_path : "");
    setenv("LD_LIBRARY_PATH", ldpath, 1);
    free(ldpath);

    if (!getenv("STAGING_RT_PRIORITY_SERVER") ||
        strcmp(getenv("STAGING_RT_PRIORITY_SERVER"), "0"))
        setenv("STAGING_RT_PRIORITY_SERVER", "55", 0);

    int is_server = argc > 1 && strstr(argv[1], "wineserver");
    char **new_argv = calloc(argc + 1, sizeof(char *));
    char exec_path[PATH_MAX];

    if (!new_argv || snprintf(exec_path, sizeof(exec_path), "%s/%s",
                              path, is_server ? "wineserver" : "wine") >= sizeof(exec_path))
    {
        free(new_argv);
        return 1;
    }

    new_argv[0] = is_server ? "wineserver" : "wine";
    memcpy(new_argv + 1, argv + (is_server ? 2 : 1),
           sizeof(char *) * (argc - (is_server ? 2 : 1)));

    execv(exec_path, new_argv);
    perror("exec failed");
    free(new_argv);
    return 1;
}
