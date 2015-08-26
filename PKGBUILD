# Maintainer: Ilja Kartaschoff <ik@lowenware.com>
pkgname=webstuff
pkgver=1.0.2
pkgrel=1
pkgdesc="Lightweight C Library for web-applications development"
arch=('any')
url="http://www.lowenware.com/"
license=('BSD')
source=(http://www.lowenware.com/download/webstuff/$pkgname-$pkgver.tar.gz)
md5sums=('c6a05c13444c12e54839e1970d583c3e')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --with-all
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
