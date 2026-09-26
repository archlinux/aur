#!/bin/bash
# Launcher for the Herta payload installed by @appname@. The Chromium runtime
# comes from Arch's electron@electronversion@ package, not from a bundled copy.
_APPDIR="@appdir@"
_RUNNAME="${_APPDIR}/resources/app.asar"

# Keep the window grouped with its desktop entry, and let the file manager's
# trash follow the running desktop.
export CHROME_DESKTOP="@appname@.desktop"
case "${XDG_CURRENT_DESKTOP}" in
    *KDE*)   export ELECTRON_TRASH="kioclient5" ;;
    *GNOME*) export ELECTRON_TRASH="gio" ;;
    *XFCE*)  export ELECTRON_TRASH="gvfs-trash" ;;
esac

cd "${_APPDIR}"
exec electron@electronversion@ "${_RUNNAME}" "$@"
