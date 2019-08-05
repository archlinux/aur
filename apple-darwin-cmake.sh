#!/bin/sh
prefix=@PREFIX@

additional_args=" \
  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
  -DCMAKE_INSTALL_LIBDIR:PATH=${prefix}/lib \
  -DINCLUDE_INSTALL_DIR:PATH=${prefix}/include \
  -DCMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES:PATH=${prefix}/include \
  -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH=${prefix}/include \
  -DLIB_INSTALL_DIR:PATH=${prefix}/lib \
  -DSYSCONF_INSTALL_DIR:PATH=${prefix}/etc \
  -DSHARE_INSTALL_DIR:PATH=${prefix}/share \
  -DCMAKE_TOOLCHAIN_FILE=@OSXCROSSDIR@/share/apple-darwin/toolchain-@TRIPLE@.cmake"

[[ ! $PREVENT_FORCING_SHARED_LIBS ]] &&
  additional_args+=' -DBUILD_SHARED_LIBS:BOOL=ON' ||
  additional_args+=' -DBUILD_SHARED_LIBS:BOOL=OFF'

PATH="@OSXCROSSDIR@/bin:${prefix}/bin:$PATH" cmake $additional_args "$@"
