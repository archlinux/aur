# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal
pkgver=1.6
pkgrel=1
pkgdesc="Byte CALculator. The engineer's utility for storage conversions and calculations."
arch=("x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("https://github.com/jarun/bcal/archive/v${pkgver//_/-}.tar.gz")
md5sums=('a19de8d329a2b34a5ff3f3cfaa8c6a19')
conflicts=('bcal-git')
provides=('bcal')

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
