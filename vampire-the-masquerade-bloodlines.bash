#!/usr/bin/env bash
set -eu

PKGNAME='gog-vampire-the-masquerade-bloodlines'
APPNAME='Vampire the Masquerade - Bloodlines'
EXE="C:/GOG Games/${APPNAME}/vampire.exe"

##
## Setup wine and launch game
##
export WINEARCH='win32'
export WINEPREFIX=$HOME/.local/share/$PKGNAME/wine
export WINEDLLOVERRIDES="mscoree,mshtml=;dbghelp=n,b" # Skip mono, gecko, and add mod loader dll hook
APPDIR_INSTALL=/opt/$PKGNAME
APPDIR_PARENT="${WINEPREFIX}/drive_c/GOG Games"
APPDIR_USER=$HOME/.local/share/$PKGNAME/user

# Symlink install dir to user dir
if ! [ -d $APPDIR_USER ]; then
  mkdir -p $APPDIR_USER
  cp -as -T $APPDIR_INSTALL $APPDIR_USER
fi

echo >&2 "Setting up wine prefix"
if ! [ -d "${WINEPREFIX}" ]; then
  (
    mkdir -pv "${WINEPREFIX}"
    wineboot -i
    rm -fv "${WINEPREFIX}/dosdevices/z:"
  )
fi

echo >&2 "Setting up wine game directory"
if ! [ -d "${APPDIR_PARENT}/${APPNAME}" ]; then
  (
    mkdir -pv "${APPDIR_PARENT}"
    ln -fnsv "${APPDIR_USER}" "${APPDIR_PARENT}/${APPNAME}"
  )
fi

echo >&2 "Launching ${APPNAME} via wine"
cd "${APPDIR_PARENT}/${APPNAME}"
wine vampire.exe -game Unofficial_Patch && xrandr -s 0
    
echo >&2 "Finished"
