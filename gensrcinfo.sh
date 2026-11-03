#!/usr/bin/env bash
# Regenerate .SRCINFO from PKGBUILD; run before every commit.
set -euo pipefail
cd "$(dirname "$0")"
makepkg --printsrcinfo > .SRCINFO
