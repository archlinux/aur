#!/bin/sh
# tcmaker-fonts-uninstall
# Removes TCMaker's .fon bitmap fonts from a Wine prefix.
# Usage: ./tcmaker-fonts-uninstall [WINEPREFIX_PATH]
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

if [ ! -d "$prefix" ]; then
    printf 'Error: Wine prefix "%s" does not exist.\n' "$prefix" >&2
    exit 1
fi

printf 'Cleaning fonts from Wine prefix: %s\n' "$prefix"

# --- 2. Remove registry entries -------------------------------------------
# The registry key is:
# HKLM\Software\Microsoft\Windows NT\CurrentVersion\Fonts
# (see https://www.winehq.org/pipermail/wine-users/2011-January/084728.html)
reg_key='HKLM\Software\Microsoft\Windows NT\CurrentVersion\Fonts'

# Source directory where the package placed the .fon files.
font_src_dir="/usr/share/fml-tcmaker"

# Iterate over the packaged font files to know which registry values to delete.
for font_file in "$font_src_dir"/*.fon; do
    [ -e "$font_file" ] || continue
    basename_font=$(basename "$font_file")
    font_name="${basename_font%.fon}"

    # Delete the registry value. /f suppresses confirmation.
    WINEPREFIX="$prefix" wine reg delete "$reg_key" \
        /v "$font_name" \
        /f 2>/dev/null || true
done

# --- 3. Remove the font files from the prefix ------------------------------
font_dst_dir="${prefix}/drive_c/windows/Fonts"

for font_file in "$font_src_dir"/*.fon; do
    [ -e "$font_file" ] || continue
    basename_font=$(basename "$font_file")
    rm -fv "${font_dst_dir}/${basename_font}"
done

printf 'Fonts removed from prefix: %s\n' "$prefix"

