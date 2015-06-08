#!/bin/sh
mingw_c_flags="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
LDFLAGS=""
export CFLAGS="$mingw_c_flags $CFLAGS"
export CXXFLAGS="$mingw_c_flags $CXXFLAGS"
../configure --host=@TRIPLE@ --target=@TRIPLE@ --build="$CHOST" \
  --prefix=/usr/@TRIPLE@ --libdir=/usr/@TRIPLE@/lib --includedir=/usr/@TRIPLE@/include \
  --enable-shared --enable-static "$@"

