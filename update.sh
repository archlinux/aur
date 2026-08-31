#!/bin/bash
# 检查上游新版本并更新 PKGBUILD
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

echo "Checking latest release..."
RELEASE=$(curl --fail --silent --show-error --location \
    "https://api.github.com/repos/GUI-for-Cores/GUI.for.SingBox/releases/latest")
LATEST=$(jq -er '.tag_name | strings | select(startswith("v"))' <<< "${RELEASE}")
LATEST="${LATEST#v}"
CURRENT=$(grep '^pkgver=' PKGBUILD | cut -d\' -f2)

if [[ ! "${LATEST}" =~ ^[0-9]+(\.[0-9]+){2}([.-][0-9A-Za-z.-]+)?$ ]]; then
    echo "Invalid release version: ${LATEST}" >&2
    exit 1
fi

if [[ "$LATEST" == "$CURRENT" ]]; then
    echo "Already at $CURRENT, nothing to do."
    exit 0
fi

ASSET="GUI.for.SingBox-linux-amd64.zip"
jq -er --arg asset "${ASSET}" \
    '.assets[] | select(.name == $asset) | .browser_download_url' \
    <<< "${RELEASE}" >/dev/null

echo "Updating $CURRENT -> $LATEST"

sed -i "s/^pkgver='.*'/pkgver='${LATEST}'/" PKGBUILD
sed -i "s/^pkgrel='.*'/pkgrel='1'/" PKGBUILD

updpkgsums
makepkg --force --verifysource
makepkg --printsrcinfo > .SRCINFO
echo "Done. Review diff and commit."
