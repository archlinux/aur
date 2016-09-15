#!/bin/sh

PACKAGE="opkg"

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

cd "$srcdir"
DIE=0

if [ \( $# -eq 1 \) -a \( "$1" = "--clean" \) ]; then
    # Deep clean of all generated files
    echo "Removing old files (no Makefile around?) ..."
    rm -f configure
    rm -f config.log config.status
    rm -f libtool
    rm -f aclocal.m4
    rm -f libopkg.pc
    rm -f man/opkg.1 man/opkg.conf.5 man/opkg-key.1
    rm -f Makefile Makefile.in
    rm -f libopkg/Makefile libopkg/Makefile.in
    rm -f man/Makefile man/Makefile.in
    rm -f utils/Makefile utils/Makefile.in
    rm -f src/Makefile src/Makefile.in
    rm -f config.h config.h.in
    rm -f m4/lt*.m4 m4/libtool.m4 m4/pkg.m4
    rm -rf po conf autom4te.cache
    rm -rf libopkg/.deps src/.deps
    rm -rf libopkg/.libs src/.libs

    rm -f libopkg/*.o src/*.o
    rm -f libopkg/*.lo
    rm -f libopkg/*.la
    rm -f src/opkg
    rm -f stamp-h1

    rm -f tests/*.pyc tests/*.pyo
    rm -rf tests/__pycache__

    echo "Done. If you want regenerate the Autotool files call 'autogen.sh' without the '--clean' argument."
    exit 0
fi

(autoconf --version) < /dev/null > /dev/null 2>&1 || {
    echo
    echo "You must have autoconf installed to compile $PACKAGE."
    echo "Download the appropriate PACKAGE for your system,"
    echo "or get the source from one of the GNU ftp sites"
    echo "listed in http://www.gnu.org/order/ftp.html"
    DIE=1
}

(automake --version) < /dev/null > /dev/null 2>&1 || {
    echo
    echo "You must have automake installed to compile $PACKAGE."
    echo "Download the appropriate PACKAGE for your system,"
    echo "or get the source from one of the GNU ftp sites"
    echo "listed in http://www.gnu.org/order/ftp.html"
    DIE=1
}

(libtool --version) < /dev/null > /dev/null 2>&1 || {
    echo
    echo "You must have libtool installed to compile $PACKAGE."
    echo "Download the appropriate PACKAGE for your system,"
    echo "or get the source from one of the GNU ftp sites"
    echo "listed in http://www.gnu.org/order/ftp.html"
    DIE=1
}

# currently gettext is not used, no need to check
#(gettext --version) < /dev/null > /dev/null 2>&1 || {
#   echo
#   echo "You must have gettext installed to compile $PACKAGE."
#   echo "Download the appropriate PACKAGE for your system,"
#   echo "or get the source from one of the GNU ftp sites"
#   echo "listed in http://www.gnu.org/order/ftp.html"
#   DIE=1
#}

if test "$DIE" -eq 1; then
    exit 1
fi

# Suppress warning about 'm4' directory not existing
mkdir -p m4

echo "Generating configuration files for $PACKAGE, please wait...."
if [ "$ACLOCAL_FLAGS" = "" ]; then
    echo "No option for 'aclocal' given. Possibly you have forgotten to use 'ACLOCAL_FLAGS='?"
fi

echo "  aclocal --install -I m4 $ACLOCAL_FLAGS"
aclocal --install -I m4 $ACLOCAL_FLAGS
if [ "$?" = "1" ]; then
    echo "aclocal failed!" && exit 1
fi

echo "  libtoolize --automake --install"
libtoolize --automake --install
if [ "$?" = "1" ]; then
    echo "libtoolize failed!" && exit 1
fi

#echo "  gettextize"
#gettextize
#if [ "$?" = "1" ]; then
#   "echo gettextsize failed!" && exit 1
#fi
echo "  autoconf"
autoconf
if [ "$?" = "1" ]; then
    echo "autoconf failed!" && exit 1
fi

echo "  autoheader"
autoheader
if [ "$?" = "1" ]; then
    echo "autoheader failed!" && exit 1
fi

echo "  automake --add-missing"
automake --add-missing
if [ "$?" = "1" ]; then
    echo "automake failed!" && exit 1
fi

echo "You can now run 'configure [options]' to configure $PACKAGE."
