#!/usr/bin/env bash
# Apply a new version reported by nvchecker. Called from ~/distsystem/aur/update-all.sh.
# Argument: bare Codex app version from the Sparkle appcast (e.g. 26.513.31313).
# Bumps _appver (the pinned arm64-zip version); pkgver() appends .dev + git rev.
# aur_bump_if_changed reruns updpkgsums, so the new zip's sha256 refreshes automatically.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"
. "$(dirname "$PWD")/lib/bump.sh"

aur_bump_if_changed "_appver=${1:?usage: apply.sh <codex-version>}"
