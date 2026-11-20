#!/bin/bash
# Launcher for Red Two (AUR: red-two-bin).
#
# Runs the unpacked AppImage from /opt with the working directory set to
# Red Two's data folder, so anything the game opens with a relative path
# (its memory card, saves/GSWE64_A.raw, or a disc "next to the program")
# lands somewhere writable instead of the read-only /opt.
#
# Usage: red-two [--disc PATH] [--fullscreen] [other Red Two options...]

# --- Paths: change these to move things around ---------------------------
APP_DIR="/opt/red-two"   # unpacked AppImage (PKGBUILD sets this)
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/Red Two"   # settings, saves, states, logs
# --------------------------------------------------------------------------

set -euo pipefail

# Turn a relative --disc path into an absolute one before changing directory.
args=()
while (($#)); do
    case "$1" in
        --disc)
            args+=("$1")
            shift
            if (($#)); then
                args+=("$(realpath -m -- "$1")")
                shift
            fi
            ;;
        --disc=*)
            args+=("--disc=$(realpath -m -- "${1#--disc=}")")
            shift
            ;;
        *)
            args+=("$1")
            shift
            ;;
    esac
done

mkdir -p "$DATA_DIR"
cd "$DATA_DIR"

# AppRun scripts expect the AppImage runtime to set APPDIR.
export APPDIR="$APP_DIR"
exec "$APP_DIR/AppRun" "${args[@]}"
