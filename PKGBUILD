# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=spipgm-bin
pkgver=2.29
pkgrel=1
pkgdesc="Tool for programming serial SPI FlashROM memories attached to PC via parallel port cable"
arch=('i686' 'x86_64')
makedepends=('unzip')
url="http://rayer.g6.cz/programm/programe.htm"
license=('unknown')
source=("http://rayer.g6.cz/programm/spipgm.zip")
md5sums=('8a121449041cc0a1a57a47ae0ac11290')
options=(!strip)

package() {
    install -Dm755 ${srcdir}/SPIPGM/SPIPGM ${pkgdir}/usr/bin/spipgm
    install -Dm755 ${srcdir}/SPIPGM/SPIPGM64 ${pkgdir}/usr/bin/spipgm64
}
