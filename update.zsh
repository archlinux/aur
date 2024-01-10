#!/usr/bin/zsh

# get latest release
latest_release=$(curl -I -sss https://github.com/simulot/immich-go/releases/latest/ | awk '$1=="location:" {print $2}' | tr -d '[:space:]')
checksum_url="${latest_release:gs/tag/download}/checksums.txt"

# get version
version=$(sed 's|https://github.com/simulot/immich-go/releases/tag/||g' <<< "${latest_release}")

# get checksums
checksums=$(curl -L -sss ${checksum_url})

linux_arm64_checksum=$(awk '$2~/.*Linux_arm64.*/ {print $1}' <<< "${checksums}")
linux_x86_64_checksum=$(awk '$2~/.*Linux_x86_64.*/ {print $1}' <<< "${checksums}")

curversion=$(awk -F '=' '$1=="pkgver" {print $2}' PKGBUILD)

pkgrel="1"
if [ "${version}" = "${curversion}" ]
then
    curpkgrel=$(awk -F '=' '$1=="pkgrel" {print $2}' PKGBUILD)
    newpkgrel=$((${curpkgrel}+1))
    pkgrel="${newpkgrel}"
fi

perl -p -i -e "s/pkgver=.*/pkgver=${version}/; s/pkgrel=.*/pkgrel=${pkgrel}/; s/sha256sums_x86_64=\(\'.*\'\)/sha256sums_x86_64=(\'${linux_x86_64_checksum}\')/; s/sha256sums_aarch64=\(\'.*\'\)/sha256sums_aarch64=(\'${linux_arm64_checksum}\')/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO