# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=libntlm
pkgver=1.4
pkgrel=1
pkgdesc="Libntlm: rewritten of original libntlm"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/libntlm/"
license=('GPL')
depends=()
source=(http://www.nongnu.org/libntlm/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('8415d75e31d3135dc7062787eaf4119b984d50f86f0d004b964cdc18a3182589')


build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
