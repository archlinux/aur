#!/usr/bin/env bash
set -e

# Regenerate .SRCINFO if PKGBUILD changed
if git diff --cached --name-only --diff-filter=ACM | grep -qx 'PKGBUILD'; then
    echo ">>> PKGBUILD staged — regenerating .SRCINFO..."
    makepkg --printsrcinfo > .SRCINFO
    git add .SRCINFO
fi
