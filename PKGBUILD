# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal
pkgver=1.7
pkgrel=1
pkgdesc="Byte CALculator for storage conversions and calculations."
arch=("x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("https://github.com/jarun/bcal/archive/v${pkgver//_/-}.tar.gz")
md5sums=('ec28d56c935a3c0c3180ae40e6b62c58')
conflicts=('bcal-git')
provides=('bcal')

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
