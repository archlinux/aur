# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal
pkgver=2.1
pkgrel=1
pkgdesc="Storage conversion and expression calculator"
arch=("i686" "x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("https://github.com/jarun/bcal/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('c0b6cb911a773abdd555e6a9e0eb8a25934ceca038156e6250e117fa451beaa6')
conflicts=('bcal-git')
provides=('bcal')

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install > /dev/null
}
