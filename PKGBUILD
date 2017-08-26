# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sawfish-session-dialog
_pkgname=ssd
pkgver=0.41
pkgrel=2
pkgdesc="A graphical Sawfish extension to edit the session preferences"
url="http://download.tuxfamily.org/sawfish/Extras"
arch=('any')
license=('GPL3')
depends=('sawfish')
source=("http://download.tuxfamily.org/sawfish/Extras/${_pkgname}_${pkgver}.tar.xz")
sha1sums=('2ca2f17b61fbbf73c8fa177bb1453b0a04a4b9dd')

build() {
  cd "$srcdir"/${_pkgname}_${pkgver}
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir"/${_pkgname}_${pkgver}
  make DESTDIR=$pkgdir install
}
