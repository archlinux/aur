#!/usr/bin/fish

set -l package (curl -sLf https://dl.google.com/android/repository/repository2-1.xml | yq -p xml --xml-keep-namespace=false --xml-attribute-prefix="" -o json -I0 '.sdk-repository.remotePackage[] | select(.path == "platform-tools")')
or echo "Network request failed" && exit 1
set -l pkgver (echo $package | jq -r '.revision | join(".")')
set -l checksum (echo $package | jq -r '.archives.archive[] | select(.["host-os"] == "linux").complete.checksum')
sed -i -r "/^pkgver/{s/=.+\$/=$pkgver/}" PKGBUILD
sed -i -r "/^sha1sums=\(\$/{n;s/\".+\"\$/\"$checksum\"/g}" PKGBUILD

if not git diff --quiet PKGBUILD
    makepkg --printsrcinfo > .SRCINFO
    or echo "Failed to generate .SRCINFO" && git restore PKGBUILD .SRCINFO && exit 1
    git add PKGBUILD .SRCINFO
    git commit -m "bump: $pkgver"
else
    echo "No update"
    exit 1
end
