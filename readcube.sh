#!/bin/bash
# Launcher for Papers by ReadCube under Wine.
#
# The licence does not permit repackaging, so the application is not shipped
# unpacked. Instead the upstream installer runs unmodified inside a per-user
# Wine prefix the first time this script is invoked. A Wine prefix is per-user
# state that root cannot create during pacman's post_install, so first run is
# where that work has to happen.
set -euo pipefail

DATADIR=/usr/share/readcube
INSTALLER="$DATADIR/readcube-installer.exe"

export WINEPREFIX="${READCUBE_WINEPREFIX:-${XDG_DATA_HOME:-$HOME/.local/share}/readcube/wineprefix}"
export WINEARCH=win64
export WINEDEBUG="${WINEDEBUG:--all}"

# Bump when the provisioning below changes, so existing prefixes redo it.
SETUP_VERSION=1
STAMP="$WINEPREFIX/.readcube-setup"

find_app() {
    find "$WINEPREFIX/drive_c/users" -maxdepth 6 -type f -name 'Papers.exe' \
         -path '*/Programs/Papers/*' 2>/dev/null | head -n1
}

app=$(find_app || true)
setup_done=""
[ -r "$STAMP" ] && setup_done=$(cat "$STAMP")

if [ "$setup_done" != "$SETUP_VERSION" ] || [ -z "$app" ]; then
    printf 'readcube: first run - creating Wine prefix and running the Papers installer.\n' >&2
    printf 'readcube: this takes a few minutes and needs roughly 1.5 GB.\n' >&2
    mkdir -p "$WINEPREFIX"

    # Electron needs neither Gecko nor Mono; suppress Wine's download dialogs.
    WINEDLLOVERRIDES="mscoree,mshtml=" wineboot --init >/dev/null 2>&1 || true
    wineserver -w

    # Chromium renders its UI with DirectWrite and asks for Segoe UI, which no
    # Wine prefix has. Wine's DirectWrite returns no font face instead of
    # falling back, so without these replacements the application draws every
    # button, panel and image correctly but no text at all.
    wine regedit "$DATADIR/fonts.reg" >/dev/null 2>&1 || true
    wineserver -w

    # powershell.exe is disabled for the installer run only. electron-builder's
    # NSIS probes for an already-running instance via PowerShell; Wine's
    # powershell is a stub that exits 0 whatever it is asked, so the installer
    # concludes the app is permanently running, loops kill->recheck, and gives
    # up having installed nothing. Disabling it makes the probe return an
    # error, which the installer correctly reads as "not running".
    WINEDLLOVERRIDES="mscoree,mshtml=;powershell.exe=" \
        wine "$INSTALLER" /S >/dev/null 2>&1 || true
    wineserver -w

    app=$(find_app || true)
    if [ -z "$app" ]; then
        printf 'readcube: the installer did not produce Papers.exe in %s\n' "$WINEPREFIX" >&2
        printf 'readcube: re-run with WINEDEBUG= to see Wine output.\n' >&2
        exit 1
    fi

    printf '%s\n' "$SETUP_VERSION" > "$STAMP"
    printf 'readcube: setup complete.\n' >&2
fi

# --no-sandbox is required: Chromium's sandbox does not work under Wine.
cd "$(dirname "$app")"
exec wine "$app" --no-sandbox "$@"
