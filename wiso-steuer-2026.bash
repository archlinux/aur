#!/usr/bin/env bash

# SPDX-FileCopyrightText: Claudia Pellegrino
# SPDX-License-Identifier: 0BSD

set -eu

APP_BASENAME='WISO2026'
EXE="C:/Program Files/WISO/Steuersoftware 2026/${APP_BASENAME}.exe"
PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/wiso"

echo >&2 'Initializing'

export WINEARCH='win64'
export WINEPREFIX="${PKG_USER_DATA_HOME}/wine"
export WINETRICKS_DOWNLOADER_TIMEOUT="${WINETRICKS_DOWNLOADER_TIMEOUT:-300}"
# Honor app-specific overrides
export WINEDLLOVERRIDES="${WISO_WINEDLLOVERRIDES:-}"

echo >&2 'Checking for Wine prefix'
if ! [ -d "${WINEPREFIX}" ]; then
  echo >&2 '==> Bootstrapping Wine prefix'
  mkdir -pv "${WINEPREFIX}"
  wineboot -i
  while [ ! -e "${WINEPREFIX}/system.reg" ]; do
    echo >&2 '==> Waiting for registry to be flushed'
    sleep 1
  done | zenity --progress --auto-close --auto-kill --pulsate \
    --title 'Waiting for Wine prefix'
  echo >&2 '==> Done'
fi

# Filters the log output of a headless winetricks invocation and
# transforms it into the protocol that `zenity --progress` uses.
# Argument: expected_num_lines
winetricks_progress_for_num_lines() {
  local expected_num_lines
  expected_num_lines="${1?}"

  #shellcheck disable=SC2016
  sed -nu -e 's/^Executing load_\(.*\)/\1/p' \
    | stdbuf -oL awk -v expected_num_lines="${expected_num_lines}" \
      -e '{ print int(100 * NR / expected_num_lines); print "# Installing",$0 }'
}

echo >&2 'Checking if corefonts are installed'
if ! [ -f "${WINEPREFIX}/drive_c/windows/Fonts/corefonts.installed" ]; then
  echo >&2 '==> Installing corefonts via Winetricks'
  winetricks -f -q --optout corefonts 2>&1 \
    | winetricks_progress_for_num_lines 12 \
    | zenity 2>/dev/null --progress --auto-close --auto-kill \
      --title='Installing corefonts' --text='Launching winetricks'
  echo >&2 '==> Done'
fi

echo >&2 'Creating symlinks'
mkdir -p \
  "${WINEPREFIX}/../programdata" \
  "${WINEPREFIX}/drive_c/ProgramData" \
  "${WINEPREFIX}/drive_c/Program Files/WISO"
ln -fns \
  '../../../programdata' \
  "${WINEPREFIX}/drive_c/ProgramData/Buhl Data Service GmbH"
ln -fns \
  '/usr/lib/wiso-steuer-2026/app' \
  "${WINEPREFIX}/drive_c/Program Files/WISO/Steuersoftware 2026"

echo >&2 "Launching app with Wine"
wine "${EXE}"
echo >&2 "==> Finished"
