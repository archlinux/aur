//
// Simple shutdown-wrapper with focus on security
//
// Version:	1.0	Thu Jul  9 16:28:42 CEST 2009
//
// Author:	Manuel Reimer <manuel.reimer@gmx.de>
//

#define REAL_PATH "/usr/lib/kodi/bin/setwakeup.sh"

#include <unistd.h>

int main(int argc, char *argv[]){
  // We pass a secure environment to the called script.
  char *const envParms[4] = {
    "PATH=/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin",
    "HOME=/root",
    "TERM=linux",
    NULL
  };
  // Drop whatever working directory the caller set for us and go HOME
  chdir("/root");
  // Get root and execute setwakeup.sh
  setuid(0);
  execve(REAL_PATH, argv, envParms);
  return 0;
}
