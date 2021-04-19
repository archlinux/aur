#! /bin/sh

set -xe

AUR_NAME=navidrome-bin
EXECUTABLE_NAME=navidrome
DESCRIPTION="Music Server and Streamer compatible with Subsonic/Airsonic"
URL=https://www.navidrome.org/
LICENSE='GPL3'
ADDITIONAL=

if [[ $# == 0 ]]; then
    echo 'Usage: ./update.sh VERSION_NUMBER'
    exit 1
fi
pkgrel=1
if [[ $# == 2 ]]; then
    pkgrel=$2
fi

printf '' > PKGBUILD
echo "# Maintainer: Sitansh Rajput <thelostpolaris [at] gmail [dot] com>

pkgbase='${AUR_NAME}'
pkgname=(${AUR_NAME})
pkgver='$1'
pkgrel=$pkgrel
pkgdesc='${DESCRIPTION}'
url='${URL}'
license=('${LICENSE}')
arch=(x86_64 armv6h armv7h aarch64)
provides=('${EXECUTABLE_NAME}')
conflicts=('${EXECUTABLE_NAME}')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v$1/navidrome_$1_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v$1/navidrome_$1_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v$1/navidrome_$1_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v$1/navidrome_$1_Linux_arm64.tar.gz')
md5sums=()
md5sums_x86_64=()
md5sums_armv6h=()
md5sums_armv7h=()
md5sums_aarch64=()

package() {
  install -Dm755 \"\$srcdir/navidrome\" \"\$pkgdir/usr/bin/${EXECUTABLE_NAME}\"
}
" >> PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Test
makepkg -f
