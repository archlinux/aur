pkgname=scantool
pkgver=2.0
pkgrel=1
pkgdesc="OBD-II vehicle diagnostic scanner"
arch=('i686' 'x86_64')
url="https://github.com/kees/scantool"
license=('GPL')
makedepends=('dos2unix')
depends=('allegro4')
source=("https://github.com/kees/scantool/archive/v2.0.tar.gz")
sha256sums=('b47d5a5f02bda5d2102292e23b0e31178046689fbd651239faddac61c29caf45')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package () {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
