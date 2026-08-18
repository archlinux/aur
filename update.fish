#!/usr/bin/fish

function cleanup
    echo $argv
    rm -f SHA512SUMS SHA512SUMS.asc
    git restore PKGBUILD .SRCINFO
    exit 1
end

set -l pkgver (curl -sLf "https://product-details.mozilla.org/1.0/firefox_versions.json" | jq -r ".FIREFOX_DEVEDITION")
sed -i -r "/^pkgver/{s/=.+\$/=$pkgver/}" PKGBUILD
if not git diff --quiet PKGBUILD
    makepkg --printsrcinfo > .SRCINFO || cleanup "Failed to generate .SRCINFO"
    git add PKGBUILD .SRCINFO
    git commit -m "bump: $pkgver"
else
    cleanup "No update"
end
