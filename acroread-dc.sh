#!/bin/bash
# Adobe Acrobat Reader DC launcher for Arch Linux

set -u

APPDIR="/opt/acroread-dc-wine"
WINEPREFIX="${HOME}/.local/share/acroread-dc-wine"

export WINEPREFIX
export WINEDEBUG="-all"

find_reader() {
    local candidate
    for candidate in \
        "$WINEPREFIX/drive_c/Program Files/Adobe/Acrobat DC/Acrobat/Acrobat.exe" \
        "$WINEPREFIX/drive_c/Program Files (x86)/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe" \
        "$WINEPREFIX/drive_c/Program Files/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe"; do
        if [[ -f "$candidate" ]]; then
            printf '%s\n' "$candidate"
            return 0
        fi
    done
    return 1
}

INSTALLER="$(find "$APPDIR" -maxdepth 1 -type f -name 'AcroRdrDCx64*.exe' -print -quit)"
if [[ -z "$INSTALLER" ]]; then
    echo "Adobe Acrobat Reader installer is missing from $APPDIR." >&2
    exit 1
fi

INSTALLER_ID="${INSTALLER##*/}"
STATE_FILE="$WINEPREFIX/.acroread-dc-wine-installer"
INSTALLED_ID=""
if [[ -r "$STATE_FILE" ]]; then
    read -r INSTALLED_ID < "$STATE_FILE"
fi

READER_EXE="$(find_reader || true)"

# Run setup when Reader is missing or the packaged installer changed.
if [[ -z "$READER_EXE" || "$INSTALLED_ID" != "$INSTALLER_ID" ]]; then
    if [[ -z "$READER_EXE" ]]; then
        echo "Adobe Acrobat Reader DC is not installed."
    else
        echo "A newer Adobe Acrobat Reader DC package is available."
    fi
    echo "Running setup..."
    "$APPDIR/acroread-dc-setup.sh"

    READER_EXE="$(find_reader || true)"

    if [[ -z "$READER_EXE" ]]; then
        echo "Installation failed or was cancelled."
        exit 1
    fi
fi

export WINEDLLOVERRIDES="mspatcha=n,b"

# Convert file arguments to Windows paths
args=()
for arg in "$@"; do
    if [[ -e "$arg" ]]; then
        abs_path=$(realpath "$arg")
        # Use forward slashes (Wine accepts both, but backslashes can cause shell issues)
        win_path=$(winepath -w "$abs_path" 2>/dev/null)
        win_path="${win_path//\\/\/}"
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
