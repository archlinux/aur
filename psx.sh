#!/bin/sh

psx_libdir="/usr/lib/pSX"
psx_sharedir="/usr/share/pSX"
psx_localdir="$HOME/.pSX"

# create local directories if not present
mkdir -p "$psx_localdir"/{bios,cdimages}

# copy and edit configuration if not present
if ! [ -f "$psx_localdir/psx.ini" ]; then
  cp $psx_sharedir/psx.ini "$psx_localdir"
  sed -e "s|psx_localdir|"$psx_localdir"|" \
      -i "$psx_localdir/psx.ini"
fi

# create links for every bios and every cdimage in psx_sharedir
if [ $(ls -1A $psx_sharedir/bios | wc -l) -gt 0 ]; then
  for i in $psx_sharedir/bios/*; do
    ln -sf "$i" "$psx_localdir/bios/$(basename "$i")"
  done
fi

if [ $(ls -1A $psx_sharedir/cdimages | wc -l) -gt 0 ]; then
  for i in $psx_sharedir/cdimages/*; do
    ln -sf "$i" "$psx_localdir/cdimages/$(basename "$i")"
  done
fi

# here we go!
$psx_libdir/pSX "$@"
