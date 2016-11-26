# Maintainer:  <clu>

pkgname=sextractor-bin  
_pkgname=sextractor
pkgver=2.19.5
pkgrel=2
pkgdesc="builds a catalogue of objects from an astronomical image"
url="http://www.astromatic.net/software/sextractor"
arch=('x86_64')
license=('GPL')
depends=()
makedepends=()
provides=('sextracator')
conflicts=('sextractor')
replaces=('sextractor')
backup=()
source=(http://www.astromatic.net/download/sextractor/sextractor-${pkgver}-1.${arch}.rpm)
sha1sums=('9992b239f2ff9c801ff81b1e830fe1244a3da216')

build() {
  cd $srcdir
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/doc/sextractor-${pkgver}
  mkdir -p ${pkgdir}/usr/share/man/man1
  mkdir -p ${pkgdir}/usr/share/man/manx
  mkdir -p ${pkgdir}/usr/share/sextractor

  install -Dm755 usr/bin/* ${pkgdir}/usr/bin
  install -Dm644 usr/share/doc/sextractor-${pkgver}/* ${pkgdir}/usr/share/doc/sextractor-${pkgver}
  install -Dm644 usr/share/man/man1/* ${pkgdir}/usr/share/man/man1
  install -Dm644 usr/share/man/manx/* ${pkgdir}/usr/share/man/manx
  install -Dm644 usr/share/sextractor/* ${pkgdir}/usr/share/sextractor
}
