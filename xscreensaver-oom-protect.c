/* protect xscreensaver from the OOM killer via a small
 * setuid-ed "wrapper".
 *
 * An attempt to patch the security hole described in
 *   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=562884
 * without globally disabling the magic SysRq functionality
 * and/or OOM killer, without patching xscreensaver directly.
 *
 * Hardcoded to check whether the given pid actually is a process for
 * /usr/bin/xscreensaver to avoid malicious users protecting arbitrary
 * other processes.
 *
 * If you think you want to consider other screensavers, read
 *   https://www.jwz.org/xscreensaver/faq.html
 * - in particular, #20 and #28 -
 *   https://www.jwz.org/xscreensaver/faq.html#no-ctl-alt-bs
 *   https://www.jwz.org/xscreensaver/faq.html#gnome-screensaver
 * and
 *   https://www.jwz.org/xscreensaver/toolkits.html
 * and think again. */

/* (c) 2018 Alexander Kobel <a-kobel@a-kobel.de> */
/* Published under the WTFPL; see LICENSE. */

#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <linux/oom.h>
#include <sys/resource.h>

int usage (char **argv) {
  fprintf (stderr,
           "Protect process <pid> from the OOM killer by setting its "
           "oom_score_adj to %d and its nice value to -20.\n"
           "(TL;DR: try to avoid that an attacker types Alt+SysRq+F "
           "repeatedly and ends up\n"
           "with your logged-in session without the xscreensaver lock.)\n"
           "Will fail with error code %d if the process does not run "
           "/usr/bin/xscreensaver.\n"
           "For more information and background, see\n"
           "\tman xscreensaver(1) \"Magic Backdoor Keystrokes\"\n"
           "\tman proc(5)\n"
           "\thttps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=562884\n"
           "\n"
           "(c) 2018 Alexander Kobel <a-kobel@a-kobel.de>\n"
           "\n"
           "Usage:\t%s <pid>\n"
           "\n"
           "  <pid>\n"
           "\tprocess id of a /usr/bin/xscreensaver instance\n"
           "\n"
           "Example:\n"
           "\tfor pid in $(pgrep xscreensaver); do\n"
           "\t\t%s $pid\n"
           "\tdone\n"
           "\n"
           "Preferably called from a supervisor like systemd.\n"
           "\n"
           "WARNING: The OOM adjustment is not locked, and may be changed or "
           "reset again.\n"
           "As far as the author is aware, the necessary permissions are those "
           "of the\n"
           "xscreensaver process itself; and with the same permissions, the "
           "OOM score\n"
           "adjustment can be lowered again. Thus, for additional security "
           "against\n"
           "*non-malicious* resets, call the equivalent of\n"
           "\techo %d > /proc/<pid>/oom_score_adj\n"
           "on each activation of the screensaver (which should be possible "
           "as non-root).\n"
           "All bets are off against an attacker that already aquired the "
           "rights of the\n"
           "owner of the original xscreensaver process (and, most probably, "
           "there's no need\n"
           "to work around that).\n",
           OOM_SCORE_ADJ_MIN, EINVAL, argv[0], argv[0], OOM_SCORE_ADJ_MIN);
  return EINVAL;
}

int main (int argc, char **argv) {
  char *endptr;
  long pid;
  char fn[PATH_MAX];
  char xscreensaver_exe[PATH_MAX];
  int n;
  FILE *f;

  if (argc != 2)
    return usage (argv);

  pid = strtol (argv[1], &endptr, 10);
  if (errno == ERANGE || *endptr != 0 || pid < 1)
    return usage (argv);

  n = snprintf (fn, PATH_MAX, "/proc/%ld/exe", pid);
  if (n < 0 && n > PATH_MAX)
    return ENAMETOOLONG;
  if (realpath (fn, xscreensaver_exe) == NULL)
    return errno;
  if (strcmp (xscreensaver_exe, "/usr/bin/xscreensaver") != 0)
    return EINVAL;

  n = snprintf (fn, PATH_MAX, "/proc/%ld/oom_score_adj", pid);
  if (n < 0 && n > PATH_MAX)
    return ENAMETOOLONG;
  f = fopen (fn, "w");
  if (f == NULL)
    return EPERM;
  fprintf (f, "%d", OOM_SCORE_ADJ_MIN);
  fclose (f);

  if (setpriority (PRIO_PROCESS, pid, INT_MIN) != 0)
    return errno;

  return 0;
}
