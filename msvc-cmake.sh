#!/bin/sh

if echo -- "$@" | grep -Ewq "(--build|--install|-E|--system-information)" ; then
    cmake "$@"
else
    cmake \
        -DCMAKE_TOOLCHAIN_FILE=/opt/msvc/cmake/toolchain-@PROCESSOR@.cmake \
        -DCMAKE_CROSSCOMPILING_EMULATOR=/usr/bin/wine \
        "$@"
fi

