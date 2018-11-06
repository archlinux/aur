/* OOM killer adjustment, meant to protect running processes via a small
 * setuid-ed "wrapper". */

/* (c) 2018 Alexander Kobel <a-kobel@a-kobel.de> */
/* Published under the WTFPL; see LICENSE. */

#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <linux/oom.h>

int usage (char **argv) {
  fprintf (stderr,
           "Adjust the out-of-memory killer score for a process; "
           "see man proc(5).\n"
           "\n"
           "Usage:\t%s <pid> <oom_score_adj>\n"
           "\n"
           "  <pid>\n"
           "\tprocess id\n"
           "  <oom_score_adj>\n"
           "\tinteger between %d and %d inclusive.\n"
           "\t(oom_score_adj = %d disables oom killing for this process)\n",
           argv[0], OOM_SCORE_ADJ_MIN, OOM_SCORE_ADJ_MAX, OOM_SCORE_ADJ_MIN);
  return EINVAL;
}

int main (int argc, char **argv) {
  char *endptr;
  long pid;
  long oom_score_adj;
  char fn[PATH_MAX];
  int n;
  FILE *f;

  if (argc != 3)
    return usage (argv);

  pid = strtol (argv[1], &endptr, 10);
  if (errno == ERANGE || *endptr != 0 || pid < 1)
    return usage (argv);

  oom_score_adj = strtol (argv[2], &endptr, 10);
  if (errno == ERANGE || *endptr != 0
      || oom_score_adj < OOM_SCORE_ADJ_MIN
      || oom_score_adj > OOM_SCORE_ADJ_MAX)
    return usage (argv);

  n = snprintf (fn, PATH_MAX, "/proc/%ld/oom_score_adj", pid);
  if (n < 0 && n > PATH_MAX)
    return ENAMETOOLONG;
  f = fopen (fn, "w");
  if (f == NULL)
    return EPERM;
  fprintf (f, "%ld", oom_score_adj);
  fclose (f);

  return 0;
}
