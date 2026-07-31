#!/usr/bin/env bash
# Bump anthropic-cli-bin to the latest upstream release.
# Usage: ./update.sh [version]   (defaults to latest GitHub release)
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

repo=anthropics/anthropic-cli

if [[ $# -ge 1 ]]; then
	ver=${1#v}
else
	ver=$(curl -fsSL "https://api.github.com/repos/$repo/releases/latest" |
		python3 -c 'import json,sys; print(json.load(sys.stdin)["tag_name"].lstrip("v"))')
fi

cur=$(grep -oP '^pkgver=\K.*' PKGBUILD)
if [[ $ver == "$cur" ]]; then
	echo "already at $ver, nothing to do"
	exit 0
fi

echo "bumping $cur -> $ver"

sums=$(curl -fsSL "https://github.com/$repo/releases/download/v$ver/ant_${ver}_checksums.txt")
_sum() { awk -v f="ant_${ver}_linux_$1.tar.gz" '$2==f{print $1}' <<<"$sums"; }

declare -A new=(
	[x86_64]=$(_sum amd64)
	[aarch64]=$(_sum arm64)
	[i686]=$(_sum 386)
	[armv6h]=$(_sum armv6)
)
lic=$(curl -fsSL "https://raw.githubusercontent.com/$repo/v$ver/LICENSE" | sha256sum | cut -d' ' -f1)

for arch in "${!new[@]}"; do
	[[ -n ${new[$arch]} ]] || { echo "no checksum published for $arch" >&2; exit 1; }
done

sed -i \
	-e "s/^pkgver=.*/pkgver=$ver/" \
	-e "s/^pkgrel=.*/pkgrel=1/" \
	-e "s/^sha256sums=('.*')$/sha256sums=('$lic')/" \
	PKGBUILD

for arch in "${!new[@]}"; do
	sed -i "s/^sha256sums_$arch=('.*')\$/sha256sums_$arch=('${new[$arch]}')/" PKGBUILD
done

makepkg --printsrcinfo > .SRCINFO

echo
echo "PKGBUILD and .SRCINFO updated. Verify, then:"
echo "  makepkg -f && git commit -am 'Update to $ver' && git push"
