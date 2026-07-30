#!/usr/bin/env bash
# Bumps pkgver in PKGBUILD and refreshes all sha256sums.
# Usage: ./update.sh <new-version>   e.g. ./update.sh 0.12.0
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <new-version>" >&2
  exit 1
fi

newver="$1"
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pkgbuild="$dir/PKGBUILD"

oldver="$(awk -F= '/^pkgver=/{print $2}' "$pkgbuild")"
echo "Updating pkgver: $oldver -> $newver"
sed -i "s/^pkgver=.*/pkgver=$newver/" "$pkgbuild"
sed -i "s/^pkgrel=.*/pkgrel=1/" "$pkgbuild"

sha256_of() {
  local url="$1"
  curl -fsSL "$url" | sha256sum | awk '{print $1}'
}

echo "Fetching new checksums..."

license_sum="$(sha256_of "https://raw.githubusercontent.com/perber/leafwiki/v$newver/LICENSE")"
readme_sum="$(sha256_of "https://raw.githubusercontent.com/perber/leafwiki/v$newver/README.md")"
amd64_sum="$(sha256_of "https://github.com/perber/leafwiki/releases/download/v$newver/leafwiki-v$newver-linux-amd64")"
arm64_sum="$(sha256_of "https://github.com/perber/leafwiki/releases/download/v$newver/leafwiki-v$newver-linux-arm64")"

# Replace the two-element sha256sums=() array (LICENSE, README.md)
python3 - "$pkgbuild" "$license_sum" "$readme_sum" "$amd64_sum" "$arm64_sum" <<'EOF'
import re, sys

pkgbuild_path, license_sum, readme_sum, amd64_sum, arm64_sum = sys.argv[1:6]

with open(pkgbuild_path) as f:
    content = f.read()

content = re.sub(
    r"sha256sums=\(\s*'[^']*'\s*\n\s*'[^']*'\s*\)",
    f"sha256sums=(\n  '{license_sum}'\n  '{readme_sum}'\n)",
    content,
)
content = re.sub(
    r"sha256sums_x86_64=\('[^']*'\)",
    f"sha256sums_x86_64=('{amd64_sum}')",
    content,
)
content = re.sub(
    r"sha256sums_aarch64=\('[^']*'\)",
    f"sha256sums_aarch64=('{arm64_sum}')",
    content,
)

with open(pkgbuild_path, "w") as f:
    f.write(content)
EOF

echo "Regenerating .SRCINFO..."
(cd "$dir" && makepkg --printsrcinfo > .SRCINFO)

echo "Done. New PKGBUILD:"
cat "$pkgbuild"
