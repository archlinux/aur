#define _GNU_SOURCE
#include <dlfcn.h>
#include <pwd.h>
#include <sys/types.h>

/* shared library that replaces the home directory for root in a `getpwuid()` call
 * with a specific location
 *
 * inspired by https://rafalcieslak.wordpress.com/2013/04/02/dynamic-linker-tricks-using-ld_preload-to-cheat-inject-features-and-investigate-programs/
 *
 * Usage:
 * gcc -shared -fPIC -D 'FAKE_HOME="/path/to/fake/directory"' spoof_homedir.c -o spoof_homedir.so -ldl
 * LD_PRELOAD="./spoof_homedir.so" binary_to_spoof
 */

typedef struct passwd *(*orig_getpwuid_f_type)(uid_t uid);

struct passwd *getpwuid(uid_t uid) {
	orig_getpwuid_f_type orig_getpwuid;
	orig_getpwuid = (orig_getpwuid_f_type)dlsym(RTLD_NEXT, "getpwuid");

	struct passwd *result = orig_getpwuid(uid);
	if (uid == 0) {
		result->pw_dir = FAKE_HOME;
	}

	return result;
}
