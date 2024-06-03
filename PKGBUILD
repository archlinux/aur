# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=spipgm-bin
pkgver=2.34
pkgrel=1
pkgdesc="Tool for programming serial SPI FlashROM memories attached to PC via parallel port cable"
arch=(i686 x86_64)
makedepends=(unzip)
url="http://rayer.g6.cz/programm/programe.htm"
license=(unknown)
source=("http://rayer.g6.cz/programm/spipgm.zip")
sha256sums=('5bcc55db98d677b9aa1b891c9a197b7f459b2a9c2364332d07a3aeca7cbd24f7')
options=(!strip)

package() {
  install -Dm755 ${srcdir}/SPIPGM/SPIPGM ${pkgdir}/usr/bin/spipgm
  install -Dm755 ${srcdir}/SPIPGM/SPIPGM64 ${pkgdir}/usr/bin/spipgm64
}
