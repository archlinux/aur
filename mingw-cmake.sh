#!/bin/sh
mingw_prefix=/usr/@TRIPLE@

export PKG_CONFIG_LIBDIR="${mingw_prefix}/lib/pkgconfig"

mingw_c_flags="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"

PATH=${mingw_prefix}/bin:$PATH cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=${mingw_prefix} \
    -DCMAKE_INSTALL_LIBDIR:PATH=${mingw_prefix}/lib \
    -DINCLUDE_INSTALL_DIR:PATH=${mingw_prefix}/include \
    -DLIB_INSTALL_DIR:PATH=${mingw_prefix}/lib \
    -DSYSCONF_INSTALL_DIR:PATH=${mingw_prefix}/etc \
    -DSHARE_INSTALL_DIR:PATH=${mingw_prefix}/share \
    -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH=${mingw_prefix}/include \
    -DCMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES:PATH=${mingw_prefix}/include \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_TOOLCHAIN_FILE=/usr/share/mingw/toolchain-@TRIPLE@.cmake \
    -DCMAKE_CROSSCOMPILING_EMULATOR=/usr/bin/@TRIPLE@-wine \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS_RELEASE="$mingw_c_flags $CFLAGS" \
    -DCMAKE_CXX_FLAGS_RELEASE="$mingw_c_flags $CXXFLAGS" \
    "$@"
