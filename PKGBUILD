# Maintainer: Félicien PILLOT <felicien.pillot@member.fsf.org>
pkgname=fisoco
pkgver=0.8.4
pkgrel=0
pkgdesc="FInd, Sort, Order and COnvert your files with a free software"
url="http://fisoco.nongnu.org"
arch=('x86_64')
license=('GPL3')
makedepends=('intltool')
source=("http://download.savannah.gnu.org/releases/fisoco/source/${pkgname}-${pkgver}.tar.gz")
md5sums=('5870bff0d7f6115f44188157852fa6e8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
