# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=libntlm
pkgver=1.5
pkgrel=1
pkgdesc="Libntlm: rewritten of original libntlm"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/libntlm/"
license=('GPL')
depends=()
source=(http://www.nongnu.org/libntlm/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('53d799f696a93b01fe877ccdef2326ed990c0b9f66e380bceaf7bd9cdcd99bbd')


build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
