#!/bin/sh

set -e

mingw_prefix=/usr/@TRIPLE@

# wine requires the dlls to lie next to the exe
if test -f "$1"
then
  path=`dirname $1`
  if ! test -f "${path}/libstdc++-6.dll"
  then
    cp ${mingw_prefix}/bin/*.dll ${path}
  fi
fi

# run it in a custom WINEPREFIX to not mess with default ~/.wine
# also default prefix might be a 32 bits prefix, which will fail to run x86_64 exes
if ! test -d "${WINEPREFIX}"
then
  WINEPREFIX=~/.wine-@TRIPLE@ wine "$@"
else
  wine "$@"
fi
