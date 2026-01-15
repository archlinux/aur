#!/bin/bash
# ==============================================================================
# Hytale Launcher Wrapper for Arch Linux
#
# Author:      [SCDevel/root@scdevel.net]
# License:     MIT
# Description: Temporary fix for nautilus crash due to hardcoded requirement of nautilus
#
# Disclaimer:  This script is an unofficial community tool and is not
#              affiliated with, endorsed by, or owned by Hypixel Studios Canada.
# ==============================================================================

TARGET=""

for arg in "$@"; do
    [[ "$arg" == -* ]] && continue
    TARGET="$arg"
done


if [[ -z "$TARGET" ]]; then
    echo "ERROR: Unable to open file/folder."
    exit 1
fi

# xdg-open should be included with xdg-utils.
exec xdg-open "$TARGET" & disown

exit 0
