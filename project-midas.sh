#!/bin/bash
# Launcher for Project Midas (AUR: project-midas-bin).
#
# The game writes midas.ini, saves, profiles and logs next to its own
# executable, so it can't run from the read-only copy in /opt. This script
# keeps a per-user copy of the game files and runs the game from there.
#
# Usage:
#   project-midas [game options...]
#   project-midas --set-rom /path/to/GoldenEye.z64

# --- Paths: change these to move things around ---------------------------
GAME_DIR="/opt/project-midas"   # packaged game files (PKGBUILD sets this)
USER_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/project-midas"   # per-user copy
DATA_DIR="$USER_DIR/Data"       # where the game looks for the cart image
# --------------------------------------------------------------------------

GAME_BIN="ProjectMidas"
# SHA-1 of a good GoldenEye 007 (USA) dump in .z64 (big-endian) byte order
ROM_SHA1="abe01e4aeb033b6c0836819f549c791b26cfde83"

set -euo pipefail

msg() { printf 'project-midas: %s\n' "$*" >&2; }

# Copy the packaged files into USER_DIR on first run and after every
# upgrade. Only files that ship in the package are overwritten; your ROM,
# midas.ini, saves and profiles are left alone.
sync_game_files() {
    if ! cmp -s "$GAME_DIR/$GAME_BIN" "$USER_DIR/$GAME_BIN"; then
        mkdir -p "$USER_DIR"
        cp -rPfT --preserve=mode "$GAME_DIR" "$USER_DIR"
    fi
}

# Print the first cart image in DATA_DIR, if there is one.
find_rom() {
    find "$DATA_DIR" -maxdepth 1 -type f \
        \( -iname '*.z64' -o -iname '*.n64' -o -iname '*.v64' \) \
        -print -quit 2>/dev/null || true
}

# Ask for a ROM: a GUI file picker if one is installed, otherwise the terminal.
ask_for_rom() {
    local title="Project Midas: choose your GoldenEye 007 (USA) N64 ROM"
    if [[ -n "${DISPLAY:-}${WAYLAND_DISPLAY:-}" ]] && command -v zenity >/dev/null; then
        zenity --file-selection --title="$title" \
            --file-filter='N64 ROM (*.z64 *.n64 *.v64) | *.z64 *.Z64 *.n64 *.N64 *.v64 *.V64' \
            2>/dev/null || true
    elif [[ -n "${DISPLAY:-}${WAYLAND_DISPLAY:-}" ]] && command -v kdialog >/dev/null; then
        kdialog --title "$title" --getopenfilename "$HOME" \
            'N64 ROM (*.z64 *.n64 *.v64)' 2>/dev/null || true
    elif [[ -t 0 ]]; then
        local path
        read -r -e -p "Path to your GoldenEye 007 (USA) ROM: " path
        printf '%s\n' "${path/#\~/$HOME}"
    fi
}

# Copy a ROM into DATA_DIR, checking a .z64 against the known-good SHA-1.
install_rom() {
    local rom="$1"
    if [[ ! -f "$rom" ]]; then
        msg "not a file: $rom"
        return 1
    fi
    case "${rom,,}" in
        *.z64)
            local sum
            sum="$(sha1sum "$rom" | cut -d' ' -f1)"
            if [[ "$sum" != "$ROM_SHA1" ]]; then
                msg "warning: SHA-1 is $sum, expected $ROM_SHA1"
                msg "warning: this doesn't look like a clean GoldenEye 007 (USA) dump"
            fi
            ;;
        *.n64|*.v64) ;;
        *)
            msg "expected a .z64, .n64 or .v64 file: $rom"
            return 1
            ;;
    esac
    install -Dm644 "$rom" "$DATA_DIR/$(basename "$rom")"
    msg "ROM copied to $DATA_DIR/$(basename "$rom")"
}

sync_game_files

if [[ "${1:-}" == "--set-rom" ]]; then
    if [[ -z "${2:-}" ]]; then
        msg "usage: project-midas --set-rom /path/to/GoldenEye.z64"
        exit 1
    fi
    install_rom "$2"
    exit 0
fi

if [[ -z "$(find_rom)" ]]; then
    msg "no ROM found in $DATA_DIR"
    rom="$(ask_for_rom)"
    if [[ -z "$rom" ]]; then
        msg "Project Midas needs your own GoldenEye 007 (USA) N64 ROM."
        msg "Copy it into $DATA_DIR, or run: project-midas --set-rom /path/to/rom.z64"
        exit 1
    fi
    install_rom "$rom"
fi

cd "$USER_DIR"
exec "./$GAME_BIN" "$@"
