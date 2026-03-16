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

exec /usr/share/cursor/cursor \
  "${CURSOR_USER_FLAGS[@]}" \
  "$@"
