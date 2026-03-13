#!/bin/bash
set -e

updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Inject keywords into .SRCINFO (makepkg does not output them)
KEYWORDS=$(grep -oP "(?<=keywords=\()[^)]*" PKGBUILD | tr -d "'" | tr ' ' '\n')
if [ -n "$KEYWORDS" ]; then
    KEYWORD_LINES=$(echo "$KEYWORDS" | sed "s/.*/\tkeywords = &/")
    while IFS= read -r line; do
        sed -i "/^\toptions/a\\$line" .SRCINFO
    done <<< "$(echo "$KEYWORD_LINES" | tac)"
fi
