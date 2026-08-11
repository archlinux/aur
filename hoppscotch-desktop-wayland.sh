#!/bin/sh
# Hoppscotch Desktop - Wayland-first launcher.
#
# Hoppscotch Desktop is a Tauri app, so the toolkit is GTK3 + WebKitGTK, not
# Electron/Chromium: the display backend is selected through GDK_BACKEND and
# there are no --ozone-platform style command line flags to pass.
#
# Nothing below is forced - every variable keeps a value already present in the
# environment, so `GDK_BACKEND=x11 hoppscotch-desktop` still works.

if [ -n "${WAYLAND_DISPLAY}" ]; then
    # Talk to the compositor directly instead of going through XWayland.
    # The x11 entry is a fallback: GDK walks the list in order, so a broken
    # Wayland connection still lands on X11 instead of failing to start.
    GDK_BACKEND="${GDK_BACKEND:-wayland,x11}"
    export GDK_BACKEND

    # WebKitGTK composites through DMABUF by default. That path is broken on
    # the NVIDIA proprietary driver and shows up as a blank window, so disable
    # it there only - everyone else keeps GPU compositing. Set
    # WEBKIT_DISABLE_DMABUF_RENDERER=0 to opt back in.
    if [ -z "${WEBKIT_DISABLE_DMABUF_RENDERER}" ] && [ -d /sys/module/nvidia ]; then
        WEBKIT_DISABLE_DMABUF_RENDERER=1
        export WEBKIT_DISABLE_DMABUF_RENDERER
    fi
fi

# Absolute path on purpose: the basename becomes the Wayland app_id, which is
# what Plasma/GNOME match against hoppscotch-desktop.desktop for the icon.
exec /usr/lib/hoppscotch/hoppscotch-desktop "$@"
