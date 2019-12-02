#!/bin/sh

_arch=$1

export AR=${_arch}-ar
export AS=${_arch}-as
export CC=${_arch}-gcc
export CXX=${_arch}-g++
export FC=${_arch}-gfortran
export F77=${_arch}-gfortran
export F90=${_arch}-gfortran
export RANLIB=${_arch}-ranlib
export STRIP=${_arch}-strip
export NM=${_arch}-nm

default_mingw_pp_flags="-D_FORTIFY_SOURCE=2"
default_mingw_compiler_flags="$default_mingw_pp_flags -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4"
default_mingw_linker_flags="-Wl,-O1,--sort-common,--as-needed -fstack-protector"

export CPPFLAGS="${MINGW_CPPFLAGS:-$default_mingw_pp_flags $CPPFLAGS}"
export CFLAGS="${MINGW_CFLAGS:-$default_mingw_compiler_flags $CFLAGS}"
export CXXFLAGS="${MINGW_CXXFLAGS:-$default_mingw_compiler_flags $CXXFLAGS}"
export LDFLAGS="${MINGW_LDFLAGS:-$default_mingw_linker_flags $LDFLAGS}"

mingw_prefix=/usr/${_arch}
export PKG_CONFIG_SYSROOT_DIR="${mingw_prefix}"
export PKG_CONFIG_LIBDIR="${mingw_prefix}/lib/pkgconfig:${mingw_prefix}/share/pkgconfig"
