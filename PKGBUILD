# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=bcal
pkgver=1.8
pkgrel=1
pkgdesc="Storage conversion and expression calculator"
arch=("i686" "x86_64")
url="https://github.com/jarun/bcal"
license=('GPL3')
source=("https://github.com/jarun/bcal/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('2bdf9057456e30e97ace3becbdbf7642bbc1689668e8aaad2ef6bfe9c4de9603')
conflicts=('bcal-git')
provides=('bcal')

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install > /dev/null
}
