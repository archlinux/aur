#!/bin/bash
unset WINEPREFIX
export WINEDLLOVERRIDES="mscoree,mshtml="

if [ ! -d "$HOME"/.clrmamepro ] ; then
   mkdir -p "$HOME"/.clrmamepro
   ln -s /usr/share/clrmamepro/cmpro.exe "$HOME"/.clrmamepro/cmpro || exit 1
   ln -s /usr/share/clrmamepro/engine.cfg "$HOME"/.clrmamepro/engine.cfg || exit 1
   ln -s /usr/share/clrmamepro/setformat.xml "$HOME"/.clrmamepro/setformat.xml || exit 1
   ln -s /usr/share/clrmamepro/stats.ini "$HOME"/.clrmamepro/stats.ini || exit 1
   ln -s /usr/share/clrmamepro/unrar.dll "$HOME"/.clrmamepro/unrar.dll || exit 1
   ln -s /usr/share/clrmamepro/update.dll "$HOME"/.clrmamepro/update.dll || exit 1
   ln -s /usr/share/clrmamepro/urls.ini "$HOME"/.clrmamepro/urls.ini || exit 1
   ln -s /usr/share/clrmamepro/version.ini "$HOME"/.clrmamepro/version.ini || exit 1
fi
# 7z_32.dll added in 4.014
if [ ! -e "$HOME"/.clrmamepro/7z_32.dll ] ; then
   ln -s /usr/share/clrmamepro/7z_32.dll "$HOME"/.clrmamepro/7z_32.dll || exit 1 ;
fi

wine "$HOME"/.clrmamepro/cmpro "$@"
