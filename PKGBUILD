# Contributor: grimi

pkgname=amigadepacker
pkgver=0.04
pkgrel=2
pkgdesc="Tool for depacking some compressed Amiga formats"
arch=('i686' 'x86_64')
url="https://zakalwe.fi/~shd/foss/amigadepacker"
license=('GPL')
depends=('glibc')
source=(https://zakalwe.fi/~shd/foss/amigadepacker/$pkgname-$pkgver.tar.bz2)
sha256sums=('bda2119919ada6310854e4486f8cb3ffc1722163747a5e176ef55e8807b7766f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --package-prefix="$pkgdir"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}

