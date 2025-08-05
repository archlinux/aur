#!/bin/sh

set -e

# run it in a custom WINEPREFIX to not mess with default ~/.wine
mingw_prefix=/usr/@TRIPLE@
export WINEPREFIX=${HOME}/.wine-@TRIPLE@

if test -z ${WINEDLLOVERRIDES+x}
then
  export WINEDLLOVERRIDES="mscoree,mshtml="
fi

if test -z ${WINEDEBUG+x}
then
  export WINEDEBUG=-all
fi

/usr/bin/msiexec "$@"

