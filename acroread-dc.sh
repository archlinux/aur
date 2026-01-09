#!/bin/bash
# Adobe Acrobat Reader DC launcher for Arch Linux
# Based on mmtrt's snap sommelier implementation

set -u

APPDIR="/opt/acroread-dc-wine"
WINEPREFIX="${HOME}/.local/share/acroread-dc-wine"

export WINEPREFIX
export WINEDEBUG="-all"

# In wow64 mode, 32-bit apps install to "Program Files (x86)"
READER_EXE="$WINEPREFIX/drive_c/Program Files (x86)/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe"
# Fallback to old path for compatibility
if [[ ! -f "$READER_EXE" ]]; then
    READER_EXE="$WINEPREFIX/drive_c/Program Files/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe"
fi

# Check if Wine prefix exists and Reader is installed
if [[ ! -f "$READER_EXE" ]]; then
    echo "Adobe Acrobat Reader DC is not installed."
    echo "Running setup..."
    "$APPDIR/acroread-dc-setup.sh"

    # Re-check paths after install
    READER_EXE="$WINEPREFIX/drive_c/Program Files (x86)/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe"
    if [[ ! -f "$READER_EXE" ]]; then
        READER_EXE="$WINEPREFIX/drive_c/Program Files/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe"
    fi

    if [[ ! -f "$READER_EXE" ]]; then
        echo "Installation failed or was cancelled."
        exit 1
    fi
fi

# Convert file arguments to Windows paths BEFORE changing directory
# (otherwise relative paths won't be found)
args=()
for arg in "$@"; do
    if [[ -e "$arg" ]]; then
        # Convert to absolute path first (from current directory)
        abs_path=$(realpath "$arg")
        # Convert to Windows path
        win_path=$(wine winepath -w "$abs_path" 2>/dev/null)
        args+=("$win_path")
    else
        args+=("$arg")
    fi
done

# Change to Reader directory (required for proper operation)
READER_DIR=$(dirname "$READER_EXE")
cd "$READER_DIR" || exit 1

# Fix window type function (Wine sometimes sets wrong _NET_WM_WINDOW_TYPE)
fix_window_type() {
    sleep 2
    for wid in $(xdotool search --class "AcroRd32.exe" 2>/dev/null); do
        # Set window type to NORMAL instead of DIALOG
        xprop -id "$wid" -f _NET_WM_WINDOW_TYPE 32a -set _NET_WM_WINDOW_TYPE _NET_WM_WINDOW_TYPE_NORMAL 2>/dev/null
    done
}

# Run Adobe Reader
if command -v xprop &>/dev/null && command -v xdotool &>/dev/null; then
    fix_window_type &
fi

exec wine "AcroRd32.exe" "${args[@]}"
