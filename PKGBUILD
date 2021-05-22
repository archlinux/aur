# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=spipgm-bin
pkgver=2.32
pkgrel=1
pkgdesc="Tool for programming serial SPI FlashROM memories attached to PC via parallel port cable"
arch=('i686' 'x86_64')
makedepends=('unzip')
url="http://rayer.g6.cz/programm/programe.htm"
license=('unknown')
source=("http://rayer.g6.cz/programm/spipgm.zip")
sha256sums=('5737ee547d75dd3ee6d4c39e84f7b9af10238abc6a1594c8c9aa9373c737736e')
options=(!strip)

package() {
    install -Dm755 ${srcdir}/SPIPGM/SPIPGM ${pkgdir}/usr/bin/spipgm
    install -Dm755 ${srcdir}/SPIPGM/SPIPGM64 ${pkgdir}/usr/bin/spipgm64
}
