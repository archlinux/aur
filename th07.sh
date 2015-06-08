#!/bin/bash
export WINEPREFIX="$HOME/.th07/wine"
export WINEDLLOVERRIDES="mshtml="

if [ ! -d "$HOME"/.th07 ] ; then
  mkdir -p "$HOME"/.th07/wine || exit 1
  ln -s /usr/share/th07/th07.exe "$HOME"/.th07/th07.exe || exit 1
  ln -s /usr/share/th07/custom.exe "$HOME"/.th07/custom.exe || exit 1
  ln -s /usr/share/th07/th07tr.dat "$HOME"/.th07/th07tr.dat || exit 1
fi

if [ ! -f "$HOME"/.th07/th07.cfg ] ; then
  echo "AAABAAIABAD//////////wMAAAACAAcAWAJYAgIDAAIBAQAAAgABAAAAAAAAAAAAAAAAAAEIAAA=" |base64 -d > "$HOME"/.th07/th07.cfg || exit 1
fi

if [ "" != "`whereis timidity|grep '/usr/bin'`" ] ; then
  if [ "" == "`ps -A|grep timidity`" ] ; then
    timidity -iA &
    myins="true"
  fi
fi

CFG=$(base64 ~/.th07/th07.cfg)
echo $CFG|sed 's/.\(....\)$/I\1/' |base64 -d > ~/.th07/th07.cfg
cd ~/.th07
if [ -e "$HOME"/.th07/th07e.exe ]; then
  wine "$HOME"/.th07/th07e.exe "$@"
fi
if [ ! -e "$HOME"/.th07/th07e.exe ]; then
  wine "$HOME"/.th07/th07.exe "$@"
fi
if [ "true" == "$myins" ] ; then
  killall timidity
fi

