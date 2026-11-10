#!/usr/bin/env bash
# Resolves the real release tag and AppImage name for _pkgver, then refreshes
# checksums and .SRCINFO.
#
# Dygma is inconsistent with naming (tags "v1.11.0" vs "1.12.0", tag "v1.4.0-rc4"
# vs asset "Bazecor-1.4.0-rc.4-x64.AppImage"), so instead of guessing the URL we
# ask GitHub which release matches and write its tag/asset into the PKGBUILD.
set -euo pipefail
cd "$(dirname "$0")"

repo="Dygmalab/Bazecor"
pkgver=$(sed -n 's/^_pkgver=//p' PKGBUILD | tr -d "\"'")
[[ -n $pkgver ]] || { echo "==> ERROR: no _pkgver= line in PKGBUILD" >&2; exit 1; }

releases=$(curl -fsSL ${GITHUB_TOKEN:+-H "Authorization: Bearer $GITHUB_TOKEN"} \
  "https://api.github.com/repos/${repo}/releases?per_page=100") ||
  { echo "==> ERROR: failed to query GitHub releases for ${repo}" >&2; exit 1; }

# Versions are compared by their number/letter tokens only, so
# "v1.4.0-rc4", "1.4.0-rc.4" and "1.4.0rc4" all match each other.
match=$(jq -r --arg v "$pkgver" '
  def norm: ascii_downcase | ltrimstr("v") | [scan("[0-9]+|[a-z]+")] | join(".");
  [ .[] | select((.tag_name | norm) == ($v | norm)) ] | first // empty
  | .tag_name + " " + ([ .assets[].name | select(test("x64\\.appimage$"; "i")) ] | first // "")
' <<<"$releases")

tag=${match%% *}
asset=${match#* }
[[ -n $tag ]] || { echo "==> ERROR: no ${repo} release found matching version ${pkgver}" >&2; exit 1; }
[[ -n $asset ]] || { echo "==> ERROR: release ${tag} has no x64 AppImage asset (yet?)" >&2; exit 1; }
[[ $tag$asset =~ ^[A-Za-z0-9._-]+$ ]] || { echo "==> ERROR: unexpected tag/asset name: ${tag} ${asset}" >&2; exit 1; }

# Put ${_pkgver} back wherever the literal version appears, so the PKGBUILD
# stays readable and only differs from the usual pattern when upstream does.
placeholder='${_pkgver}'
tag_line=${tag//"$pkgver"/"$placeholder"}
asset_line=${asset//"$pkgver"/"$placeholder"}

for var in _tag _appimage; do
  grep -q "^${var}=" PKGBUILD || { echo "==> ERROR: no ${var}= line in PKGBUILD" >&2; exit 1; }
done
sed -i -E \
  -e "s|^_tag=.*|_tag=\"${tag_line}\"|" \
  -e "s|^_appimage=.*|_appimage=\"${asset_line}\"|" \
  PKGBUILD

echo "==> Resolved ${pkgver}: tag=${tag} asset=${asset}"

updpkgsums
makepkg --printsrcinfo > .SRCINFO
