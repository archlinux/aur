# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname=zimpl
pkgver=3.3.3
pkgrel=1
pkgdesc="Mathematical modelling language for LP and MIP"
arch=(i686 x86_64)
url="http://zimpl.zib.de/"
license=('GPL')
depends=(gmp zlib)
makedepends=()
optdepends=(glpk)
source=(http://zimpl.zib.de/download/$pkgname-$pkgver.tgz)
md5sums=('394127e96024098b0ec723e5ce65f9da')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  cp bin/$pkgname $pkgdir/usr/bin/$pkgname
}
