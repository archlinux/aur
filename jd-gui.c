#include <stdlib.h>
#include <jni.h>

int JLI_Launch(int argc, char** argv,
               int jargc, const char** jargv,
               int appclassc, const char** appclassv,
               const char* fullversion,
               const char* dotversion,
               const char* pname,
               const char* lname,
               jboolean javaargs,
               jboolean cpwildcard,
               jboolean javaw,
               jint ergo);

int main(int argc, char* argv[])
{
    int jli_argc = argc + 3;
    int size = jli_argc * sizeof(void*);
    char** jli_argv = malloc(size);

    jli_argv[0] = argv[0];
    jli_argv[1] = "-jar";
    jli_argv[2] = "-Dawt.useSystemAAFontSettings=on";
    jli_argv[3] = "/usr/share/java/jd-gui/jd-gui.jar";

    for(int c = 1; c < argc; c++)
        jli_argv[c + 2] = argv[c];

    int ret = JLI_Launch(jli_argc, jli_argv,
                     0, NULL,
                     0, NULL,
                     ARCH_PKGVER "-" ARCH_PKGREL,
                     ARCH_PKGVER,
                     "jd-gui",
                     "jd-gui",
                     JNI_FALSE,
                     JNI_FALSE,
                     JNI_FALSE,
                     0);

    free(jli_argv);

    return ret;
}
