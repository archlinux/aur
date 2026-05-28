#!/bin/sh
# Paseo wraps Electron with a Commander.js CLI that rejects Chromium flags,
# so we configure Ozone via the Electron-level env var instead (Electron 28+).
# Override by exporting ELECTRON_OZONE_PLATFORM_HINT before invocation.
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"
exec /opt/Paseo/Paseo "$@"
