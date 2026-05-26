#!/usr/bin/fish

set -l _data (curl -sLf https://api.github.com/repos/SagerNet/sing-box/releases?per_page=3)
or echo "Network request failed" && return 1
set -l release (echo $_data | jq -rc 'map(select(.prerelease)) | first')
test "$release" = null; and echo "Cannot fetch release data from GitHub API"\n"Raw data:"\n"$_data" && return 1
set -l _pkgver (echo $release | jq -r .name | string trim -lcv)
set -l assets (echo $release | jq -rc '.assets | map(select(.name | endswith(".pkg.tar.zst")))')
for asset in (echo $assets | jq -r '.[] | "\(.name) \(.digest)"' | string replace -r '.+_linux_(x86_64|armv7h|aarch64)l?\.pkg\.tar\.zst sha256:' '$1 ')
    set -l asset (string split ' ' $asset)
    set $asset[1] $asset[2]
end
string replace -r '^_pkgver="\K[^"]+' $_pkgver < PKGBUILD\
| string replace -r '^sha256sums_x86_64=\("\K\w+' $x86_64\
| string replace -r '^sha256sums_armv7h=\("\K\w+' $armv7h\
| string replace -r '^sha256sums_aarch64=\("\K\w+' $aarch64 > PKGBUILD.new
mv PKGBUILD.new PKGBUILD
if not git diff --quiet PKGBUILD
    makepkg --printsrcinfo > .SRCINFO
    git add PKGBUILD .SRCINFO
    git commit -m "bump: $_pkgver"
else
    echo "No update"
end
