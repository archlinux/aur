#include <dlfcn.h>
#include <stdio.h>
#include <limits.h>
#include <sys/stat.h>

/* Simple program to see if dlopen() would succeed. */
int main(int argc, char **argv)
{
	int i;
	struct stat st;
	char buf[PATH_MAX];

	for (i=1; i<argc; i++) {
		if (dlopen(argv[i], RTLD_NOW)) {
			fprintf(stdout, "dlopen() of '%s' succeeded.\n", argv[i]);
			}
		else {
			snprintf(buf, sizeof (buf), "./%s", argv[i]);
			if ((!stat(buf, &st)) && dlopen(buf, RTLD_NOW)) {
				fprintf(stdout, "dlopen() of './%s' succeeded.\n", argv[i]);
				}
			else {
				fprintf(stdout, "dlopen() of '%s' failed: %s\n", argv[i], dlerror());
				return 1;
				}
			}
		}
	return 0;
}
