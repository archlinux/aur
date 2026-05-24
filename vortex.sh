#!/bin/sh

export IGNORE_UPDATES=yes
export ELECTRON_TRASH=gio
export ELECTRON_OZONE_PLATFORM_HINT=auto

for _p in /opt/Vortex/patch-ext-*.py; do
    [ -f "$_p" ] && python3 "$_p" 2>/dev/null
done

case "${1-}" in
  nxm:*) exec /opt/Vortex/vortex --download "$@" ;;
  *)     exec /opt/Vortex/vortex "$@" ;;
esac
