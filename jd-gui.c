#include <sys/types.h>
#include <stdbool.h>
#include <stdlib.h>
#include <dirent.h>
#include <string.h>
#include <dlfcn.h>
#include <stdio.h>

const int MIN_JVM_VERSION = 17;

int (*JLI_Launch)(int argc, char** argv,
               int jargc, const char** jargv,
               int appclassc, const char** appclassv,
               const char* fullversion,
               const char* dotversion,
               const char* pname,
               const char* lname,
               unsigned char javaargs,
               unsigned char cpwildcard,
               unsigned char javaw,
               int ergo);

char *find_openjdk_jli_pathname()
{
    const struct dirent* entry = NULL;
    char pathname[PATH_MAX];
    int jvm_version = 0;
    DIR* dir = NULL;

    dir = opendir("/usr/lib/jvm");
    if (!dir) {
        return NULL;
    }

    while((entry = readdir(dir)) != NULL) {
        if (entry->d_type == DT_DIR) {
            int value = 0;
            sscanf(entry->d_name, "java-%d-openjdk", &value);
            if ((value >= MIN_JVM_VERSION)&&((value < jvm_version)||(jvm_version == 0))) {
                jvm_version = value;
            }
        }
    }

    closedir(dir);

    if (jvm_version > 0) {
        snprintf(pathname, sizeof(pathname), "/usr/lib/jvm/java-%d-openjdk/lib/libjli.so", jvm_version);
        return strdup(pathname);
    }

    return NULL;
}

int main(int argc, char* argv[])
{
    int ret = 0;

    char *openjdk_jli_so_pathname = NULL;
    char **jli_argv = NULL;
    void *libjli_so = NULL;
    int jli_argc = 0;
    int size = 0;

    openjdk_jli_so_pathname = find_openjdk_jli_pathname();
    if (!openjdk_jli_so_pathname) {
        fprintf(stderr, "No compatible(openjdk>=%d) Java runtime found!\n", MIN_JVM_VERSION);
        ret = EXIT_FAILURE;
        goto exit;
    }

    libjli_so = dlopen(openjdk_jli_so_pathname, RTLD_LAZY);
    if (!libjli_so) {
        fprintf(stderr, "Error: %s\n", dlerror());
        ret = EXIT_FAILURE;
        goto exit;
    }

    jli_argc = argc + 3;
    size = jli_argc * sizeof(void*);
    jli_argv = malloc(size);
    if (jli_argv == NULL) {
        fprintf(stderr, "Failed to allocate memory!\n");
        ret = EXIT_FAILURE;
        goto exit;
    }

    JLI_Launch = dlsym(libjli_so, "JLI_Launch");
    if (!JLI_Launch) {
        fprintf(stderr, "Error: %s\n", dlerror());
        ret = EXIT_FAILURE;
        goto exit;
    }

    jli_argv[0] = argv[0];
    jli_argv[1] = "-jar";
    jli_argv[2] = "-Dawt.useSystemAAFontSettings=on";
    jli_argv[3] = "/usr/share/java/jd-gui/jd-gui.jar";

    for(int c = 1; c < argc; c++)
        jli_argv[c + 2] = argv[c];

    ret = JLI_Launch(jli_argc, jli_argv,
                     0, NULL,
                     0, NULL,
                     ARCH_PKGVER "-" ARCH_PKGREL,
                     ARCH_PKGVER,
                     "jd-gui",
                     "jd-gui",
                     false,
                     false,
                     false,
                     0);

exit:
    if (openjdk_jli_so_pathname)
        free(openjdk_jli_so_pathname);
    if (jli_argv)
        free(jli_argv);
    if (libjli_so)
        dlclose(libjli_so);

    return ret;
}
