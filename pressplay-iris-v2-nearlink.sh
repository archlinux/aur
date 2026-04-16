#!/bin/bash
# IRIS v2 NearLink Launcher
# Bundled Electron version

export ELECTRON_IS_DEV=0
export NODE_ENV=production

# --disable-vulkan: Fixes compatibility issues with Wayland/Nvidia
# --ozone-platform-hint=auto: Properly handles Wayland vs X11
exec /opt/pressplay-iris-v2-nearlink/hhk-hub-desktop --disable-vulkan --ozone-platform-hint=auto "$@"
