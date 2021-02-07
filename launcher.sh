#!/usr/bin/env bash
#export XDG_DATA_HOME="$HOME"/.micro-cap/wine/local
#if [ ! -d "$HOME"/.micro-cap/wine/local ] ; then
#   mkdir -p "$HOME"/.micro-cap/wine
#   cp -a /usr/share/micro-cap/local "$HOME"/.micro-cap/wine
#fi
export WINEPREFIX="$HOME"/.micro-cap/wine/env
export WINEARCH=win64
if [ ! -d "$HOME"/.micro-cap/wine/env ] ; then
   mkdir -p "$HOME"/.micro-cap/wine/env
   wineboot -u
   sleep 3
   winetricks winxp
   sleep 3
   wineboot -e
   sleep 3
   mkdir -p "${WINEPREFIX}/drive_c/installer"
   pushd "${WINEPREFIX}/drive_c/installer"
   bsdtar -xvf /usr/share/micro-cap/micro-cap-12.zip
   cp /usr/share/micro-cap/setup.iss .
   popd
   wine "C:\windows\command\start.exe" "C:\installer\setup.exe" /SMS /s /f1"C:\installer\setup.iss"
   sleep 3
   wineboot -e
   sleep 3
   rm -rf "${WINEPREFIX}/c_drive/installer"
fi
wine "C:\windows\command\start.exe" "C:\MC12\mc12_64.exe" "$@"
