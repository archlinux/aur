pkgname=bviplus
pkgver=0.9.4
pkgrel=1
pkgdesc="Bviplus is an ncurses based hex editor with a vim-like interface."
arch=(i686 x86_64)
url="http://bviplus.sourceforge.net/"
license=("GPLv3")
depends=("ncurses")
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz)
md5sums=('b814929c439d2ec75cec2597540003e7')
build() {
  cd $srcdir/${pkgname}-${pkgver}
  make PREFIX=/usr
}
package() {
  cd $srcdir/${pkgname}-${pkgver}
  make PREFIX=${pkgdir}/usr install
}
