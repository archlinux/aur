# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal
pkgver=1.1
pkgrel=0
pkgdesc="Byte CALculator. The engineer's utility for storage conversions and calculations."
arch=("i686" "x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("https://github.com/jarun/bcal/archive/v${pkgver//_/-}.tar.gz")
md5sums=('17e712057d9ee202cb4f538903c82110')

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
