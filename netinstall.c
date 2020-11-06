/*
 * (C) 2020 by Christian Hesse <mail@eworm.de>
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
#include <sys/prctl.h>
#include <sys/stat.h>
#include <unistd.h>

#define WINE_PATH		"/usr/bin/wine"
#define NETINSTALL_EXE_PATH	"/usr/share/netinstall/netinstall.exe"

int main(int argc, char ** argv) {
  cap_value_t newcap[1];
  cap_t caps = cap_get_proc();
  newcap[0] = CAP_NET_BIND_SERVICE;
  cap_set_flag(caps, CAP_INHERITABLE, 1, newcap, CAP_SET);
  cap_set_proc(caps);
  cap_free(caps);

  if (prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_RAISE, CAP_NET_BIND_SERVICE, 0, 0)) {
    perror("prctl: can not set CAP_NET_BIND_SERVICE");
    return EXIT_FAILURE;
  }
  
  struct stat st;
  const char *home = getenv("HOME");
  char wineprefix[256];
  snprintf(wineprefix, sizeof wineprefix, "%s/.netinstall/wine/", home);

  setenv("WINEPREFIX", wineprefix, 1);
  setenv("WINEARCH", "win64", 1);
  setenv("WINEDLLOVERRIDES", "mscoree=", 1);
  setenv("WINEDEBUG", "-all", 1);

  if (chdir(home) == -1) {
    perror("chdir: changing to home directory");
    return EXIT_FAILURE;
  }

  if (stat(".netinstall/", &st) == -1) {
    if (mkdir(".netinstall/", 0777) == -1) {
      perror("mkdir: creating directory '.netinstall/'");
      return EXIT_FAILURE;
    }
    
    if (system("wineboot -u") != 0) {
      perror("system: running wineboot");
      return EXIT_FAILURE;
    }
  }

  char * const newargv[] = { "wine", NETINSTALL_EXE_PATH, NULL };
  execv(WINE_PATH, newargv);

  /* execv() returns only on error */
  perror("execv");
  return EXIT_FAILURE;
}
