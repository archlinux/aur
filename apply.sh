#!/usr/bin/env bash
# Apply a new version reported by nvchecker. Called from ~/distsystem/aur/update-all.sh.
# Argument: combined version "pkgver-_build-_commit"
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"
. "$(dirname "$PWD")/lib/bump.sh"

IFS=- read -r new_ver new_build new_commit <<<"${1:?usage: apply.sh <ver-build-commit>}"
aur_bump_if_changed \
    "pkgver=$new_ver" \
    "_build=$new_build" \
    "_commit=$new_commit"
