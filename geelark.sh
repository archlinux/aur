#!/bin/sh
# One flag or more per line in the flags file; lines starting with # are ignored
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/geelark-flags.conf"
user_flags=
if [ -r "$flags_file" ]; then
  user_flags=$(grep -v '^[[:space:]]*#' "$flags_file")
fi

# Under native Wayland the app runs but never maps a window, so force XWayland
set -f
exec /opt/GeeLark/geelark --ozone-platform=x11 $user_flags "$@"
