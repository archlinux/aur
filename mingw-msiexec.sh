#!/bin/sh

set -e

mingw_prefix=/usr/@TRIPLE@

# run it in a custom WINEPREFIX to not mess with default ~/.wine
# also default prefix might be a 32 bits prefix, which will fail to run x86_64 exes
export WINEPREFIX=${HOME}/.wine-@TRIPLE@

if test "@TRIPLE@" = "x86_64-w64-mingw32"
then
  export WINEARCH=win64
else
  export WINEARCH=win32
fi

/usr/bin/msiexec "$@"

