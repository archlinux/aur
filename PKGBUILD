# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=spipgm-bin
pkgver=2.35
pkgrel=1
pkgdesc="Tool for programming serial SPI FlashROM memories attached to PC via parallel port cable"
arch=(i686 x86_64)
makedepends=(unzip)
license=(unknown)
url="http://rayer.g6.cz/programm/programe.htm"
conflicts=(spipgm)
provides=(spipgm)
source=("http://rayer.g6.cz/programm/spipgm.zip")
sha256sums=('ec822c93407066dd38d2789cf0cd458ca64984942a99f77f962ba123636d258f')
options=(!strip)

package() {
  install -Dm755 ${srcdir}/SPIPGM/SPIPGM ${pkgdir}/usr/bin/spipgm
  install -Dm755 ${srcdir}/SPIPGM/SPIPGM64 ${pkgdir}/usr/bin/spipgm64
}
