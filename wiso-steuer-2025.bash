#!/usr/bin/env bash
set -eu

APP_BASENAME='WISO2025'
EXE="C:/Program Files/WISO/Steuersoftware 2025/${APP_BASENAME}.exe"
PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/wiso"

# https://gitlab.winehq.org/wine/wine/-/wikis/Wine-User's-Guide#winedlloverrides-dll-overrides
__WISO_WINEDLLOVERRIDES=(
  'd2d1=n,b'  # Prefer native d2d1.dll over the one built into Wine
)

echo >&2 'Initializing'

export WINEARCH='win64'
export WINEPREFIX="${PKG_USER_DATA_HOME}/wine"
export WINETRICKS_DOWNLOADER_TIMEOUT="${WINETRICKS_DOWNLOADER_TIMEOUT:-300}"

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
  '/usr/lib/wiso-steuer-2025/app' \
  "${WINEPREFIX}/drive_c/Program Files/WISO/Steuersoftware 2025"

echo >&2 "Configuring DLL overrides"
# Honor `WISO_WINEDLLOVERRIDES` if it is already set, even if empty
if [[ -z "${WISO_WINEDLLOVERRIDES+x}" ]]; then
  WISO_WINEDLLOVERRIDES=
  for directive in "${__WISO_WINEDLLOVERRIDES[@]}"; do
    WISO_WINEDLLOVERRIDES="${WISO_WINEDLLOVERRIDES:+${WISO_WINEDLLOVERRIDES} }"
    WISO_WINEDLLOVERRIDES="${WISO_WINEDLLOVERRIDES}${directive}"
  done
fi

echo >&2 "Launching app with Wine"
WINEDLLOVERRIDES="${WISO_WINEDLLOVERRIDES}" \
  wine "${EXE}"
echo >&2 "==> Finished"
