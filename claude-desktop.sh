#!/bin/bash
# Launcher for Claude Desktop.
#
# Electron does not pick a display backend on its own: without an Ozone
# switch it runs under X11, which on a Wayland compositor means XWayland
# and a blurry window on any scaled display. When a Wayland session is
# detected, request the Wayland backend explicitly. A platform switch
# given by the user (on the command line or in the flags file) wins.
#
# Extra flags can be placed in $XDG_CONFIG_HOME/claude-desktop-flags.conf
# (default ~/.config/claude-desktop-flags.conf), one or more per line,
# with '#' starting a comment.
set -euo pipefail

flags=()
conf="${XDG_CONFIG_HOME:-${HOME:-}/.config}/claude-desktop-flags.conf"
if [[ -r $conf ]]; then
  while IFS= read -r line || [[ -n $line ]]; do
    line="${line%%#*}"
    [[ -n ${line//[[:space:]]/} ]] || continue
    read -r -a words <<<"$line"
    flags+=("${words[@]}")
  done <"$conf"
fi

platform=()
if [[ -n ${WAYLAND_DISPLAY:-} || ${XDG_SESSION_TYPE:-} == wayland ]]; then
  platform=(--ozone-platform=wayland)
  for f in "${flags[@]}" "$@"; do
    case $f in
      --ozone-platform=* | --ozone-platform-hint=*) platform=() ;;
    esac
  done
fi

exec /usr/lib/claude-desktop/claude-desktop "${platform[@]}" "${flags[@]}" "$@"
