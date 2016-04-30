#!/bin/sh

set -e

djgpp_prefix=/usr/i686-pc-msdosdjgpp

# run it in a custom WINEPREFIX to not mess with default ~/.wine
if ! test -d "${WINEPREFIX}"
then
  export WINEPREFIX=~/.wine-i686-pc-msdosdjgpp
fi

# WINEPATH is used to find dlls, otherwise they should lie next to the exe
if test -z "${WINEPATH}"
then
  export WINEPATH=${djgpp_prefix}/bin
fi

wine "$@"

