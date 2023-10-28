#include <stdio.h>

#define X_FN(f) int f() { puts("called"); return 0; }
X_FN(XInternAtoms)
X_FN(XChangeProperty)
X_FN(XGetGeometry)
X_FN(XInternAtom)
X_FN(XMoveResizeWindow)
X_FN(XSendEvent)
X_FN(XSetClassHint)
X_FN(XSetErrorHandler)
X_FN(XSetIOErrorHandler)
X_FN(XStoreName)
X_FN(XTranslateCoordinates)
