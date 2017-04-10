# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal
pkgver=1.5
pkgrel=1
pkgdesc="Byte CALculator. The engineer's utility for storage conversions and calculations."
arch=("x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("https://github.com/jarun/bcal/archive/v${pkgver//_/-}.tar.gz")
md5sums=('8c107c15265fadbe21761bd9a9a19911')
conflicts=('bcal-git')
provides=('bcal')

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
