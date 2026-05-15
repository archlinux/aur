#!/usr/bin/env bash
# Apply a new version reported by nvchecker. Called from ~/distsystem/aur/update-all.sh.
# Argument: pkgver (no leading 'v')
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"
. "$(dirname "$PWD")/lib/bump.sh"

aur_bump_if_changed "pkgver=${1:?usage: apply.sh <pkgver>}"
