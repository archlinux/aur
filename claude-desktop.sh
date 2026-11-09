#!/bin/sh
# Claude Desktop launcher for Arch / Artix / Aegix Linux.
#
# Extra Chromium/Electron flags go one per line in
#   ${XDG_CONFIG_HOME:-~/.config}/claude-desktop-flags.conf
# (lines starting with # are ignored). If that file exists, it fully decides
# the flags. If it does not exist and the NVIDIA proprietary driver is in use
# on X11, flags known to fix "eglInitialize ... Could not create a backing
# OpenGL context" are applied automatically.
conf="${XDG_CONFIG_HOME:-$HOME/.config}/claude-desktop-flags.conf"
flags=""
if [ -r "$conf" ]; then
  flags=$(grep -v '^[[:space:]]*#' "$conf" | tr '\n' ' ')
elif [ -e /proc/driver/nvidia/version ] && [ "${XDG_SESSION_TYPE:-x11}" != "wayland" ] && [ -z "$WAYLAND_DISPLAY" ]; then
  flags="--ozone-platform=x11 --use-angle=gl-egl"
fi
# shellcheck disable=SC2086
exec /usr/lib/claude-desktop/claude-desktop $flags "$@"
