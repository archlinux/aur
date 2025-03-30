#include <sys/types.h>
#include <stdbool.h>
#include <stdlib.h>
#include <dirent.h>
#include <string.h>
#include <limits.h>
#include <dlfcn.h>
#include <regex.h>
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
    char *ret = NULL;

    const struct dirent* entry = NULL;
    bool oracle_jvm_found = false;
    regex_t reg_java_version;
    regex_t reg_implementor;
    char pathname[PATH_MAX];
    char line[1024];
    char *jvm_dirname = NULL;
    int jvm_version = INT_MAX;
    DIR* dir = NULL;

    dir = opendir("/usr/lib/jvm");
    if (!dir) {
        return NULL;
    }

    regcomp(&reg_java_version, "^\\s*JAVA_VERSION\\s*=\\s*\"(.*)\"\\s*$", REG_EXTENDED|REG_ICASE);
    regcomp(&reg_implementor, "^\\s*IMPLEMENTOR\\s*=\\s*\"(.*)\"\\s*$", REG_EXTENDED|REG_ICASE);

    while((entry = readdir(dir)) != NULL) {
        if (entry->d_type == DT_DIR) {
            const char *dirname = entry->d_name;

            if ((strcmp(dirname, ".") == 0)||(strcmp(dirname, "..") == 0))
                continue;

            snprintf(pathname, sizeof(pathname), "/usr/lib/jvm/%s/release", dirname);

            FILE *f = fopen(pathname, "r");
            if (f == NULL) break;

            char *implementor_str = NULL;
            char *version_str = NULL;

            while(fgets(line, sizeof(line), f)) {
                if (implementor_str == NULL) {
                    regmatch_t matches[2];
                    int res = regexec(&reg_implementor, line, sizeof(matches) / sizeof(matches[0]), matches, 0);
                    if (res == 0) {
                        int size = matches[1].rm_eo - matches[1].rm_so;
                        implementor_str = malloc(size + 1);
                        if (implementor_str == NULL) break;
                        memcpy(implementor_str, line + matches[1].rm_so, size);
                        implementor_str[size] = '\0';
                    }
                }
                if (version_str == NULL) {
                    regmatch_t matches[2];
                    int res = regexec(&reg_java_version, line, sizeof(matches) / sizeof(matches[0]), matches, 0);
                    if (res == 0) {
                        int size = matches[1].rm_eo - matches[1].rm_so;
                        version_str = malloc(size + 1);
                        if (version_str == NULL) break;
                        memcpy(version_str, line + matches[1].rm_so, size);
                        version_str[size] = '\0';
                    }
                }

                if ((implementor_str != NULL)&&(version_str != NULL))
                    break;
            }

            if ((implementor_str != NULL)&&(version_str != NULL)) {
                int version = atoi(version_str);
                bool is_oracle_jvm = strcmp(implementor_str, "Oracle Corporation") == 0;
                if ((is_oracle_jvm)&&(version >= MIN_JVM_VERSION)) {
                    if ((!oracle_jvm_found)||(version > jvm_version)) {
                        jvm_dirname = strdup(dirname);
                        jvm_version = version;
                        oracle_jvm_found = true;
                    }
                } else {
                    if (((version >= MIN_JVM_VERSION)&&(version < jvm_version))||((version == MIN_JVM_VERSION)&&(!oracle_jvm_found))) {
                        if (jvm_dirname) free(jvm_dirname);
                        jvm_dirname = strdup(dirname);
                        jvm_version = version;
                    }
                }
            }

            if (implementor_str) free(implementor_str);
            if (version_str) free(version_str);

            fclose(f);
        }
    }

    regfree(&reg_java_version);
    regfree(&reg_implementor);

    if (jvm_dirname) {
        snprintf(pathname, sizeof(pathname), "/usr/lib/jvm/%s/lib/libjli.so", jvm_dirname);
        ret = strdup(pathname);
    } else {
        ret = strdup("/usr/lib/jvm/default/lib/libjli.so");
    }

    if (jvm_dirname) free(jvm_dirname);
    closedir(dir);

    return ret;
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
        jli_argv[c + 3] = argv[c];

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
