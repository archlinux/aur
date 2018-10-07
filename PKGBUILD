# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal
pkgver=2.0
pkgrel=1
pkgdesc="Storage conversion and expression calculator"
arch=("i686" "x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("https://github.com/jarun/bcal/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('7120b25a74b2bec99d75238c235e440f5338d53ad64a4cfe4d05e65814ac91d2')
conflicts=('bcal-git')
provides=('bcal')

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install > /dev/null
}
