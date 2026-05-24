#!/bin/sh

export IGNORE_UPDATES=yes
export ELECTRON_TRASH=gio
export ELECTRON_OZONE_PLATFORM_HINT=auto

_log="${XDG_CONFIG_HOME:-$HOME/.config}/Vortex/vortex-linux-fix.log"
mkdir -p "$(dirname "$_log")"
: > "$_log"

# Auto-register nxm:// handler for this user if not already set
if command -v xdg-mime >/dev/null 2>&1; then
    _cur="$(xdg-mime query default x-scheme-handler/nxm 2>/dev/null)"
    if [ "$_cur" != "vortex.desktop" ]; then
        xdg-mime default vortex.desktop x-scheme-handler/nxm 2>/dev/null || true
    fi
fi

for _p in /opt/Vortex/patch-ext-*.py; do
    [ -f "$_p" ] && python3 "$_p" >> "$_log" 2>&1
done

case "${1-}" in
  nxm:*) exec /opt/Vortex/vortex --download "$@" ;;
  *)     exec /opt/Vortex/vortex "$@" ;;
esac
