#!/usr/bin/fish

set -l release (curl -sLf https://api.github.com/repos/SagerNet/sing-box/releases | jq -rc 'map(select(.prerelease)) | first')
set -l _pkgver (echo $release | jq -r .name)
set -l assets (echo $release | jq -rc '.assets | map(select(.name | endswith(".pkg.tar.zst")))')
for asset in (echo $assets | jq -r '.[] | "\(.name) \(.digest)"' | string replace -r '.+_linux_(x86_64|armv7h|aarch64)l?\.pkg\.tar\.zst sha256:' '$1 ')
    set -l asset (string split ' ' $asset)
    set $asset[1] $asset[2]
end
string replace -r 'sha256sums_x86_64=\("\K\w+' $x86_64 < PKGBUILD\
| string replace -r 'sha256sums_armv7h=\("\K\w+' $armv7h\
| string replace -r 'sha256sums_aarch64=\("\K\w+' $aarch64 > PKGBUILD.new
mv PKGBUILD.new PKGBUILD
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "bump: $_pkgver"