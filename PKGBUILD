# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=libntlm
pkgver=1.8
pkgrel=1
pkgdesc="Libntlm: rewritten of original libntlm"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/libntlm/"
license=('GPL')
depends=()
source=("https://download.savannah.nongnu.org/releases/libntlm/libntlm-${pkgver}.tar.gz")
sha256sums=('ce6569a47a21173ba69c990965f73eb82d9a093eb871f935ab64ee13df47fda1')


build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
