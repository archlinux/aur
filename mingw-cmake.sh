#!/bin/sh
mingw_prefix=/usr/@TRIPLE@

export PKG_CONFIG_LIBDIR="${mingw_prefix}/lib/pkgconfig"

default_mingw_compiler_flags="-D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4"
default_mingw_linker_flags="-Wl,-O1,--sort-common,--as-needed -fstack-protector"

export CFLAGS="${MINGW_CFLAGS:-$default_mingw_compiler_flags $CFLAGS}"
export CXXFLAGS="${MINGW_CXXFLAGS:-$default_mingw_compiler_flags $CXXFLAGS}"
export LDFLAGS="${MINGW_LDFLAGS:-$default_mingw_linker_flags $LDFLAGS}"

PATH=${mingw_prefix}/bin:$PATH cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=${mingw_prefix} \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DINCLUDE_INSTALL_DIR:PATH=${mingw_prefix}/include \
    -DLIB_INSTALL_DIR:PATH=${mingw_prefix}/lib \
    -DSYSCONF_INSTALL_DIR:PATH=${mingw_prefix}/etc \
    -DSHARE_INSTALL_DIR:PATH=${mingw_prefix}/share \
    -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH=${mingw_prefix}/include \
    -DCMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES:PATH=${mingw_prefix}/include \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_TOOLCHAIN_FILE=/usr/share/mingw/toolchain-@TRIPLE@.cmake \
    -DCMAKE_CROSSCOMPILING_EMULATOR=/usr/bin/@TRIPLE@-wine \
    "$@"
