#!/usr/bin/env bash
# Apply a new version reported by nvchecker. Called from ~/distsystem/aur/update-all.sh.
# Argument: bare Codex app version from the Sparkle appcast (e.g. 26.513.31313).
# pkgver carries a .dev suffix to mark this as the community Linux rebuild.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"
. "$(dirname "$PWD")/lib/bump.sh"

aur_bump_if_changed "pkgver=${1:?usage: apply.sh <codex-version>}.dev"
