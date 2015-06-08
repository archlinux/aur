# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sawfish-session-dialog
_pkgname=ssd
pkgver=0.41
pkgrel=1
pkgdesc="A graphical Sawfish extension to edit the session preferences"
url="http://download.tuxfamily.org/sawfish/Extras"
arch=('any')
license=('GPL3')
depends=('sawfish')
source=("http://download.tuxfamily.org/sawfish/Extras/${_pkgname}_${pkgver}.tar.bz2")
sha1sums=('ac24215774bf4347bc2ef80fba91a82aaf3409a3')

build() {
  cd "$srcdir"/${_pkgname}_${pkgver}
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir"/${_pkgname}_${pkgver}
  make DESTDIR=$pkgdir install
}
