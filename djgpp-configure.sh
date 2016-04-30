#!/bin/sh

djgpp_c_flags="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
LDFLAGS=""
export CFLAGS="$djgpp_c_flags $CFLAGS"
export CXXFLAGS="$djgpp_c_flags $CXXFLAGS"
./configure --host=i686-pc-msdosdjgpp --target=i686-pc-msdosdjgpp --build="$CHOST" \
  --prefix=/usr/i686-pc-msdosdjgpp --libdir=/usr/i686-pc-msdosdjgpp/lib --includedir=/usr/i686-pc-msdosdjgpp/include \
  --disable-shared --enable-static "$@"
