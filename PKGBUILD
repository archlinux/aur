# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmsun
pkgver=1.05
pkgrel=1
pkgdesc="Rise/set time of Sun dockapp for Window Maker"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmsun"
license=('GPL')
depends=('libdockapp')
source=("http://www.dockapps.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('a943c631c98f56c65c03bee38c0e8227')

build() {
  cd dockapps-a1e67bd
  make PREFIX=/usr
}

package() {
  cd dockapps-a1e67bd
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
