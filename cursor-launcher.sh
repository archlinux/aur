#!/bin/bash

set -euo pipefail

cursor_bin="/usr/share/cursor/bin/cursor"
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/cursor-flags.conf"

cursor_flags=()
if [[ -f "$flags_file" ]]; then
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line%$'\r'}"
    line="${line#"${line%%[![:space:]]*}"}"
    line="${line%"${line##*[![:space:]]}"}"
    [[ -z "$line" ]] && continue
    [[ "$line" == \#* ]] && continue
    cursor_flags+=("$line")
  done < "$flags_file"
fi

case "${1:-}" in
  agent)
    exec "$cursor_bin" "$@"
    ;;
  editor)
    shift
    ;;
esac

exec "$cursor_bin" "${cursor_flags[@]}" "$@"
