#!/usr/bin/env bash
# Update cap-bin to the latest Cap release (or the version given as $1).
# Bumps pkgver, resets pkgrel, refreshes checksums and regenerates .SRCINFO.
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

for cmd in curl jq updpkgsums makepkg bsdtar strings; do
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

# Keep _onnxver (used for the bundled onnxruntime's license) in sync with the .deb
onnxver=$(bsdtar -xOf "cap-bin-$latest.deb" 'data.tar*' \
  | bsdtar -xOf - '*usr/lib/cap/libonnxruntime.so.1' \
  | strings -n 5 | grep -m1 -xE '[0-9]+\.[0-9]+\.[0-9]+' || true)
if [[ -z $onnxver ]]; then
  echo "warning: could not detect bundled onnxruntime version, check _onnxver manually" >&2
elif [[ $onnxver != "$(sed -n 's/^_onnxver=//p' PKGBUILD)" ]]; then
  echo "Bundled onnxruntime changed, updating _onnxver to $onnxver"
  sed -i "s/^_onnxver=.*/_onnxver=$onnxver/" PKGBUILD
  updpkgsums
fi

makepkg --printsrcinfo > .SRCINFO

echo
echo "Done. Test with 'makepkg -fc', then commit and push:"
echo "  git add PKGBUILD .SRCINFO && git commit -m 'Update to $latest' && git push"
