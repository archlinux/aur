#!/bin/sh

set -e

mingw_prefix=/usr/@TRIPLE@

# run it in a custom WINEPREFIX to not mess with default ~/.wine
# also default prefix might be a 32 bits prefix, which will fail to run x86_64 exes
if ! test -d "${WINEPREFIX}"
then
  export WINEPREFIX=~/.wine-@TRIPLE@
fi

# WINEPATH is used to find dlls, otherwise they should lie next to the exe
if test -z "${WINEPATH}"
then
  export WINEPATH=${mingw_prefix}/bin
fi

wine "$@"

