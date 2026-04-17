#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "$0")" && pwd)
pkgbuild="$repo_dir/PKGBUILD"
srcinfo="$repo_dir/.SRCINFO"
repo_api='https://api.github.com/repos/GyulyVGC/sniffnet/releases/latest'
asset_name='Sniffnet_LinuxAppImage_amd64.AppImage'

if [[ ! -f "$pkgbuild" ]]; then
  printf 'PKGBUILD not found at %s\n' "$pkgbuild" >&2
  exit 1
fi

python_output=$(python - <<'PY'
import json
import sys
import urllib.request

repo_api = 'https://api.github.com/repos/GyulyVGC/sniffnet/releases/latest'
asset_name = 'Sniffnet_LinuxAppImage_amd64.AppImage'

with urllib.request.urlopen(repo_api) as response:
    release = json.load(response)

tag = release['tag_name']
version = tag[1:] if tag.startswith('v') else tag
asset = next((a for a in release['assets'] if a['name'] == asset_name), None)
if asset is None:
    raise SystemExit(f'asset not found: {asset_name}')

with urllib.request.urlopen(asset['browser_download_url']) as response:
    digest = __import__('hashlib').sha256(response.read()).hexdigest()

print(version)
print(digest)
PY
)

pkgver=$(printf '%s\n' "$python_output" | sed -n '1p')
sha256=$(printf '%s\n' "$python_output" | sed -n '2p')

python - "$pkgbuild" "$pkgver" "$sha256" <<'PY'
import pathlib
import re
import sys

path = pathlib.Path(sys.argv[1])
pkgver = sys.argv[2]
sha256 = sys.argv[3]
text = path.read_text()
text, n1 = re.subn(r"^pkgver=.*$", f"pkgver={pkgver}", text, count=1, flags=re.M)
text, n2 = re.subn(r"^sha256sums=\('[0-9a-f]+'\)$", f"sha256sums=('{sha256}')", text, count=1, flags=re.M)
if n1 != 1 or n2 != 1:
    raise SystemExit('failed to update PKGBUILD')
path.write_text(text)
PY

(
  cd "$repo_dir"
  makepkg --printsrcinfo > "$srcinfo"
)

printf 'Updated sniffnet-bin to %s\n' "$pkgver"
printf 'sha256: %s\n' "$sha256"
