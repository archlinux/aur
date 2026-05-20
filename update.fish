#!/usr/bin/fish

set -l pkgver (curl -sLf "https://product-details.mozilla.org/1.0/firefox_versions.json" | jq -r ".FIREFOX_DEVEDITION")
sed -i -r "/^pkgver/{s/=.+\$/=$pkgver/}" PKGBUILD
if not git diff --quiet PKGBUILD
    makepkg --printsrcinfo > .SRCINFO
    git add PKGBUILD .SRCINFO
    git commit -m "bump: $pkgver"
else
    echo "No update"
end
