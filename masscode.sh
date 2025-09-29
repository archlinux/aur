#!/bin/bash

# Usage:
#   ./start.sh
# Later you can replace __ROOT_DIR__ and __ELECTRON__ using sed

root_dir="__ROOT_DIR__"
electron_bin="__ELECTRON__"

# Make sure app.asar exists
if [ ! -f "$root_dir/app/app.asar" ]; then
  echo "Error: app.asar not found under $root_dir/app"
  exit 1
fi

# Tell electron-updater: this is running inside AppImage
export APPIMAGE=1

# Run
echo "Starting Electron app (root directory = $root_dir)"
ELECTRON_FORCE_IS_PACKAGED=true "$electron_bin" "$root_dir/app/app.asar" --no-sandbox "$@"
