#!/usr/bin/env bash
set -eu

PKGNAME='embrilliance'
APPNAME_UPSTREAM='Embroidery'
EXE="C:/Program Files/BriTon Leap/${APPNAME_UPSTREAM}/Embroidery.exe"
PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/${PKGNAME}"

echo >&2 "Initializing"

export WINEARCH='win64'
export WINEPREFIX="${PKG_USER_DATA_HOME}/wine"

APPDIR_SOURCE="/opt/${PKGNAME}"
APPDIR_PARENT="${WINEPREFIX}/drive_c/Program Files/BriTon Leap"
TARGET_HOME="${WINEPREFIX}/drive_c/users/$(whoami)"

echo >&2 "Checking for Wine prefix"
if ! [ -d "${WINEPREFIX}" ]; then
  echo >&2 "==> Bootstrapping Wine prefix"
  mkdir -pv "${WINEPREFIX}"
  wineboot -i
  rm -fv "${WINEPREFIX}/dosdevices/z:"
  echo >&2 "==> Done"
fi

echo >&2 "Checking user data directory"
mkdir -pv "${PKG_USER_DATA_HOME}/Documents"
if ! [ -d "${PKG_USER_DATA_HOME}/Documents/Embrilliance" ]; then
  cp -R "/usr/share/${PKGNAME}" \
    "${PKG_USER_DATA_HOME}/Documents/Embrilliance"
fi

echo >&2 "==> Restoring symlink to user data directory"
mkdir -pv "${TARGET_HOME}"
cd "${TARGET_HOME}"
ln -fnsv "${PKG_USER_DATA_HOME}/Documents"
echo >&2 "==> Done"

echo >&2 "Checking app directory"
if ! [ -d "${APPDIR_PARENT}/${APPNAME_UPSTREAM}" ]; then
  echo >&2 "==> Creating symlink to app directory"
  mkdir -pv "${APPDIR_PARENT}"
  ln -fnsv "${APPDIR_SOURCE}" "${APPDIR_PARENT}/${APPNAME_UPSTREAM}"
  echo >&2 "==> Done"
fi

echo >&2 "Launching app with Wine"
wine "${EXE}"
echo >&2 "==> Finished"
