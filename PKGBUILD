# Maintainer: grimi <grimi at poczta dot fm>

pkgname=uade
pkgver=3.02
pkgrel=3
pkgdesc="Unix Amiga Delitracker Emulator"
arch=('i686' 'x86_64')
url="https://zakalwe.fi/uade"
license=('GPL')
depends=('libao' 'fuse2' 'bencodetools')
install=uade.install
source=("https://zakalwe.fi/uade/uade3/$pkgname-$pkgver.tar.bz2")
md5sums=('57cb58c3da91c1fb2d391966c44d5739')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --package-prefix="$pkgdir"
  make
}

package() {
  cd $pkgname-$pkgver
  make install
}

