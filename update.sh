#!/usr/bin/env bash
set -euo pipefail

# Usage: bash update.sh [branch-or-tag]. Requires Bash, Docker, and tar.
VERSION="${1:-master}"
REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v docker >/dev/null 2>&1; then
  printf 'Docker is required. Install Docker and start its daemon.\n' >&2
  exit 1
fi

WORK_DIR="$(mktemp -d)"
trap 'rm -rf -- "$WORK_DIR"' EXIT

# Keep stdout for the archive; send container progress to stderr.
docker run --rm -i archlinux:base bash -s -- "$VERSION" > "$WORK_DIR/update.tar" <<'CONTAINER'
set -euo pipefail

pacman -Syu --noconfirm --needed base-devel pacman-contrib curl >&2

# makepkg requires an unprivileged user.
install -d -o nobody -g nobody /tmp/update
runuser -u nobody -- bash -s -- "$1" <<'UPDATE'
set -euo pipefail
export HOME=/tmp/update
cd "$HOME"

RAW_BASE="https://raw.githubusercontent.com/playit-cloud/playit-agent/${1}"
curl --fail --location -o PKGBUILD "${RAW_BASE}/arch/bin/PKGBUILD" >&2
curl --fail --location -o playit-bin.install "${RAW_BASE}/arch/bin/playit-bin.install" >&2

updpkgsums >&2
makepkg --printsrcinfo > .SRCINFO
UPDATE

tar -C /tmp/update -cf - PKGBUILD playit-bin.install .SRCINFO
CONTAINER

# Publish only completed results, using the host user's file ownership.
tar --no-same-owner -xf "$WORK_DIR/update.tar" -C "$REPO_DIR"
