# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=spipgm-bin
pkgver=2.36
pkgrel=1
pkgdesc="Tool for programming serial SPI FlashROM memories attached to PC via parallel port cable"
arch=(i686 x86_64)
makedepends=(unzip)
license=(unknown)
url="http://rayer.g6.cz/programm/programe.htm"
conflicts=(spipgm)
provides=(spipgm)
source=("http://rayer.g6.cz/programm/spipgm.zip")
sha256sums=('542889a8a0de8a13642c6971caef712fe80dbf1743024739ebb3eaca303226b8')
options=(!strip)

package() {
  install -Dm755 ${srcdir}/SPIPGM/SPIPGM ${pkgdir}/usr/bin/spipgm
  install -Dm755 ${srcdir}/SPIPGM/SPIPGM64 ${pkgdir}/usr/bin/spipgm64
}
