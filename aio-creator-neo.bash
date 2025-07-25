#!/usr/bin/env bash
set -eu -o pipefail

PKGNAME='aio-creator-neo'
APP_BASENAME='aio_creator_neo'
EXE="C:/Program Files/mediola/AIO CREATOR NEO/${APP_BASENAME}/${APP_BASENAME}.exe"
PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/${PKGNAME}"

echo >&2 "Initializing"

export WINEARCH='win64'
export WINEPREFIX="${PKG_USER_DATA_HOME}/wine"
export WINETRICKS_DOWNLOADER_TIMEOUT="${WINETRICKS_DOWNLOADER_TIMEOUT:-300}"
# Honor app-specific overrides
export WINEDLLOVERRIDES="${AIO_CREATOR_WINEDLLOVERRIDES:-}"

APPDIR_SOURCE="/opt/${PKGNAME}/app/${APP_BASENAME}"
APPDIR_TARGET_PARENT="${WINEPREFIX}/drive_c/Program Files/mediola/AIO CREATOR NEO"

DATADIR_SOURCE="/opt/${PKGNAME}/commonappdata/AIO CREATOR NEO"
DATADIR_TARGET_PARENT="${WINEPREFIX}/drive_c/ProgramData"

echo >&2 "Checking for Wine prefix"
if [ -d "${WINEPREFIX}" ]; then
  echo >&2 "==> Checking if Wine prefix is compatible with WoW64"
  if wineboot_stderr="$(WINEDEBUG=-all wineboot 2>&1 >/dev/null)"; then
    echo >&2 "==> Ok"
  else
    if [[ "${wineboot_stderr}" == *'cannot support 64-bit applications'* ]]; then
      # Due to the WoW64 feature enabled by default in the Arch Linux
      # build of Wine, this app's WINEARCH had to be changed to win64.
      # That means that the old win32 prefix is not going to work.
      # Tell the user to back up, scrap, and rebuild their prefix.
      msg_text="You need to back up and delete your ${WINEPREFIX} directory, then relaunch ${0}."
    fi

    zenity --no-markup --warning \
      --title "Problem with aio-creator-neo's Wine prefix" \
      --text "${msg_text:-}${msg_text:+$'\n\n'Full error message from Wine:$'\n\n'"${wineboot_stderr}"}"
    exit 1
  fi
else
  echo >&2 "==> Bootstrapping Wine prefix"
  mkdir -pv "${WINEPREFIX}"
  wineboot -i
  while [ ! -e "${WINEPREFIX}/system.reg" ]; do
    echo >&2 '==> Waiting for registry to be flushed'
    sleep 1
  done | zenity --progress --auto-close --auto-kill --pulsate \
    --title 'Waiting for Wine prefix'
  echo >&2 "==> Done"
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
