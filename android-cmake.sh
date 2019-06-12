#!/bin/sh

source android-env @TRIPLE@

default_android_pp_flags="-D_FORTIFY_SOURCE=2"
default_android_compiler_flags="$default_android_pp_flags -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4"
default_android_linker_flags="-Wl,-O1,--sort-common,--as-needed"

export CPPFLAGS="${ANDROID_CPPFLAGS:-$default_android_pp_flags $CPPFLAGS}"
export CFLAGS="${ANDROID_CFLAGS:-$default_android_compiler_flags $CFLAGS}"
export CXXFLAGS="${ANDROID_CXXFLAGS:-$default_android_compiler_flags $CXXFLAGS}"
export LDFLAGS="${ANDROID_LDFLAGS:-$default_android_linker_flags $LDFLAGS}"

PATH=${ANDROID_PREFIX_BIN}:$PATH cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=${ANDROID_PREFIX} \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DINCLUDE_INSTALL_DIR:PATH=${ANDROID_PREFIX_INCLUDE} \
    -DLIB_INSTALL_DIR:PATH=${ANDROID_PREFIX_LIB} \
    -DSYSCONF_INSTALL_DIR:PATH=${ANDROID_PREFIX_ETC} \
    -DSHARE_INSTALL_DIR:PATH=${ANDROID_PREFIX_SHARE} \
    -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH=${ANDROID_PREFIX_INCLUDE} \
    -DCMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES:PATH=${ANDROID_PREFIX_INCLUDE} \
    -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DANDROID_ABI=${ANDROID_ABI} \
    -DANDROID_NDK=${ANDROID_NDK_HOME} \
    -DANDROID_NATIVE_API_LEVEL=${ANDROID_MINIMUM_PLATFORM} \
    -DANDROID_TOOLCHAIN=clang \
    -DCMAKE_C_FLAGS_RELEASE="$CFLAGS" \
    -DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS" \
    -DCMAKE_SHARED_LINKER_FLAGS_RELEASE="$LDFLAGS" \
    "$@"
