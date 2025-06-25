#!/bin/sh
XDG_DATA_HOME="${XDG_DATA_HOME-${HOME}/.local/share}"
OSU_STABLE_DATA_DIRECTORY="${OSU_STABLE_DATA_DIRECTORY-${XDG_DATA_HOME}/osu-stable}"
export WINEPREFIX="${WINEPREFIX-${XDG_DATA_HOME}/wineprefixes/osu-stable}"
export WINEARCH='win32'
if [ ! -d "${WINEPREFIX}" ]; then
  echo 'Setting up the Wine prefix...'
  umu-run winetricks dotnet45 cjkfonts
  echo 'Completed setting up the Wine prefix.'
fi

if [ ! -d "${OSU_STABLE_DATA_DIRECTORY}" ]; then
  echo 'Installing osu!stable...'
  mkdir -p "${OSU_STABLE_DATA_DIRECTORY}"
  cp '/usr/share/osu/osu-stable-installer.exe' "${OSU_STABLE_DATA_DIRECTORY}"
  ls "${OSU_STABLE_DATA_DIRECTORY}"
  umu-run "${OSU_STABLE_DATA_DIRECTORY}/osu-stable-installer.exe"
  echo 'Completed installing osu!stable.'
fi

case "$1" in
'winetricks')
  shift 1
  umu-run winetricks "$@"
  ;;
'wine')
  shift 1
  umu-run "$@"
  ;;
'-h' | '--help' | 'help')
  echo 'Usage:'
  printf '%s [command]\t\t\tRun the game (with optional command)\n' "$(basename "$0")"
  printf '%s wine [command]\t\tExecute Wine command on the Wine prefix (winecfg, regedit, ...)\n' "$(basename "$0")"
  printf '%s winetricks [command]\t\tExecute Winetricks command on the Wine prefix\n' "$(basename "$0")"
  printf '%s {-h --help help}\t\tDisplay this help\n' "$(basename "$0")"
  ;;
*)
  env vblank_mode="${vblank_mode-0}" __GL_SYNC_TO_VBLANK="${__GL_SYNC_TO_VBLANK-0}" \
    umu-run "${OSU_STABLE_DATA_DIRECTORY}"'/osu!.exe' "$@"
  ;;
esac
