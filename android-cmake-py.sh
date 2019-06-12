#!/bin/sh

source android-env @TRIPLE@

android-@TRIPLE@-cmake \
    -DPYTHON_INCLUDE_DIR=${ANDROID_PREFIX_INCLUDE}/python@PYMAJMIN@ \
    -DPYTHON_LIBRARY=${ANDROID_PREFIX_LIB}/libpython@PYMAJMIN@.a \
    -DPYTHON_EXECUTABLE=/usr/bin/android-@TRIPLE@-python@PYMAJMIN@-bin \
    "$@"
