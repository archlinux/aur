#!/bin/sh

set -e

# run it in a custom WINEPREFIX to not mess with default ~/.wine
mingw_prefix=/usr/@TRIPLE@
export WINEPREFIX=${HOME}/.wine-@TRIPLE@

# WINEPATH is used to find dlls, otherwise they should lie next to the exe
if test -z ${WINEPATH+x}
then
  export WINEPATH=${mingw_prefix}/bin
fi

if test -z ${WINEDLLOVERRIDES+x}
then
  export WINEDLLOVERRIDES="mscoree,mshtml="
fi

if test -z ${WINEDEBUG+x}
then
  export WINEDEBUG=-all
fi

/usr/bin/wine "$@"
