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
mkdir -pv "${APPDIR_PARENT}"
ln -fnsv "${APPDIR_USER}" "${APPDIR_PARENT}/${APPNAME}"


#
# Graphics options (NVIDIA GLX)
#

# Force AF (0=Off, 1=2x, 2=4x, 3=8x, 4=16x)
#export __GL_LOG_MAX_ANISO=4

# Force multisampling and supersampling
# Run "nvidia-settings --query=fsaa --verbose" to get valid modes
#export __GL_FSAA_MODE=11  # 4xSS, 4xMS with GTX 970
#export __GL_FSAAAppControlled=0
#export __GL_FSAAAppEnhanced=0

# Disable VSync
#export __GL_SYNC_TO_VBLANK=0  
 
#
# Graphics options (Radeon)
#
 
# Force AF       
#export R600_TEX_ANISO = 16
 
# 
# Launch game with unofficial patch enabled
#
echo >&2 "Launching ${APPNAME} via wine"
cd "${APPDIR_PARENT}/${APPNAME}"

wine vampire.exe -game Unofficial_Patch && xrandr -s 0

echo >&2 "Finished"
