#!/bin/sh

# Useful link to keep track of latest API changes:
#
# https://developer.android.com/ndk/downloads/revision_history

_android_arch=$1

# Minimum Android platform based on:
#
# https://developer.android.com/about/dashboards/
if [ -z "${ANDROID_MINIMUM_PLATFORM}" ]; then
    export ANDROID_MINIMUM_PLATFORM=22
fi

if [ -z "${ANDROID_NDK_ROOT}" ]; then
    export ANDROID_NDK_ROOT=/opt/android-ndk
fi

if [ -z "${ANDROID_SDK_ROOT}" ]; then
    export ANDROID_SDK_ROOT=/opt/android-sdk
fi

get_last() {
    ls $1 | sort -V | tail -n 1
}

if [ -z "${ANDROID_BUILD_TOOLS_REVISION}" ]; then
    export ANDROID_BUILD_TOOLS_REVISION=$(get_last ${ANDROID_SDK_ROOT}/build-tools)
fi

if [ -z "${ANDROID_API_VERSION}" ]; then
    export ANDROID_API_VERSION=android-$ANDROID_MINIMUM_PLATFORM
fi

if [ -z "${ANDROID_NDK_PLATFORM}" ]; then
    export ANDROID_NDK_PLATFORM=android-$ANDROID_MINIMUM_PLATFORM
fi

export ANDROID_PLATFORM=${ANDROID_NDK_ROOT}/platforms/$ANDROID_NDK_PLATFORM
export ANDROID_TOOLCHAIN=${ANDROID_NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64
export ANDROID_SYSROOT=${ANDROID_TOOLCHAIN}/sysroot
export ANDROID_CROSS_PREFIX=$ANDROID_TOOLCHAIN/bin/
export ANDROID_PKGCONFIG=android-${_android_arch}-pkg-config

case "$_android_arch" in
    aarch64)
        export ANDROID_TOOLS_COMPILER_PREFIX=${ANDROID_CROSS_PREFIX}aarch64-linux-android${ANDROID_MINIMUM_PLATFORM}-
        export ANDROID_TOOLS_PREFIX=${ANDROID_CROSS_PREFIX}aarch64-linux-android-
        ;;
    armv7a-eabi)
        export ANDROID_TOOLS_COMPILER_PREFIX=${ANDROID_CROSS_PREFIX}armv7a-linux-androideabi${ANDROID_MINIMUM_PLATFORM}-
        export ANDROID_TOOLS_PREFIX=${ANDROID_CROSS_PREFIX}arm-linux-androideabi-
        ;;
    x86)
        export ANDROID_TOOLS_COMPILER_PREFIX=${ANDROID_CROSS_PREFIX}i686-linux-android${ANDROID_MINIMUM_PLATFORM}-
        export ANDROID_TOOLS_PREFIX=${ANDROID_CROSS_PREFIX}i686-linux-android-
        ;;
    x86-64)
        export ANDROID_TOOLS_COMPILER_PREFIX=${ANDROID_CROSS_PREFIX}x86_64-linux-android${ANDROID_MINIMUM_PLATFORM}-
        export ANDROID_TOOLS_PREFIX=${ANDROID_CROSS_PREFIX}x86_64-linux-android-
        ;;
esac

export ANDROID_CC=${ANDROID_TOOLS_COMPILER_PREFIX}clang
export ANDROID_CXX=${ANDROID_TOOLS_COMPILER_PREFIX}clang++
export ANDROID_AR=${ANDROID_TOOLS_PREFIX}ar
export ANDROID_NM=${ANDROID_TOOLS_PREFIX}nm
export ANDROID_RANLIB=${ANDROID_TOOLS_PREFIX}ranlib
export ANDROID_STRIP=${ANDROID_TOOLS_PREFIX}strip
export ANDROID_LIBS=/opt/android-libs/${_android_arch}
export PKG_CONFIG_SYSROOT_DIR=${ANDROID_LIBS}
export PKG_CONFIG_LIBDIR=${PKG_CONFIG_SYSROOT_DIR}/lib/pkgconfig:${PKG_CONFIG_SYSROOT_DIR}/share/pkgconfig
