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

function reg_query {
  local key
  local value_name

  key="${1?}"
  value_name="${2?}"

  wine REG QUERY "${key}" /v "${value_name}" 2>/dev/null \
    | awk -v "value_name=${value_name}" -e '$1 == value_name { print $3 }' \
    | tr -d $'\r'
}

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

echo >&2 "Checking Direct3D 9 override"
reg_query_result="$(
  reg_query 'HKCU\Software\Wine\DllOverrides' 'd3d9'
)" || true

if [[ "${reg_query_result}" == 'native' ]]; then
  echo >&2 "==> Found"
else
  echo >&2 "==> Not found, installing Direct3D override"
  setup_dxvk install --without-dxgi
  while [ "$(
      reg_query 'HKCU\Software\Wine\DllOverrides' 'd3d9'
    )" != 'native' ]
  do
    echo >&2 "==> Waiting for registry to be flushed"
    sleep 1
  done
  echo >&2 "==> Done"
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
