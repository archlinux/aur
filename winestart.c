/* winestart.c code from: https://aur.archlinux.org/cgit/aur.git/tree/winestart.c?h=wine-osu-spectator */

/* Wrapper that should be placed in the Wine bin/ directory (next to wineserver, wine etc.).
 * It can then be symlinked to anywhere else as any name you wish, so that you don't have to
 * add the Wine bin/ directory to your PATH.
 *
 * It also has special handling for wineserver, so if the wrapper is named/linked as "wine-link",
 * wineserver can be invoked like "wine-link wineserver -k".
 *
 * It should also be compatible with winetricks, by using e.g. WINE=wine-link winetricks <command>.
 *
 * If "wow64" is in the name of the wrapper, then as of Wine commit 765ea347, it will
 * automatically set WINEARCH=wow64 and allow you to use "new WoW64" mode even with a
 * regular multilib-compiled Wine. (BROKEN) */

#define _GNU_SOURCE
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    char path[PATH_MAX], *last_slash;

    if (!realpath("/proc/self/exe", path) || !(last_slash = strrchr(path, '/')))
    {
        perror("Failed to get binary path");
        return 1;
    }
    *last_slash = '\0';

    // if (strstr(argv[0], "wow64"))
    //     setenv("WINEARCH", "wow64", 1);

    if (!getenv("STAGING_RT_PRIORITY_SERVER") || strcmp(getenv("STAGING_RT_PRIORITY_SERVER"), "0"))
        setenv("STAGING_RT_PRIORITY_SERVER", "25", 0);

    int is_server = argc > 1 && strstr(argv[1], "wineserver");
    char **new_argv = calloc(argc + 1, sizeof(char *));
    char exec_path[PATH_MAX];

    if (!new_argv ||
        snprintf(exec_path, sizeof(exec_path), "%s/%s", path, is_server ? "wineserver" : "wine") >= sizeof(exec_path))
    {
        free(new_argv);
        return 1;
    }

    new_argv[0] = is_server ? "wineserver" : "wine";
    memcpy(new_argv + 1, argv + (is_server ? 2 : 1), sizeof(char *) * (argc - (is_server ? 2 : 1)));

    execv(exec_path, new_argv);
    perror("exec failed");
    free(new_argv);
    return 1;
}
