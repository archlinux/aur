#!/bin/sh

cmake \
    -DCMAKE_TOOLCHAIN_FILE=/opt/msvc/cmake/toolchain-@PROCESSOR@.cmake \
    -DCMAKE_CROSSCOMPILING_EMULATOR=/usr/bin/wine \
    "$@"
