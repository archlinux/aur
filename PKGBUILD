# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal
pkgver=1.4
pkgrel=0
pkgdesc="Byte CALculator. The engineer's utility for storage conversions and calculations."
arch=("i686" "x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("https://github.com/jarun/bcal/archive/v${pkgver//_/-}.tar.gz")
md5sums=('fc2833f3176e64d3dffa03b76c3985e0')
conflicts=('bcal-git')
provides=('bcal')

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
