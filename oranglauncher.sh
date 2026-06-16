#!/bin/sh
# OrangLauncher launch wrapper.
# Tk is X11-only, so force the GTK/WebKit news view onto X11 (XWayland) too —
# this is what makes the embedded webview work on XFCE, GNOME and Hyprland alike.
export GDK_BACKEND=x11
# let the bundled (standalone) build still find the system GObject typelibs
# (WebKit2-4.1.typelib, Gtk-3.0.typelib, GdkX11-3.0.typelib)
export GI_TYPELIB_PATH="/usr/lib/girepository-1.0${GI_TYPELIB_PATH:+:$GI_TYPELIB_PATH}"
exec /usr/lib/oranglauncher/launcher.bin "$@"
