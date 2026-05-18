#!/usr/bin/env bash
# Bump PKGBUILD to the latest upstream GitHub release (local helper).
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$repo_root"

upstream_repo=${UPSTREAM_REPO:-xingkongliang/skills-manager}
tag=$(curl -fsSL "https://api.github.com/repos/${upstream_repo}/releases/latest" | jq -r '.tag_name')
if [[ -z "$tag" || "$tag" == "null" ]]; then
  echo "error: could not resolve latest release tag" >&2
  exit 1
fi

pkgver=${tag#v}
current=$(grep -E '^pkgver=' PKGBUILD | cut -d= -f2)
if [[ "$current" == "$pkgver" ]]; then
  echo "PKGBUILD already at ${pkgver}"
  exit 0
fi

echo "Updating PKGBUILD: ${current} -> ${pkgver}"
sed -i "s/^pkgver=.*/pkgver=${pkgver}/" PKGBUILD
sed -i 's/^pkgrel=.*/pkgrel=1/' PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
echo "Done. Review changes, then commit and push to AUR."
