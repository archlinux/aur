#!/bin/sh
djgpp_prefix=/usr/i686-pc-msdosdjgpp

export PKG_CONFIG_LIBDIR="${djgpp_prefix}/lib/pkgconfig"

djgpp_c_flags="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
export CFLAGS="$djgpp_c_flags"
export CXXFLAGS="$djgpp_c_flags"

PATH=${djgpp_prefix}/bin:$PATH cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=${djgpp_prefix} \
    -DCMAKE_INSTALL_LIBDIR:PATH=${djgpp_prefix}/lib \
    -DINCLUDE_INSTALL_DIR:PATH=${djgpp_prefix}/include \
    -DLIB_INSTALL_DIR:PATH=${djgpp_prefix}/lib \
    -DSYSCONF_INSTALL_DIR:PATH=${djgpp_prefix}/etc \
    -DSHARE_INSTALL_DIR:PATH=${djgpp_prefix}/share \
    -DBUILD_SHARED_LIBS:BOOL=OFF \
    -DCMAKE_TOOLCHAIN_FILE=/usr/share/djgpp/toolchain-i686-pc-msdosdjgpp.cmake \
    -DCMAKE_CROSSCOMPILING_EMULATOR=/usr/bin/i686-pc-msdosdjgpp-wine \
    "$@"
