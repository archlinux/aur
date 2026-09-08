#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/bin/@runname@"
gsettings get org.gnome.desktop.interface gtk-theme 2> /dev/null | grep -qi "dark" && GTK_THEME_VARIANT="dark" || GTK_THEME_VARIANT="light"
APPIMAGE_GTK_THEME="${APPIMAGE_GTK_THEME:-"Adwaita:$GTK_THEME_VARIANT"}" # Allow user to override theme (discouraged)
export APPDIR="${_APPDIR}"
export GTK_DATA_PREFIX="${_APPDIR}"
export GTK_THEME="${APPIMAGE_GTK_THEME}" # Custom themes are broken
export GDK_BACKEND=x11 # Crash with Wayland backend on Wayland - We tested it without it and ended up with this: https://github.com/tauri-apps/tauri/issues/8541
export XDG_DATA_DIRS="${_APPDIR}/share:/usr/share:${XDG_DATA_DIRS}" # g_get_system_data_dirs() from GLib
export GSETTINGS_SCHEMA_DIR="${_APPDIR}/glib-2.0/schemas"
export GTK_EXE_PREFIX="${_APPDIR}"
export GTK_PATH="${_APPDIR}/lib/x86_64-linux-gnu/gtk-3.0:/usr/lib64/gtk-3.0"
export GTK_IM_MODULE_FILE="${_APPDIR}/lib/x86_64-linux-gnu/gtk-3.0/3.0.0/immodules.cache"
export GDK_PIXBUF_MODULE_FILE="${_APPDIR}/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache"
export GIO_EXTRA_MODULES="${_APPDIR}/lib/x86_64-linux-gnu/gio/modules"
export GST_REGISTRY_1_0="${XDG_CACHE_HOME:-${HOME:-/tmp}/.cache}/OmniVoice/gstreamer-registry.bin"
export LD_LIBRARY_PATH="/usr/lib"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@"