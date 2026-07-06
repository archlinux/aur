#!/bin/sh

sync_assets() {
  mkdir -p "$HOME/.local/share/onetalker"
  cp -r /usr/share/onetalker/assets "$HOME/.local/share/onetalker"
}

if [ ! -d "$HOME/.local/share/onetalker/assets" ]; then
  sync_assets
fi

if [ "$1" = "--sync-assets" ]; then
  sync_assets
  exit
fi

exec /usr/lib/onetalker/onetalker "$@"
