#!/usr/bin/env bash
set -eu

PKGNAME='inscryption'
APPNAME_UPSTREAM='Inscryption'
EXE="C:/Program Files/GOG Games/${APPNAME_UPSTREAM}/Inscryption.exe"
PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/${PKGNAME}"

echo >&2 "Initializing"

export WINEARCH='win64'
export WINEPREFIX="${PKG_USER_DATA_HOME}/wine"

APPDIR_SOURCE="/opt/${PKGNAME}"
APPDIR_PARENT="${WINEPREFIX}/drive_c/Program Files/GOG Games"
TARGET_HOME="${WINEPREFIX}/drive_c/users/$(whoami)"

USER_APPDATADIR_SOURCE="${PKG_USER_DATA_HOME}/userappdata"
USER_APPDATADIR_TARGET="${TARGET_HOME}/AppData/LocalLow/Daniel Mullins Games"

echo >&2 "Checking for Wine prefix"
if ! [ -d "${WINEPREFIX}" ]; then
  echo >&2 "==> Bootstrapping Wine prefix: ${WINEPREFIX}"
  mkdir >&2 -pv "${WINEPREFIX}"
  wineboot -i 2>&1
  rm >&2 -fv "${WINEPREFIX}/dosdevices/z:"
  echo >&2 "==> Done"
fi

echo >&2 "Checking user data directory"
if ! [ -h "${USER_APPDATADIR_TARGET}/${APPNAME_UPSTREAM}" ]; then
  echo >&2 "==> Creating ${USER_APPDATADIR_TARGET}"
  mkdir >&2 -pv "${USER_APPDATADIR_TARGET}"
  cd "${USER_APPDATADIR_TARGET}"
  echo >&2 "==> Linking from ${USER_APPDATADIR_SOURCE}/${APPNAME_UPSTREAM}"
  mkdir >&2 -pv "${USER_APPDATADIR_SOURCE}/${APPNAME_UPSTREAM}"
  ln >&2 -fnsv "${USER_APPDATADIR_SOURCE}/${APPNAME_UPSTREAM}"
fi

echo >&2 "Checking app directory"
if ! [ -d "${APPDIR_PARENT}/${APPNAME_UPSTREAM}" ]; then
  echo >&2 "==> Creating ${APPDIR_PARENT}"
  mkdir >&2 -pv "${APPDIR_PARENT}"
  echo >&2 "==> Linking from ${APPDIR_SOURCE}"
  ln >&2 -fnsv "${APPDIR_SOURCE}" "${APPDIR_PARENT}/${APPNAME_UPSTREAM}"
  echo >&2 "==> Done"
fi

echo >&2 "Launching app with Wine"
wine 2>&1 "${EXE}"
echo >&2 "==> Finished"
