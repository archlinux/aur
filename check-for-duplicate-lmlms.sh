#!/bin/bash

USER_MOD_DIRECOTRY="$HOME/.local/share/lucas-simpsons-hit-and-run-mod-launcher/mods/"
SYSTEM_MOD_DIRECTORY="/usr/share/lucas-simpsons-hit-and-run-mod-launcher/mods/"

# Modified version of: https://unix.stackexchange.com/a/41615.

# Find every LMLM file in the user and system mods directory, and print the last element.
DUPLICATE_MOD_PATHS=$(find "$USER_MOD_DIRECOTRY" "$SYSTEM_MOD_DIRECTORY" -maxdepth 1 \
    -name "*.lmlm" -type f -printf '%f\n' | \
    # Sort the list.
    sort | \
    # Find the duplicate lines.
    uniq -d | \
    # Prepend the user mod directory to the path.
    sed -e "s|^|$USER_MOD_DIRECOTRY|g")

if [[ -n "$DUPLICATE_MOD_PATHS" ]]; then
  read -rp "$(echo "$DUPLICATE_MOD_PATHS" | wc -l) duplicate mods found:
$DUPLICATE_MOD_PATHS
Remove duplicate mods? (y/n): " CHOICE
  if [[ ${CHOICE,,} = "y" ]]; then
    rm "$DUPLICATE_MOD_PATHS"
  fi
fi