#!/bin/bash
#
# NAME
#     bzr-player.sh - BZR Player 2.x (BZR2) launcher
#
# SYNOPSIS
#     ./bzr-player.sh [target(s)]
#
# EXAMPLES
#     ./bzr-player.sh
#         run BZR2
#
#     ./bzr-player.sh file1 file2 dir1 dir2
#         run BZR2 with selected files and/or directories as arguments
#
# AUTHOR
#     Ciro Scognamiglio

set -e

bzr2="bzr-player"
bzr2_path_sys="/usr/share/$bzr2"
bzr2_path_home="$HOME/.$bzr2"

export WINEPREFIX="$bzr2_path_home/wine"
export WINEDLLOVERRIDES="mscoree=" # disable mono

if [ ! -d "$WINEPREFIX" ]; then
  mkdir -p "$WINEPREFIX"

  # disable wine crash dialog (winetricks nocrashdialog)
  WINEDEBUG=-all wine reg add "HKEY_CURRENT_USER\Software\Wine\WineDbg" /v ShowCrashDialog /t REG_DWORD /d 0 /f

  # disable wine debugger (winetricks autostart_winedbg=disabled)
  WINEDEBUG=-all wine reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AeDebug" /v Debugger /t REG_SZ /d "false" /f

  # --- app data setup ---
  ln -s "$bzr2_path_sys/BZRPlayer.exe" "$bzr2_path_home/$bzr2"

  readarray -d '' dlls < <(find "$bzr2_path_sys" -maxdepth 1 -type f -iname '*.dll' -print0)

  for dll in "${dlls[@]}"; do
    ln -s "$dll" "$bzr2_path_home"
  done

  readarray -d '' dirs < <(find "$bzr2_path_sys" -mindepth 1 -maxdepth 1 -type d -print0)

  for dir in "${dirs[@]}"; do
    ln -s "$dir" "$bzr2_path_home"
  done
  # END --- app data setup ---
fi

wine "$bzr2_path_home/$bzr2" "$@" &
