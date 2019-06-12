#!/bin/sh

source android-env @TRIPLE@

default_android_pp_flags="-D_FORTIFY_SOURCE=2"
default_android_compiler_flags="-O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4"
default_android_linker_flags="-Wl,-O1,--sort-common,--as-needed"

export CC=${ANDROID_CC}
export CXX=${ANDROID_CXX}
export CPPFLAGS="${ANDROID_CPPFLAGS:-$default_android_pp_flags $CPPFLAGS}"
export CFLAGS="${ANDROID_CFLAGS:-$default_android_compiler_flags $CFLAGS}"
export CXXFLAGS="${ANDROID_CXXFLAGS:-$default_android_compiler_flags $CXXFLAGS}"
export LDFLAGS="${ANDROID_LDFLAGS:-$default_android_linker_flags $LDFLAGS}"
target=@TRIPLE@
target=${target/x86-/x86_}-linux-android

./configure \
    --host=${target} \
    --target=${target} \
    --build=${CHOST} \
    --prefix=${ANDROID_PREFIX} \
    --libdir=${ANDROID_PREFIX_LIB} \
    --includedir=${ANDROID_PREFIX_INCLUDE} \
    --enable-shared \
    --enable-static
    "$@"
