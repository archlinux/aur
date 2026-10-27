#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-master}"
REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v docker >/dev/null 2>&1; then
    echo "Docker is required to update this package." >&2
    exit 1
fi

WORK_DIR="$(mktemp -d)"
trap 'rm -rf -- "$WORK_DIR"' EXIT

# Keep stdout for the result archive; container diagnostics go to stderr.
docker run --rm -i archlinux:base bash -s -- "$VERSION" > "$WORK_DIR/update.tar" <<'CONTAINER'
set -euo pipefail

pacman -Syu --noconfirm --needed curl pacman-contrib >&2

# makepkg refuses to run as root. Keep all temporary files in the container.
install -d -o nobody -g nobody /tmp/package
runuser -u nobody -- bash -s -- "$1" <<'PACKAGE'
set -euo pipefail
cd /tmp/package
RAW_BASE="https://raw.githubusercontent.com/playit-cloud/playit-agent/${1}"

curl --fail --location --output PKGBUILD "${RAW_BASE}/arch/build/PKGBUILD" >&2
curl --fail --location --output playit.install "${RAW_BASE}/arch/build/playit.install" >&2
updpkgsums >&2
makepkg --printsrcinfo > .SRCINFO
PACKAGE

tar -C /tmp/package -cf - PKGBUILD playit.install .SRCINFO
CONTAINER

tar -xf "$WORK_DIR/update.tar" -C "$WORK_DIR"
for file in PKGBUILD playit.install .SRCINFO; do
    cat "$WORK_DIR/$file" > "$REPO_DIR/$file"
done
