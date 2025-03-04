#!/bin/sh

# Useful link to keep track of latest API changes:
#
# https://developer.android.com/ndk/downloads/revision_history

_android_arch=$1

if [ -z "${_android_arch}" ]; then
    _android_arch=armv7a-eabi
fi

if [ -z "${ANDROID_HOME}" ]; then
    export ANDROID_HOME=/opt/android-sdk
fi

if [ -z "${ANDROID_NDK_HOME}" ]; then
    export ANDROID_NDK_HOME=/opt/android-ndk
fi

export ANDROID_TOOLCHAIN="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64"
export ANDROID_SYSROOT="${ANDROID_TOOLCHAIN}/sysroot"
export ANDROID_SYSROOT_INCLUDE="${ANDROID_SYSROOT}/usr/include"
export ANDROID_CROSS_PREFIX="${ANDROID_TOOLCHAIN}/bin"

# Minimum Android platform based on:
#
# http://gs.statcounter.com/os-version-market-share/android/mobile-tablet/worldwide
if [ -z "${ANDROID_MINIMUM_PLATFORM}" ]; then
    case "${_android_arch}" in
        aarch64)
            ccArch=aarch64
            ;;
        armv7a-eabi)
            ccArch=armv7a
            ;;
        riscv64)
            ccArch=riscv64
            ;;
        x86)
            ccArch=i686
            ;;
        x86-64)
            ccArch=x86_64
            ;;
        *)
            ccArch=${_android_arch}
            ;;
    esac

    export ANDROID_MINIMUM_PLATFORM=$(find "${ANDROID_CROSS_PREFIX}" -type f -name "${ccArch}-linux-*-clang*" -exec basename {} \; \
                                      | awk -F '-' '{print $3}' | sed 's/android//g' | sed 's/eabi//g' | sort -V | uniq | head -n 1)

    [ -z "${ANDROID_MINIMUM_PLATFORM}" ] && export ANDROID_MINIMUM_PLATFORM=24
fi

get_last() {
    ls "$1" | sort -V | uniq | tail -n 1
}

if [ -z "${ANDROID_BUILD_TOOLS_REVISION}" ]; then
    export ANDROID_BUILD_TOOLS_REVISION=$(get_last "${ANDROID_HOME}/build-tools")
fi

if [ -z "${ANDROID_NDK_PLATFORM}" ]; then
    export ANDROID_NDK_PLATFORM="android-${ANDROID_MINIMUM_PLATFORM}"
fi

case "${_android_arch}" in
    aarch64)
        export ANDROID_SYSROOT_INCLUDE_ABI="${ANDROID_SYSROOT_INCLUDE}/aarch64-linux-android"
        export ANDROID_SYSROOT_LIB="${ANDROID_SYSROOT}/usr/lib/aarch64-linux-android"
        export ANDROID_TOOLS_COMPILER_PREFIX="${ANDROID_CROSS_PREFIX}/aarch64-linux-android${ANDROID_MINIMUM_PLATFORM}-"
        export ANDROID_ABI=arm64-v8a
        ;;
    armv7a-eabi)
        export ANDROID_SYSROOT_INCLUDE_ABI="${ANDROID_SYSROOT_INCLUDE}/arm-linux-androideabi"
        export ANDROID_SYSROOT_LIB="${ANDROID_SYSROOT}/usr/lib/arm-linux-androideabi"
        export ANDROID_TOOLS_COMPILER_PREFIX="${ANDROID_CROSS_PREFIX}/armv7a-linux-androideabi${ANDROID_MINIMUM_PLATFORM}-"
        export ANDROID_ABI=armeabi-v7a
        ;;
    riscv64)
        export ANDROID_SYSROOT_INCLUDE_ABI="${ANDROID_SYSROOT_INCLUDE}/riscv64-linux-android"
        export ANDROID_SYSROOT_LIB="${ANDROID_SYSROOT}/usr/lib/riscv64-linux-android"
        export ANDROID_TOOLS_COMPILER_PREFIX="${ANDROID_CROSS_PREFIX}/riscv64-linux-android${ANDROID_MINIMUM_PLATFORM}-"
        export ANDROID_ABI=riscv64
        ;;
    x86)
        export ANDROID_SYSROOT_INCLUDE_ABI="${ANDROID_SYSROOT_INCLUDE}/i686-linux-android"
        export ANDROID_SYSROOT_LIB="${ANDROID_SYSROOT}/usr/lib/i686-linux-android"
        export ANDROID_TOOLS_COMPILER_PREFIX="${ANDROID_CROSS_PREFIX}/i686-linux-android${ANDROID_MINIMUM_PLATFORM}-"
        export ANDROID_ABI=x86
        ;;
    x86-64)
        export ANDROID_SYSROOT_INCLUDE_ABI="${ANDROID_SYSROOT_INCLUDE}/x86_64-linux-android"
        export ANDROID_SYSROOT_LIB="${ANDROID_SYSROOT}/usr/lib/x86_64-linux-android"
        export ANDROID_TOOLS_COMPILER_PREFIX="${ANDROID_CROSS_PREFIX}/x86_64-linux-android${ANDROID_MINIMUM_PLATFORM}-"
        export ANDROID_ABI=x86_64
        ;;
    *)
        export ANDROID_SYSROOT_INCLUDE_ABI="${ANDROID_SYSROOT_INCLUDE}/${_android_arch}-linux-android"
        export ANDROID_SYSROOT_LIB="${ANDROID_SYSROOT}/usr/lib/${_android_arch}-linux-android"
        export ANDROID_TOOLS_COMPILER_PREFIX="${ANDROID_CROSS_PREFIX}/${_android_arch}-linux-android${ANDROID_MINIMUM_PLATFORM}-"
        export ANDROID_ABI=${_android_arch}
        ;;
esac

if [ -z "${ANDROID_TARGET_PLATFORM}" ]; then
    export ANDROID_TARGET_PLATFORM=$(find "${ANDROID_HOME}/platforms" -type f -name 'android.jar' \
                                     | awk -F/ '{print $5}' | sed 's|android-||g' | sort -V | uniq | tail -n 1)

    if [ -z "${ANDROID_TARGET_PLATFORM}" ]; then
        export ANDROID_TARGET_PLATFORM=$(ls "${ANDROID_SYSROOT_LIB}" | /usr/bin/grep '[0-9]' | sort -V | uniq | tail -n 1)

        [ -z "${ANDROID_TARGET_PLATFORM}" ] && export ANDROID_TARGET_PLATFORM=${ANDROID_MINIMUM_PLATFORM}
    fi
fi

if [ -z "${ANDROID_API_VERSION}" ]; then
    export ANDROID_API_VERSION="android-${ANDROID_TARGET_PLATFORM}"
fi

export ANDROID_SDK_PLATFORM="${ANDROID_HOME}/platforms/${ANDROID_API_VERSION}"
export ANDROID_PLATFORM="${ANDROID_NDK_HOME}/platforms/${ANDROID_NDK_PLATFORM}"
export ANDROID_SDK_JAR="${ANDROID_SDK_PLATFORM}/android.jar"
export ANDROID_PKGCONFIG="android-${_android_arch}-pkg-config"

export ANDROID_SYSROOT_LIB_API="${ANDROID_SYSROOT_LIB}/${ANDROID_MINIMUM_PLATFORM}"
export ANDROID_CC="${ANDROID_TOOLS_COMPILER_PREFIX}clang"
export ANDROID_CXX="${ANDROID_TOOLS_COMPILER_PREFIX}clang++"
export ANDROID_TOOLS_PREFIX="${ANDROID_CROSS_PREFIX}/llvm-"
export ANDROID_AR="${ANDROID_TOOLS_PREFIX}ar"
export ANDROID_AS="${ANDROID_TOOLS_PREFIX}as"
export ANDROID_LD="${ANDROID_CROSS_PREFIX}/ld"
export ANDROID_NM="${ANDROID_TOOLS_PREFIX}nm"
export ANDROID_OBJCOPY="${ANDROID_TOOLS_PREFIX}objcopy"
export ANDROID_OBJDUMP="${ANDROID_TOOLS_PREFIX}objdump"
export ANDROID_RANLIB="${ANDROID_TOOLS_PREFIX}ranlib"
export ANDROID_STRIP="${ANDROID_TOOLS_PREFIX}strip"

if [ -z "${ANDROID_EXTERNAL_LIBS}" ]; then
    export ANDROID_EXTERNAL_LIBS=/opt/android-libs
fi

export ANDROID_PREFIX="${ANDROID_EXTERNAL_LIBS}/${_android_arch}"
export ANDROID_PREFIX_USR="${ANDROID_PREFIX}/usr"
export ANDROID_PREFIX_BIN="${ANDROID_PREFIX}/bin"
export ANDROID_PREFIX_INCLUDE="${ANDROID_PREFIX}/include"
export ANDROID_PREFIX_LIB="${ANDROID_PREFIX}/lib"
export ANDROID_PREFIX_ETC="${ANDROID_PREFIX}/etc"
export ANDROID_PREFIX_SHARE="${ANDROID_PREFIX}/share"
export ANDROID_PREFIX_VAR="${ANDROID_PREFIX}/var"
export PKG_CONFIG_SYSROOT_DIR="${ANDROID_PREFIX}"
export PKG_CONFIG_LIBDIR="${ANDROID_PREFIX_LIB}/pkgconfig:${ANDROID_PREFIX_SHARE}/pkgconfig"

export ANDROID_CFLAGS="${ANDROID_CFLAGS} -O2 -pipe -fno-plt -fexceptions -I${ANDROID_PREFIX_INCLUDE}"
export ANDROID_CPPFLAGS="${ANDROID_CPPFLAGS} -D_FORTIFY_SOURCE=2 -D__USE_FORTIFY_LEVEL=2 -I${ANDROID_PREFIX_INCLUDE}"
export ANDROID_CXXFLAGS="${ANDROID_CXXFLAGS} -O2 -pipe -fno-plt -fexceptions -I${ANDROID_PREFIX_INCLUDE}"
export ANDROID_LDFLAGS="${ANDROID_LDFLAGS} -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now,-z,max-page-size=16384 -L${ANDROID_PREFIX_LIB}"

if [ -z "${ANDROID_WHITHOUT_CENV}" ]; then
    export CC="${ANDROID_CC}"
    export CXX="${ANDROID_CXX}"
    export AR="${ANDROID_AR}"
    export LD="${ANDROID_LD}"
    export NM="${ANDROID_NM}"
    export OBJCOPY="${ANDROID_OBJCOPY}"
    export OBJDUMP="${ANDROID_OBJDUMP}"
    export RANLIB="${ANDROID_RANLIB}"
    export STRIP="${ANDROID_STRIP}"
    export CFLAGS="${CFLAGS} ${ANDROID_CFLAGS}"
    export CPPFLAGS="${CPPFLAGS} ${ANDROID_CPPFLAGS}"
    export CXXFLAGS="${CXXFLAGS} ${ANDROID_CXXFLAGS}"
    export LDFLAGS="${LDFLAGS} ${ANDROID_LDFLAGS}"
fi

export ANDROID_CC_VERSION=$(${ANDROID_CC} -dumpversion)
export ANDROID_CC_VERSION_MAJOR=$(echo "${ANDROID_CC_VERSION}" | awk -F. '{print $1}')

case "${_android_arch}" in
    aarch64)
        export ANDROID_CC_ABI_LIB="${ANDROID_TOOLCHAIN}/lib/clang/${ANDROID_CC_VERSION_MAJOR}/lib/linux/aarch64"
        ;;
    armv7a-eabi)
        export ANDROID_CC_ABI_LIB="${ANDROID_TOOLCHAIN}/lib/clang/${ANDROID_CC_VERSION_MAJOR}/lib/linux/arm"
        ;;
    riscv64)
        export ANDROID_CC_ABI_LIB="${ANDROID_TOOLCHAIN}/lib/clang/${ANDROID_CC_VERSION_MAJOR}/lib/linux/riscv64"
        ;;
    x86)
        export ANDROID_CC_ABI_LIB="${ANDROID_TOOLCHAIN}/lib/clang/${ANDROID_CC_VERSION_MAJOR}/lib/linux/i386"
        ;;
    x86-64)
        export ANDROID_CC_ABI_LIB="${ANDROID_TOOLCHAIN}/lib/clang/${ANDROID_CC_VERSION_MAJOR}/lib/linux/x86_64"
        ;;
    *)
        export ANDROID_CC_ABI_LIB="${ANDROID_TOOLCHAIN}/lib/clang/${ANDROID_CC_VERSION_MAJOR}/lib/linux/${_android_arch}"
        ;;
esac

ndk_version() {
    grep 'Pkg.Revision' "${ANDROID_NDK_HOME}/source.properties" | awk '{print $3}'
}

check_ndk_version_ge_than() {
    version=$1
    ndk_ver=$(ndk_version)

    if [ "${version}" = "${ndk_ver}" ]; then
        return 0
    fi

    older_ver=$(printf "${version}\n${ndk_ver}" | sort -V | head -n 1)

    if [ "${older_ver}" = "${ndk_ver}" ]; then
        echo "ERROR: NDK version >= ${version} required."

        return -1
    fi

    return 0
}

check_android_platform() {
    if [ ! -e "${ANDROID_SDK_PLATFORM}/source.properties" ]; then
        echo "ERROR: Please, install android-platform-${ANDROID_TARGET_PLATFORM}."

        return -1
    fi

    return 0
}
