#!/usr/bin/env bash

# One argument per line, with blank lines and comments ignored. Never eval it.
flags=()
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/perplexity-flags.conf"
if [[ -f "$flags_file" ]]; then
  while IFS= read -r flag || [[ -n "$flag" ]]; do
    [[ -z "$flag" || "$flag" == \#* ]] && continue
    flags+=("$flag")
  done < "$flags_file"
fi

# XWayland provides working Fcitx Chinese input on affected Electron/KDE
# combinations. An explicit platform in the flags file or argv takes priority.
platform_set=false
for flag in "${flags[@]}" "$@"; do
  [[ "$flag" == --ozone-platform=* || "$flag" == --ozone-platform ]] && platform_set=true
done
if [[ -n "${WAYLAND_DISPLAY:-}" && -n "${DISPLAY:-}" && "$platform_set" == false ]]; then
  flags=(--ozone-platform=x11 "${flags[@]}")
fi

exec /opt/Perplexity/perplexity "${flags[@]}" "$@"
