# Maintainer: Félicien PILLOT <felicien.pillot@member.fsf.org>
pkgname=fisoco
pkgver=0.8.3
pkgrel=0
pkgdesc="FInd, Sort, Order and COnvert your files with a free software"
url="http://fisoco.nongnu.org"
arch=('x86_64')
license=('GPL3')
depends=('')
makedepends=('intltool')
source=("http://download.savannah.gnu.org/releases/fisoco/source/${pkgname}-${pkgver}.tar.gz")
md5sums=('bf688430b04ee0f8add992bf11cd80d2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

