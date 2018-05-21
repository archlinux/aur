# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal
pkgver=1.9
pkgrel=1
pkgdesc="Storage conversion and expression calculator"
arch=("i686" "x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("https://github.com/jarun/bcal/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('5d075deaef087680ea4c153ed5f0696f8be149a59ce0e5aaeb3f5b1180b2ec81')
conflicts=('bcal-git')
provides=('bcal')

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install > /dev/null
}
