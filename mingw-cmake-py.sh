#!/bin/sh
mingw_prefix=/usr/@TRIPLE@

@TRIPLE@-cmake \
    -DPYTHON_INCLUDE_DIR=${mingw_prefix}/include/python@PYMAJMIN@ \
    -DPYTHON_LIBRARY=${mingw_prefix}/lib/libpython@PYMAJMIN@.dll.a \
    -DPYTHON_EXECUTABLE=/usr/bin/@TRIPLE@-python@PYMAJMIN@-bin \
    "$@"
