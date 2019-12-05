#!/bin/sh

source mingw-env @TRIPLE@

make AR=@TRIPLE@-ar AS=@TRIPLE@-as CC=@TRIPLE@-gcc CXX=@TRIPLE@-g++ CPPFLAGS="${CPPFLAGS}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LD=@TRIPLE@-ld LDFLAGS="${LDFLAGS}" RANLIB=@TRIPLE@-ranlib F77=@TRIPLE@-gfortran F90=@TRIPLE@-gfortran F95=@TRIPLE@-gfortran STRIP=@TRIPLE@-strip NM=@TRIPLE@-nm DLLTOOL=@TRIPLE@-dlltool RC=@TRIPLE@-windres "$@"
