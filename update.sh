#!/bin/bash
# 检查上游新版本并更新 PKGBUILD
set -euo pipefail
cd "${0%/*}"

echo "Checking latest release..."
LATEST=$(curl -sL "https://api.github.com/repos/GUI-for-Cores/GUI.for.SingBox/releases/latest" | jq -r .tag_name)
LATEST="${LATEST#v}"
CURRENT=$(grep '^pkgver=' PKGBUILD | cut -d\' -f2)

if [[ "$LATEST" == "$CURRENT" ]]; then
    echo "Already at $CURRENT, nothing to do."
    exit 0
fi

echo "Updating $CURRENT → $LATEST"

URL="https://github.com/GUI-for-Cores/GUI.for.SingBox/releases/download/v${LATEST}/GUI.for.SingBox-linux-amd64.zip"
SHA=$(curl -sL "$URL" | sha256sum | cut -d' ' -f1)
echo "New sha256: $SHA"

sed -i "s/^pkgver='.*'/pkgver='${LATEST}'/" PKGBUILD
sed -i "s/^pkgrel='.*'/pkgrel='1'/" PKGBUILD
sed -i "s|v${CURRENT}/GUI.for.SingBox|v${LATEST}/GUI.for.SingBox|" PKGBUILD
sed -i "s/^sha256sums=('.*')$/sha256sums=('${SHA}')/" PKGBUILD 2>/dev/null || \
    sed -i "/^sha256sums=(/,/)/{s/'[a-f0-9]\{64\}'/'${SHA}'/}" PKGBUILD

makepkg --printsrcinfo > .SRCINFO
echo "Done. Review diff and commit."
