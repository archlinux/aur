#!/usr/bin/env bash
# Update cap-bin to the latest Cap release (or the version given as $1).
# Bumps pkgver, resets pkgrel, refreshes checksums and regenerates .SRCINFO.
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

for cmd in curl jq updpkgsums makepkg; do
  command -v "$cmd" >/dev/null || { echo "error: '$cmd' not found (updpkgsums is in pacman-contrib)" >&2; exit 1; }
done

current=$(sed -n 's/^pkgver=//p' PKGBUILD)

# Same endpoint Cap's built-in updater queries; 0.0.0 always yields the latest release
latest=${1:-$(curl -fsSL https://cdn.crabnebula.app/update/cap/cap/linux-x86_64/0.0.0 | jq -r .version)}

if [[ -z $latest || $latest == null ]]; then
  echo "error: could not determine latest version" >&2
  exit 1
fi

if [[ $latest == "$current" ]]; then
  echo "cap-bin is up to date ($current)"
  exit 0
fi

deb_url="https://cdn.crabnebula.app/download/cap/cap/latest/Cap_${latest}_amd64.deb"
if ! curl -fsSL -r 0-0 -o /dev/null "$deb_url"; then
  echo "error: $deb_url is not available yet" >&2
  exit 1
fi

echo "Updating cap-bin: $current -> $latest"

sed -i -e "s/^pkgver=.*/pkgver=$latest/" -e "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO

echo
echo "Done. Test with 'makepkg -fc', then commit and push:"
echo "  git add PKGBUILD .SRCINFO && git commit -m 'Update to $latest' && git push"
