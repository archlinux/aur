#!/usr/bin/env bash
# Maintainer-only: regenerate requirements.lock from upstream
# requirements.txt. Run this in the AUR repo root, then `git commit`
# the new lock + the PKGBUILD bump + the CHANGELOG entry.
set -euo pipefail
SRC=$(mktemp -d)
git clone --depth 1 --branch main https://github.com/pewdiepie-archdaemon/odysseus.git "$SRC"
SRC_HASH=$(sha256sum "$SRC/requirements.txt" | cut -d' ' -f1)
uv pip compile "$SRC/requirements.txt" -o requirements.lock
# Tag the lock with the upstream requirements.txt hash so the PKGBUILD
# can warn if the lock is stale.
sed -i "1i # generated from requirements.txt sha256: ${SRC_HASH}" requirements.lock
rm -rf "$SRC"
git diff --stat requirements.lock
echo "==> Review the diff above, then commit requirements.lock + PKGBUILD bump + CHANGELOG entry."
