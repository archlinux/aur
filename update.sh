#! /bin/sh

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
echo "# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

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
source=(
    ${EXECUTABLE_NAME}.environmentfile
    https://raw.githubusercontent.com/deluan/navidrome/v$1/contrib/${EXECUTABLE_NAME}.service
    ${EXECUTABLE_NAME}.sysusers
    ${EXECUTABLE_NAME}.tmpfiles
)
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v$1/navidrome_$1_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v$1/navidrome_$1_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v$1/navidrome_$1_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v$1/navidrome_$1_Linux_arm64.tar.gz')
md5sums=()
md5sums_x86_64=()
md5sums_armv6h=()
md5sums_armv7h=()
md5sums_aarch64=()

package() {
  install -Dm755 \"\$srcdir/navidrome\" \"\$pkgdir/usr/bin/${EXECUTABLE_NAME}\"

  install -Dm644 \"\${srcdir}/${EXECUTABLE_NAME}.environmentfile\" \"\${pkgdir}/etc/sysconfig/${EXECUTABLE_NAME}\"
  install -Dm644 \"\${srcdir}/${EXECUTABLE_NAME}.service\" \"\${pkgdir}/usr/lib/systemd/system/${EXECUTABLE_NAME}.service\"
  install -Dm644 \"\${srcdir}/${EXECUTABLE_NAME}.sysusers\" \"\${pkgdir}/usr/lib/sysusers.d/${EXECUTABLE_NAME}.conf\"
  install -Dm644 \"\${srcdir}/${EXECUTABLE_NAME}.tmpfiles\" \"\${pkgdir}/usr/lib/tmpfiles.d/${EXECUTABLE_NAME}.conf\"
}
" >> PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Test
makepkg -f
