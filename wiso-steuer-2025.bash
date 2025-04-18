#!/usr/bin/env bash
set -eu

EXE="C:/Program Files/WISO/Steuersoftware 2025/WISO2025.exe"
PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/wiso"

echo >&2 'Initializing'

export WINEARCH='win64'
export WINEPREFIX="${PKG_USER_DATA_HOME}/wine"

function reg_query {
  local key
  local value_name

  key="${1?}"
  value_name="${2?}"

  wine REG QUERY "${key}" /v "${value_name}" 2>/dev/null \
    | awk -v "value_name=${value_name}" -e '$1 == value_name { print $3 }' \
    | tr -d $'\r'
}

echo >&2 'Checking for Wine prefix'
if ! [ -d "${WINEPREFIX}" ]; then
  echo >&2 "[ERROR] Prefix ${WINEPREFIX} not found." \
    'Run the installer first.'
  exit 1
fi

echo >&2 "Checking Direct2D override"
reg_query_result="$(
  reg_query 'HKCU\Software\Wine\DllOverrides' 'd2d1'
)" || true

if [[ "${reg_query_result}" == 'native' ]]; then
  echo >&2 '==> Found'
else
  echo >&2 '==> Not found'
  echo >&2 '[WARNING]' \
    'Continuing with Wine'\''s own Direct2D implementation.' \
    'Submitting documents to ELSTER may not work.'
fi

echo >&2 "Launching app with Wine"
wine "${EXE}"
echo >&2 "==> Finished"
