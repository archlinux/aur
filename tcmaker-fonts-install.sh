#!/bin/sh
# tcmaker-fonts-install
# Installs TCMaker's .fon bitmap fonts into a Wine prefix.
# Usage: ./tcmaker-fonts-install [WINEPREFIX_PATH]
# If no argument is given, WINEPREFIX is used;
# if that is unset, ~/.wine is assumed.

set -eu

# --- 1. Determine the Wine prefix -----------------------------------------
if [ "$#" -ge 1 ]; then
    prefix="$1"
elif [ -n "${WINEPREFIX:-}" ]; then
    prefix="$WINEPREFIX"
else
    prefix="$HOME/.wine"
fi

# Basic sanity check
if [ ! -d "$prefix" ]; then
    printf 'Error: Wine prefix "%s" does not exist.\n' "$prefix" >&2
    exit 1
fi

printf 'Using Wine prefix: %s\n' "$prefix"

# --- 2. Copy the .fon files ------------------------------------------------
font_src_dir="/usr/share/fml-tcmaker"
font_dst_dir="${prefix}/drive_c/windows/Fonts"

if [ ! -d "$font_src_dir" ]; then
    printf 'Error: Font source directory "%s" not found.\n' "$font_src_dir" >&2
    exit 1
fi

mkdir -p "$font_dst_dir"
cp -v "$font_src_dir"/*.fon "$font_dst_dir/"

# --- 3. Register each font in the registry ---------------------------------
# The registry key is:
# HKLM\Software\Microsoft\Windows NT\CurrentVersion\Fonts
# (see https://www.winehq.org/pipermail/wine-users/2011-January/084728.html)

reg_key='HKLM\Software\Microsoft\Windows NT\CurrentVersion\Fonts'

for font_file in "$font_src_dir"/*.fon; do
    [ -e "$font_file" ] || continue
    basename_font=$(basename "$font_file")
    # The registry value name is conventionally the font name.
    font_name="${basename_font%.fon}"

    WINEPREFIX="$prefix" wine reg add "$reg_key" \
        /v "$font_name" \
        /d "C:\\Windows\\Fonts\\$basename_font" \
        /f
done

printf 'Fonts installed and registered in prefix: %s\n' "$prefix"

