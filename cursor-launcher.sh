#!/bin/bash
# Launcher for Cursor IDE — uses its bundled Electron, not system electron.

# Support user-defined flags via ~/.config/cursor-flags.conf
CURSOR_USER_FLAGS=()
if [[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/cursor-flags.conf" ]]; then
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ "$line" =~ ^[[:space:]]*# ]] && continue
    [[ -z "${line// }" ]] && continue
    CURSOR_USER_FLAGS+=("$line")
  done < "${XDG_CONFIG_HOME:-$HOME/.config}/cursor-flags.conf"
fi

# Wayland: auto-detect
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
  WAYLAND_FLAGS=(
    --ozone-platform-hint=auto
    --enable-features=WaylandWindowDecorations
  )
else
  WAYLAND_FLAGS=()
fi

exec /usr/share/cursor/cursor \
  "${WAYLAND_FLAGS[@]}" \
  "${CURSOR_USER_FLAGS[@]}" \
  "$@"
