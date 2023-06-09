#!/usr/bin/env bash
set -eu

PKGNAME='aio-creator-neo'
APP_BASENAME='aio_creator_neo'
EXE="C:/Program Files/mediola/AIO CREATOR NEO/${APP_BASENAME}/${APP_BASENAME}.exe"
PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/${PKGNAME}"

echo >&2 "Initializing"

export WINEARCH='win32'
export WINEPREFIX="${PKG_USER_DATA_HOME}/wine"

APPDIR_SOURCE="/opt/${PKGNAME}/app/${APP_BASENAME}"
APPDIR_TARGET_PARENT="${WINEPREFIX}/drive_c/Program Files/mediola/AIO CREATOR NEO"

DATADIR_SOURCE="/opt/${PKGNAME}/commonappdata/AIO CREATOR NEO"
DATADIR_TARGET_PARENT="${WINEPREFIX}/drive_c/ProgramData"

echo >&2 "Checking for Wine prefix"
if ! [ -d "${WINEPREFIX}" ]; then
  echo >&2 "==> Bootstrapping Wine prefix"
  mkdir -pv "${WINEPREFIX}"
  wineboot -i
  while [ ! -e "${WINEPREFIX}/system.reg" ]; do
    echo >&2 "==> Waiting for registry to be flushed"
    sleep 1
  done
  echo >&2 "==> Done"
fi

# Under a prior version of Wine, we used to force-install a
# Direct3D 9 override to make the app work.
# At least since Wine 8.9, that override has not only become
# obsolete, it’s also breaking the app now.
# Therefore, we need to uninstall the override for this app.
echo >&2 "Checking Direct3D 9 override"
if [ -e "${WINEPREFIX}/drive_c/windows/system32/d3d9.dll.old" ]; then
  echo >&2 "==> Found, removing Direct3D override"
  setup_dxvk uninstall
  echo >&2 "==> Waiting for registry to be flushed"
  sleep 3
  echo >&2 "==> Done"
else
  echo >&2 "==> Not found"
fi

echo >&2 "Checking program data directory"
if [ -d "${DATADIR_TARGET_PARENT}/AIO CREATOR NEO" ]; then
  echo >&2 "==> Found"
else
  echo >&2 "==> Not found, installing program data"
  cp -R "${DATADIR_SOURCE}" \
    "${DATADIR_TARGET_PARENT}/AIO CREATOR NEO"
  echo >&2 "==> Done"
fi

echo >&2 "Checking app directory"
if [ -d "${APPDIR_TARGET_PARENT}/${APP_BASENAME}" ]; then
  echo >&2 "==> Found"
else
  echo >&2 "==> Not found, creating symlink to app directory"
  mkdir -pv "${APPDIR_TARGET_PARENT}"
  ln -fnsv "${APPDIR_SOURCE}" "${APPDIR_TARGET_PARENT}/${APP_BASENAME}"
  echo >&2 "==> Done"
fi

echo >&2 "Launching app with Wine"
wine "${EXE}"
echo >&2 "==> Finished"
