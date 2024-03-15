#!/bin/bash
set -x

export RELEASE_INFO="$(mktemp)"

set -eo pipefail
curl -L --silent --fail \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/opentofu/opentofu/releases > "$RELEASE_INFO"

BIN_LINK_QUERY=

VERSION="$(jq -r '.[].published_at |= fromdateiso8601 | sort_by(.published_at) | .[] |= select(.tag_name | test(".*(alpha|beta|rc).*") | not) | last | .tag_name' "$RELEASE_INFO")"
PKG_VERSION="pkgver=$(echo "${VERSION}"| sed "s/-/_/g")"
echo "$PKG_VERSION"
sed -i "s/pkgver=.*/$PKG_VERSION/g" PKGBUILD

function update_arch {
    gh_arch="$1"
    pkg_arch="$2"
    version="$3"

    source_url="$(jq -r --arg tofu_version "$version" --arg arch "$gh_arch" '.[].published_at |= fromdateiso8601 | sort_by(.published_at) | .[] |= select(.tag_name == $tofu_version) | last | .assets[] | select(.name | test("tofu_.*_linux_\($arch).zip$")) | .browser_download_url' $RELEASE_INFO
)"
    SOURCE_ARCH="source_${pkg_arch}=(\"${source_url}\")"
    echo "$SOURCE_ARCH"
    sha256="$(curl -L "$source_url" --silent --fail | openssl sha256 -hex | sed 's/SHA2-256(stdin)= //g')"
    CHECKSUM_ARCH="sha256sums_${pkg_arch}=(\"$sha256\")"
    echo "$CHECKSUM_ARCH"
    sed -i "s#source_${pkg_arch}=.*#${SOURCE_ARCH}#g" PKGBUILD
    sed -i "s#sha256sums_${pkg_arch}=.*#${CHECKSUM_ARCH}#g" PKGBUILD
}

update_arch "amd64" "x86_64" "$VERSION"
update_arch "386" "i686" "$VERSION"
update_arch "arm64" "aarch64" "$VERSION"
update_arch "arm" "armv7h" "$VERSION"

rm "$RELEASE_INFO"

makepkg -i
tofu --version
makepkg --printsrcinfo > .SRCINFO
