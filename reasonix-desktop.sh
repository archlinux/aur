#!/bin/sh
# Reasonix Desktop - Electron-based UI for DeepSeek-Reasonix
# Configure Ozone/Wayland support via Electron-level env var (Electron 28+).
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"
exec /opt/Reasonix/reasonix "$@"
