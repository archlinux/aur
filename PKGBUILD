# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=bcal
pkgver=2.4
pkgrel=1
pkgdesc="Storage conversion and expression calculator"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jarun/bcal/archive/v${pkgver//_/-}.tar.gz")
depends=('readline' 'bc')
sha256sums=('141f39d866f62274b2262164baaac6202f60749862c84c2e6ed231f6d03ee8df')

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
