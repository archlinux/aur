#!/bin/bash
# Adobe Acrobat Reader DC launcher for Arch Linux

set -u

APPDIR="/opt/acroread-dc-wine"
WINEPREFIX="${HOME}/.local/share/acroread-dc-wine"

export WINEPREFIX
export WINEDEBUG="-all"

# Find Adobe Reader executable (wow64 installs to "Program Files (x86)")
READER_EXE="$WINEPREFIX/drive_c/Program Files (x86)/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe"
if [[ ! -f "$READER_EXE" ]]; then
    READER_EXE="$WINEPREFIX/drive_c/Program Files/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe"
fi

# Run setup if Reader is not installed
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

# Convert file arguments to Windows paths
args=()
for arg in "$@"; do
    if [[ -e "$arg" ]]; then
        abs_path=$(realpath "$arg")
        win_path=$(wine winepath -w "$abs_path" 2>/dev/null)
        args+=("$win_path")
    else
        args+=("$arg")
    fi
done

# Get screen resolution for virtual desktop
get_screen_resolution() {
    if command -v xrandr &>/dev/null; then
        xrandr 2>/dev/null | grep '\*' | head -1 | awk '{print $1}'
    elif command -v xdpyinfo &>/dev/null; then
        xdpyinfo 2>/dev/null | grep dimensions | awk '{print $2}'
    else
        echo "1920x1080"
    fi
}

# Virtual desktop is required for the tab bar to render properly
# Set ACROREAD_NO_VIRTUAL_DESKTOP=1 to disable (tabs won't work)
if [[ "${ACROREAD_NO_VIRTUAL_DESKTOP:-0}" != "1" ]]; then
    RESOLUTION=$(get_screen_resolution)
    exec wine explorer /desktop=AcroRead,"$RESOLUTION" "$READER_EXE" "${args[@]}"
else
    exec wine "$READER_EXE" "${args[@]}"
fi
