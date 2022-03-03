/*
 * (C) 2020-2021 by Christian Hesse <mail@eworm.de>
 *
 * This software may be used and distributed according to the terms
 * of the GNU General Public License, incorporated herein by reference.
 *
 * Running Mikrotik netinstall with unprivileged user requires ambient
 * capability CAP_NET_BIND_SERVICE. This is a wrapper to run it in wine.
 */

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/capability.h>
#include <sys/stat.h>
#include <unistd.h>

#define WINE_PATH		"/usr/bin/wine"
#define NETINSTALL_EXE_PATH	"/usr/lib/netinstall/netinstall.exe"

int main(int argc, char ** argv) {
  cap_t caps;
  cap_flag_value_t cap_effective = 0, cap_permitted = 0;
  const cap_value_t cap = CAP_NET_BIND_SERVICE;

  if (!CAP_IS_SUPPORTED(cap)) {
    fprintf(stderr, "Capability CAP_NET_BIND_SERVICE is not supported.\n");
    goto out10;
  }
  if ((caps = cap_get_proc()) == NULL) {
    perror("cap_get_proc");
    goto out10;
  }
  if (cap_get_flag(caps, cap, CAP_EFFECTIVE, &cap_effective) == -1 ||
      cap_get_flag(caps, cap, CAP_PERMITTED, &cap_permitted) == -1 ||
      cap_effective == 0 || cap_permitted == 0) {
    fprintf(stderr, "Capability CAP_NET_BIND_SERVICE is not available. Set it with setcap(8).\n");
    goto out20;
  }
  if (cap_set_flag(caps, CAP_INHERITABLE, 1, &cap, CAP_SET) == -1) {
    perror("cap_set_flag: setting CAP_INHERITABLE for CAP_NET_BIND_SERVICE");
    goto out20;
  }
  if (cap_set_proc(caps) == -1) {
    perror("cap_set_proc");
    goto out20;
  }
  if (cap_free(caps) == -1) {
    perror("cap_free");
    goto out10;
  }
  if (cap_set_ambient(cap, CAP_SET) == -1) {
    perror("cap_set_ambient: setting CAP_NET_BIND_SERVICE");
    goto out10;
  }

  struct stat st;
  const char *home = getenv("HOME");
  char wineprefix[256];
  snprintf(wineprefix, sizeof(wineprefix), "%s/.netinstall/wine/", home);

  setenv("WINEPREFIX", wineprefix, 1);
  setenv("WINEARCH", "win64", 1);
  setenv("WINEDLLOVERRIDES", "mscoree=", 1);
  setenv("WINEDEBUG", "-all", 1);

  if (chdir(home) == -1) {
    perror("chdir: changing to home directory");
    goto out10;
  }

  if (stat(".netinstall/", &st) == -1) {
    if (mkdir(".netinstall/", 0777) == -1) {
      perror("mkdir: creating directory '.netinstall/'");
      goto out10;
    }

    if (system("wineboot -u") != 0) {
      perror("system: running wineboot");
      goto out10;
    }
  }

  char * const newargv[] = { "wine", NETINSTALL_EXE_PATH, NULL };
  execv(WINE_PATH, newargv);

  /* execv() returns only on error */
  perror("execv");

out20:
  cap_free(caps);

out10:
  return EXIT_FAILURE;
}
