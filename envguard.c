/*
 * SPDX-License-Identifier: MIT
 *
 * Workaround for an upstream Linux-only E2BIG bug in Xiaomi MiMo Desktop.
 *
 * The app serialises its built-in agent prompts (four copies of a ~37 KiB
 * system prompt) plus provider settings into the environment variable
 * MIMOCODE_CONFIG_CONTENT, ~155 KiB in total. Linux caps a single argv/envp
 * string at MAX_ARG_STRLEN (32 pages = 131072 bytes, including the NUL), so
 * from the moment that variable is set every execve() issued by the process
 * fails with E2BIG. Chromium then loses its renderers (exit code 127 =
 * render-process-gone abnormal-exit 32512) and the app reports the sign-in
 * page as a network failure; node-machine-id's `cat /var/lib/dbus/machine-id`
 * shell-out fails for the same reason.
 *
 * Filtering by string length instead of by variable name keeps this working
 * if upstream renames the variable or moves the payload to another oversized
 * value, and any such string is unexecutable anyway.
 *
 * The oversized values are only read in-process; upstream's own
 * child-process-environment helper (CredentialEnv in child-process-env.ts)
 * already strips MIMOCODE_CONFIG_CONTENT / MIMOCODE_AUTH_CONTENT before
 * spawning the engine, so dropping them from child environments matches
 * upstream behaviour while the browser process keeps its configuration.
 *
 * Only execvp() is intercepted: that is what Chromium's base::LaunchProcess
 * and libuv's uv_spawn use on Linux. A future upstream switch to
 * execve()/posix_spawn() would bypass this guard.
 */

#define _GNU_SOURCE
#include <string.h>
#include <unistd.h>

extern char **environ;

/* Kernel limit is 131072 bytes including the terminating NUL. */
#define MAX_ENV_STRING 131000
#define MAX_ENV 2048

static __thread char *clean_env[MAX_ENV + 1];

static int oversized(const char *entry)
{
  return strlen(entry) >= MAX_ENV_STRING;
}

int execvp(const char *file, char *const argv[])
{
  char **entry;
  int n = 0;

  for (entry = environ; *entry != NULL; entry++) {
    if (oversized(*entry))
      break;
  }

  /* Nothing to drop: keep the original environment untouched. */
  if (*entry == NULL)
    return execvpe(file, argv, environ);

  for (entry = environ; *entry != NULL && n < MAX_ENV; entry++) {
    if (oversized(*entry))
      continue;
    clean_env[n++] = *entry;
  }

  /* Unexpectedly large environment: fall back to the unfiltered one. */
  if (n == MAX_ENV)
    return execvpe(file, argv, environ);

  clean_env[n] = NULL;
  return execvpe(file, argv, clean_env);
}
