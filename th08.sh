#!/bin/bash

export WINEPREFIX="$HOME/.th08/wine"
export WINEDLLOVERRIDES="mscoree=;mshtml="

if [ ! -d "$HOME"/.th08 ] ; then
  mkdir -p "$HOME"/.th08/wine || exit 1
  ln -s /usr/share/th08/th08.exe "$HOME"/.th08/th08.exe || exit 1
  ln -s /usr/share/th08/custom.exe "$HOME"/.th08/custom.exe || exit 1
  ln -s /usr/share/th08/th08tr.dat "$HOME"/.th08/th08tr.dat || exit 1
fi
if [ ! -f "$HOME"/.th08/th08.cfg ] ; then
  echo "AAABAAIABAD//////////wMAAAABAAgAWAJYAgIDAAIBAQAAAgAAZFAAAAAAAAAAAAAAAAAAAAABCAAA"|base64 -d >~/.th08/th08.cfg
fi
if [ "" != "`whereis timidity|grep '/usr/bin'`" ] ; then
  if [ "" == "`ps -A|grep timidity`" ] ; then
    timidity -iA &
    myins="true"
  fi
fi
# this sed is to make sure directinput is always activaded.
# the controls can be a bit unresponsive without it
mv ~/.th08/th08.cfg ~/.th08/th08.cfg.bak
base64 th08.cfg.bak -w 0|sed 's/.\(...\)$/C\1/'|base64 -d>~/.th08/th08.cfg
rm ~/.th08/th08.cfg.bak

cd ~/.th08
if [ -e "$HOME"/.th08/th08e.exe ]; then
  wine "$HOME"/.th08/th08e.exe "$@"
fi
if [ ! -e "$HOME"/.th08/th08e.exe ]; then
  wine "$HOME"/.th08/th08.exe "$@"
fi
if [ "true" == "$myins" ] ; then
  killall timidity
fi

