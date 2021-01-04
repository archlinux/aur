VERSION = 6.2
PREFIX = /usr/local
X11INC = /usr/include/X11
X11LIB = /usr/lib/X11
# Xinerama, uncomment for multi-monitor
#XINERAMALIBS = -lXinerama
#XINERAMAFLAGS = -DXINERAMA
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/include/freetype2
INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS}
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_C_SOURCE=200809L -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS += -std=c99 -pedantic -Wall -Wno-deprecated-declarations ${INCS} ${CPPFLAGS}
LDFLAGS = ${LIBS}
CC = cc
