# Maintainer: Valsu [arch(at)hylia.de]

pkgname=adonthell-wastesedge
pkgver=0.3.5
pkgrel=1
pkgdesc="Official demo game for the Adonthell RPG engine"
url="http://adonthell.nongnu.org/"
arch=('any')
license=('GPL2')
depends=('adonthell>=0.3.3')
makedepends=()
source=("http://download.savannah.gnu.org/releases/adonthell/wastesedge-src-${pkgver}.tar.gz")
md5sums=('6573ea42b47cba377a8ecc33db6b5866')

build() {
  cd "${srcdir}/wastesedge-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/wastesedge-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
