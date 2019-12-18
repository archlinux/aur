#! /bin/bash

if [ ! -d "$HOME/.local/wine/swamp" ] ; then
  if [ ! -z "$DISPLAY" ] ;then
    echo "Installing a new wineprefix for swamp. This may take a while."
  else
    echo "You don't seem to have an X server running, or your DISPLAY variable is not exported. Please fix this before continuing since it is needed for the installation."
    exit 1
  fi
  mkdir -p "$HOME/.local/wine/swamp"
  DISPLAY="" WINEPREFIX="$HOME/.local/wine/swamp" WINEARCH=win32 wineboot -u # Clearing the display temporarily is required to work around wine complaining about mono which we install later
  WINEPREFIX="$HOME/.local/wine/swamp" wine msiexec /i z:/usr/share/wine/mono/$(ls -1 /usr/share/wine/mono/) /silent
  WINEPREFIX="$HOME/.local/wine/swamp" wine msiexec /i z:$(ls -1 /usr/share/wine/gecko/*x86.msi) /silent
  WINEPREFIX="$HOME/.local/wine/swamp" winetricks -q vb6run dx8vb quartz speechsdk corefonts winxp
  cp -R /opt/swamp "$HOME/.local/wine/swamp/drive_c/users/$USER/Downloads"
  WINEPREFIX="$HOME/.local/wine/swamp" wine cmd.exe /c 'cd /d c:\users\'$USER'\Downloads\swamp && Windows32bit.bat'
  echo "Installation of the wineprefix has been completed. The game will now launch."
fi
WINEPREFIX="$HOME/.local/wine/swamp" wine 'c:\users\'$USER'\Downloads\swamp\Swamp.exe'
exit $?
