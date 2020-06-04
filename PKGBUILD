# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=libntlm
pkgver=1.6
pkgrel=1
pkgdesc="Libntlm: rewritten of original libntlm"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/libntlm/"
license=('GPL')
depends=()
source=(http://www.nongnu.org/libntlm/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f2376b87b06d8755aa3498bb1226083fdb1d2cf4460c3982b05a9aa0b51d6821')


build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
