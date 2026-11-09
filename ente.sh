#!/bin/sh
# Run with the backend Electron picks by default. On a Wayland session with
# ELECTRON_OZONE_PLATFORM_HINT=wayland this renders natively at the compositor
# scale. Override with ENTE_BIN_OZONE_PLATFORM=x11|wayland if needed.
export APPDIR=/opt/ente
case "${ENTE_BIN_OZONE_PLATFORM:-auto}" in
    x11)
        set -- --ozone-platform=x11 "$@"
        ;;
    wayland)
        set -- --ozone-platform=wayland "$@"
        ;;
    auto)
        ;;
    *)
        printf '%s\n' "ente: invalid ENTE_BIN_OZONE_PLATFORM (use x11, wayland or auto)" >&2
        exit 1
        ;;
esac
exec /opt/ente/AppRun "$@"
