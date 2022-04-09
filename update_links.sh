#!/usr/bin/bash

: ${ANDROID_NDK:="/opt/android-ndk"}
OLLVM_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

processPath(){
    ndk_path=$2
    if [[ $ndk_path == "" ]]; then
        ndk_path=$1
    fi
    linkTo=`readlink "${OLLVM_PATH}/$1"`
    if [[ $linkTo == "${ANDROID_NDK}/$ndk_path" ]]; then
        return
    fi
    echo "Update path for ${OLLVM_PATH}/$1 -> ${ANDROID_NDK}/$ndk_path"
    rm -f "${OLLVM_PATH}/$1"
    ln -s "${ANDROID_NDK}/$ndk_path" "${OLLVM_PATH}/$1"
}

processPath "build"
processPath "source.properties"
processPath "toolchains/llvm/prebuilt/linux-x86_64/sysroot"

ollvm_ver=`${OLLVM_PATH}/toolchains/llvm/prebuilt/linux-x86_64/bin/clang --version | head -1 | awk {'print $3'}`
andllvm_ver=`${ANDROID_NDK}/toolchains/llvm/prebuilt/linux-x86_64/bin/clang --version | head -1 | awk {'print $8'}`
processPath "toolchains/llvm/prebuilt/linux-x86_64/lib/clang/${ollvm_ver}/lib" "toolchains/llvm/prebuilt/linux-x86_64/lib64/clang/${andllvm_ver}/lib"

rm -f "${OLLVM_PATH}/toolchains/llvm/prebuilt/linux-x86_64/ndk-libs"
ln -s "${OLLVM_PATH}/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/${ollvm_ver}/lib" "${OLLVM_PATH}/toolchains/llvm/prebuilt/linux-x86_64/ndk-libs"
