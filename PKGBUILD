# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=swfdec-mozilla-xembed
pkgver=0.9.2
pkgrel=3
pkgdesc="Simplified version of swfdec-mozilla that works in Chromium"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=("swfdec>=$pkgver")
makedepends=("nspr")
source=($pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('7920725656db8c3b1ee713300586724c')
