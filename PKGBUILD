# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=gmetadom
pkgver=0.2.6
pkgrel=1
pkgdesc="DOM level2 library for accessing XML files"
arch=('any')
url="http://gmetadom.sourceforge.net/"
license=(LGPL)
depends=()
makedepends=()
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz/download")
sha512sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-debug=no
  make
}

package() {
  DESTDIR="$pkgdir" make install
}
