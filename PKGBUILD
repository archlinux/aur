# Contributor: grimi <grimi@poczta.fm>

pkgname=amigadepacker
pkgver=0.04
pkgrel=1
pkgdesc="Tool for depacking some compressed Amiga formats"
arch=('i686' 'x86_64')
url="http://zakalwe.fi/~shd/foss/amigadepacker"
license=('GPL')
depends=('glibc')
source=(http://zakalwe.fi/~shd/foss/amigadepacker/$pkgname-$pkgver.tar.bz2)
md5sums=('06cbd36d5faf006c810a1bd978968bb5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --package-prefix="$pkgdir"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}

