#define _GNU_SOURCE

#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

typedef int (*setenv_fn_t)(const char *name, const char *value, int overwrite);
typedef void *(*dlsym_fn_t)(void *handle, const char *symbol);
typedef int (*jli_launch_fn_t)(int argc,
                               char **argv,
                               int jargc,
                               const char **jargv,
                               int appclassc,
                               const char **appclassv,
                               const char *fullversion,
                               const char *dotversion,
                               const char *pname,
                               const char *lname,
                               int javaargs,
                               int cpwildcard,
                               int javaw,
                               int ergo);

typedef struct {
  char **items;
  size_t len;
  size_t cap;
} strvec_t;

static setenv_fn_t real_setenv_fn = 0;
static dlsym_fn_t real_dlsym_fn = 0;
static jli_launch_fn_t real_jli_launch_fn = 0;

static int JLI_Launch(int argc,
                      char **argv,
                      int jargc,
                      const char **jargv,
                      int appclassc,
                      const char **appclassv,
                      const char *fullversion,
                      const char *dotversion,
                      const char *pname,
                      const char *lname,
                      int javaargs,
                      int cpwildcard,
                      int javaw,
                      int ergo);

static void init_real_symbols(void) {
  if (real_dlsym_fn == 0) {
    real_dlsym_fn = (dlsym_fn_t)dlvsym(RTLD_NEXT, "dlsym", "GLIBC_2.2.5");
  }

  if (real_setenv_fn == 0 && real_dlsym_fn != 0) {
    real_setenv_fn = (setenv_fn_t)real_dlsym_fn(RTLD_NEXT, "setenv");
  }
}

static char *xstrdup(const char *s) {
  size_t n = strlen(s) + 1;
  char *r = (char *)malloc(n);
  if (!r) {
    return 0;
  }
  memcpy(r, s, n);
  return r;
}

static int strvec_push(strvec_t *v, const char *s) {
  if (v->len == v->cap) {
    size_t new_cap = v->cap == 0 ? 8 : v->cap * 2;
    char **new_items = (char **)realloc(v->items, new_cap * sizeof(char *));
    if (!new_items) {
      return -1;
    }
    v->items = new_items;
    v->cap = new_cap;
  }

  char *copy = xstrdup(s);
  if (!copy) {
    return -1;
  }

  v->items[v->len++] = copy;
  return 0;
}

static void strvec_free(strvec_t *v) {
  if (!v) {
    return;
  }

  for (size_t i = 0; i < v->len; ++i) {
    free(v->items[i]);
  }
  free(v->items);
  v->items = 0;
  v->len = 0;
  v->cap = 0;
}

static int append_joined(char **dst, const char *item) {
  if (!*dst) {
    *dst = xstrdup(item);
    return *dst ? 0 : -1;
  }

  size_t a = strlen(*dst);
  size_t b = strlen(item);
  char *new_s = (char *)realloc(*dst, a + 1 + b + 1);
  if (!new_s) {
    return -1;
  }

  new_s[a] = ':';
  memcpy(new_s + a + 1, item, b + 1);
  *dst = new_s;
  return 0;
}

static char *replace_appdir(const char *in, const char *appdir) {
  const char *needle = "$APPDIR";
  const size_t needle_len = 7;
  const size_t appdir_len = strlen(appdir);

  size_t out_len = 0;
  const char *p = in;
  while (*p) {
    if (strncmp(p, needle, needle_len) == 0) {
      out_len += appdir_len;
      p += needle_len;
    } else {
      ++out_len;
      ++p;
    }
  }

  char *out = (char *)malloc(out_len + 1);
  if (!out) {
    return 0;
  }

  char *q = out;
  p = in;
  while (*p) {
    if (strncmp(p, needle, needle_len) == 0) {
      memcpy(q, appdir, appdir_len);
      q += appdir_len;
      p += needle_len;
    } else {
      *q++ = *p++;
    }
  }
  *q = '\0';

  return out;
}

static int get_app_root(const char *launcher_path, char **out_root, char **out_appdir, char **out_cfg) {
  const char *marker = "/usr/bin/";
  const char *pos = strstr(launcher_path, marker);
  if (!pos) {
    return -1;
  }

  size_t root_len = (size_t)(pos - launcher_path);
  char *root = (char *)malloc(root_len + 1);
  if (!root) {
    return -1;
  }
  memcpy(root, launcher_path, root_len);
  root[root_len] = '\0';

  size_t appdir_len = root_len + strlen("/usr/lib/app");
  char *appdir = (char *)malloc(appdir_len + 1);
  if (!appdir) {
    free(root);
    return -1;
  }
  sprintf(appdir, "%s/usr/lib/app", root);

  size_t cfg_len = appdir_len + strlen("/Ani.cfg");
  char *cfg = (char *)malloc(cfg_len + 1);
  if (!cfg) {
    free(root);
    free(appdir);
    return -1;
  }
  sprintf(cfg, "%s/Ani.cfg", appdir);

  *out_root = root;
  *out_appdir = appdir;
  *out_cfg = cfg;
  return 0;
}

static int parse_cfg(const char *cfg_path,
                     const char *appdir,
                     char **out_mainclass,
                     char **out_classpath,
                     strvec_t *out_java_opts) {
  FILE *fp = fopen(cfg_path, "r");
  if (!fp) {
    return -1;
  }

  char *line = 0;
  size_t n = 0;
  ssize_t got;

  char *mainclass = 0;
  char *classpath = 0;
  strvec_t java_opts = {0};

  while ((got = getline(&line, &n, fp)) != -1) {
    while (got > 0 && (line[got - 1] == '\n' || line[got - 1] == '\r')) {
      line[--got] = '\0';
    }

    if (strncmp(line, "app.mainclass=", 14) == 0) {
      char *v = replace_appdir(line + 14, appdir);
      if (!v) {
        goto fail;
      }
      free(mainclass);
      mainclass = v;
      continue;
    }

    if (strncmp(line, "app.classpath=", 14) == 0) {
      char *v = replace_appdir(line + 14, appdir);
      if (!v) {
        goto fail;
      }
      if (append_joined(&classpath, v) != 0) {
        free(v);
        goto fail;
      }
      free(v);
      continue;
    }

    if (strncmp(line, "java-options=", 13) == 0) {
      char *v = replace_appdir(line + 13, appdir);
      if (!v) {
        goto fail;
      }
      if (strvec_push(&java_opts, v) != 0) {
        free(v);
        goto fail;
      }
      free(v);
      continue;
    }
  }

  free(line);
  fclose(fp);

  if (!mainclass || !classpath) {
    free(mainclass);
    free(classpath);
    strvec_free(&java_opts);
    return -1;
  }

  *out_mainclass = mainclass;
  *out_classpath = classpath;
  *out_java_opts = java_opts;
  return 0;

fail:
  free(line);
  fclose(fp);
  free(mainclass);
  free(classpath);
  strvec_free(&java_opts);
  return -1;
}

static int read_cmdline_args(strvec_t *out_args) {
  FILE *fp = fopen("/proc/self/cmdline", "rb");
  if (!fp) {
    return -1;
  }

  if (fseek(fp, 0, SEEK_END) != 0) {
    fclose(fp);
    return -1;
  }
  long sz = ftell(fp);
  if (sz < 0) {
    fclose(fp);
    return -1;
  }
  rewind(fp);

  char *buf = (char *)malloc((size_t)sz + 1);
  if (!buf) {
    fclose(fp);
    return -1;
  }

  size_t got = fread(buf, 1, (size_t)sz, fp);
  fclose(fp);
  buf[got] = '\0';

  strvec_t args = {0};

  size_t i = 0;
  int idx = 0;
  while (i < got) {
    const char *s = buf + i;
    size_t len = strlen(s);
    if (len == 0) {
      ++i;
      continue;
    }

    if (idx > 0) {
      if (strvec_push(&args, s) != 0) {
        free(buf);
        strvec_free(&args);
        return -1;
      }
    }

    ++idx;
    i += len + 1;
  }

  free(buf);
  *out_args = args;
  return 0;
}

static int should_rebuild_launch_args(int argc, char **argv) {
  if (!argv || argc < 4) {
    return 0;
  }

  if (strcmp(argv[1], "-classpath") != 0) {
    return 0;
  }

  if (argv[3] && argv[3][0] == '\0') {
    return 1;
  }

  return 0;
}

static int rebuild_launch_args(char **orig_argv, int *out_argc, char ***out_argv) {
  char *app_root = 0;
  char *appdir = 0;
  char *cfg = 0;
  char *mainclass = 0;
  char *classpath = 0;
  strvec_t java_opts = {0};
  strvec_t user_args = {0};

  if (get_app_root(orig_argv[0], &app_root, &appdir, &cfg) != 0) {
    goto fail;
  }

  if (parse_cfg(cfg, appdir, &mainclass, &classpath, &java_opts) != 0) {
    goto fail;
  }

  if (read_cmdline_args(&user_args) != 0) {
    goto fail;
  }

  size_t argc2 = 1 + java_opts.len + 3 + user_args.len;
  char **argv2 = (char **)calloc(argc2 + 1, sizeof(char *));
  if (!argv2) {
    goto fail;
  }

  size_t k = 0;
  argv2[k++] = xstrdup(orig_argv[0]);
  for (size_t i = 0; i < java_opts.len; ++i) {
    argv2[k++] = xstrdup(java_opts.items[i]);
  }
  argv2[k++] = xstrdup("-classpath");
  argv2[k++] = classpath;
  classpath = 0;
  argv2[k++] = mainclass;
  mainclass = 0;
  for (size_t i = 0; i < user_args.len; ++i) {
    argv2[k++] = xstrdup(user_args.items[i]);
  }
  argv2[k] = 0;

  *out_argc = (int)argc2;
  *out_argv = argv2;

  free(app_root);
  free(appdir);
  free(cfg);
  free(mainclass);
  free(classpath);
  strvec_free(&java_opts);
  strvec_free(&user_args);
  return 0;

fail:
  free(app_root);
  free(appdir);
  free(cfg);
  free(mainclass);
  free(classpath);
  strvec_free(&java_opts);
  strvec_free(&user_args);
  return -1;
}

static int is_bad_launcher_ptr(const char *p) {
  uintptr_t u = (uintptr_t)p;
  if (u == 0) {
    return 1;
  }

  if ((u & 0xffffffff00000000ULL) == 0xffffffff00000000ULL) {
    return 1;
  }

  if ((u & 0xffffffff00000000ULL) == 0x0000000000000000ULL) {
    return 1;
  }

  return 0;
}

int setenv(const char *name, const char *value, int overwrite) {
  init_real_symbols();
  if (!real_setenv_fn) {
    return -1;
  }

  /*
   * Broken launcher currently feeds corrupted pointers (or empty names) here.
   * Return success to avoid early crash; real launch arguments are rebuilt in
   * JLI_Launch wrapper below.
   */
  if (is_bad_launcher_ptr(name) || is_bad_launcher_ptr(value)) {
    return 0;
  }
  if (!name || name[0] == '\0') {
    return 0;
  }

  return real_setenv_fn(name, value, overwrite);
}

void *dlsym(void *handle, const char *symbol) {
  init_real_symbols();
  if (!real_dlsym_fn) {
    return 0;
  }

  void *sym = real_dlsym_fn(handle, symbol);
  if (symbol && strcmp(symbol, "JLI_Launch") == 0) {
    real_jli_launch_fn = (jli_launch_fn_t)sym;
    return (void *)JLI_Launch;
  }

  return sym;
}

static int JLI_Launch(int argc,
                      char **argv,
                      int jargc,
                      const char **jargv,
                      int appclassc,
                      const char **appclassv,
                      const char *fullversion,
                      const char *dotversion,
                      const char *pname,
                      const char *lname,
                      int javaargs,
                      int cpwildcard,
                      int javaw,
                      int ergo) {
  init_real_symbols();

  if (!real_jli_launch_fn && real_dlsym_fn) {
    real_jli_launch_fn = (jli_launch_fn_t)real_dlsym_fn(RTLD_NEXT, "JLI_Launch");
  }
  if (!real_jli_launch_fn) {
    return 1;
  }

  if (should_rebuild_launch_args(argc, argv)) {
    int new_argc = 0;
    char **new_argv = 0;
    if (rebuild_launch_args(argv, &new_argc, &new_argv) == 0 && new_argv) {
      return real_jli_launch_fn(new_argc,
                                new_argv,
                                jargc,
                                jargv,
                                appclassc,
                                appclassv,
                                fullversion,
                                dotversion,
                                pname,
                                lname,
                                javaargs,
                                cpwildcard,
                                javaw,
                                ergo);
    }
  }

  return real_jli_launch_fn(argc,
                            argv,
                            jargc,
                            jargv,
                            appclassc,
                            appclassv,
                            fullversion,
                            dotversion,
                            pname,
                            lname,
                            javaargs,
                            cpwildcard,
                            javaw,
                            ergo);
}
