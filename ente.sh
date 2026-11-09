#!/bin/sh
# Electron defaults to native Wayland when ELECTRON_OZONE_PLATFORM_HINT=wayland,
# and the Wayland backend ignores GDK_SCALE. Use the X11 backend by default,
# like ente-desktop-bin, so XWayland honours the desktop's GDK_SCALE setting.
# Override with ENTE_BIN_OZONE_PLATFORM=x11|wayland|auto.
export APPDIR=/opt/ente
case "${ENTE_BIN_OZONE_PLATFORM:-x11}" in
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
