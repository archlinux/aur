#!/bin/sh

_mingw_arch=$1

default_mingw_pp_flags="-D_FORTIFY_SOURCE=3 -D_GLIBCXX_ASSERTIONS"
default_mingw_compiler_flags="$default_mingw_pp_flags -O2 -pipe -fexceptions --param=ssp-buffer-size=4 -Wformat -Werror=format-security -fcf-protection"
default_mingw_linker_flags="-Wl,-O1,--sort-common,--as-needed -fstack-protector"

export CPPFLAGS="${MINGW_CPPFLAGS:-$default_mingw_pp_flags $CPPFLAGS}"
export CFLAGS="${MINGW_CFLAGS:-$default_mingw_compiler_flags $CFLAGS}"
export CXXFLAGS="${MINGW_CXXFLAGS:-$default_mingw_compiler_flags $CXXFLAGS}"
export LDFLAGS="${MINGW_LDFLAGS:-$default_mingw_linker_flags $LDFLAGS}"

export CC="${MINGW_CC:-$_mingw_arch-gcc}"
export CXX="${MINGW_CXX:-$_mingw_arch-g++}"

mingw_prefix=/usr/${_mingw_arch}
export PKG_CONFIG_SYSROOT_DIR="${mingw_prefix}"
export PKG_CONFIG_LIBDIR="${mingw_prefix}/lib/pkgconfig:${mingw_prefix}/share/pkgconfig"
