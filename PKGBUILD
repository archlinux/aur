# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=slsnif
pkgver=0.4.4
pkgrel=1
pkgdesc="A serial port logging utility."
arch=(i686 x86_64)
license=(GPL2)
url=https://sourceforge.net/projects/slsnif/
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=(78eeff8ba36ee0c3a954ec0878d2a997)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
