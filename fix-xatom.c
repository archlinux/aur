// Fix X11 clipboard atom-0 crash in JDK/AWT
// Intercepts XGetAtomName to return a valid string for atom 0 (None)
// instead of NULL, preventing NullPointerException in XAtom.getName()
#define _GNU_SOURCE
#include <dlfcn.h>
#include <string.h>
#include <stdlib.h>
#include <X11/Xlib.h>

typedef char *(*real_fn)(Display *, Atom);

char *XGetAtomName(Display *dpy, Atom atom) {
    static real_fn real = NULL;
    if (!real) real = (real_fn)dlsym(RTLD_NEXT, "XGetAtomName");
    if (atom == 0) return strdup("PRIMARY");
    return real(dpy, atom);
}
