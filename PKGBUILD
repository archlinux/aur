# Maintainer: Kalashnikov I.V <ivankalashnikov@outlook.com>

pkgname=emergent
pkgver=8.2.0
pkgrel=1
pkgdesc="emergent is a comprehensive neural network simulator that enables the creation and analysis of complex, sophisticated models of the brain in the world"
arch=('i686' 'x86_64')
url="https://grey.colorado.edu/emergent"
license=('GPL')
depends=('qt5-base' 'cmake' 'subversion' 'libsndfile' 'coin')
source=("git+https://github.com/emer/cemer")
md5sums=('79fde976b2c89590fb78854aa2c04101')

build() {
  cd "$srcdir/emergent-$pkgver"
  ./configure --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib --qt5
  make -j4
}

package() {
  cd "$srcdir/iv-$pkgver"
  install -Dm644 Copyright "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  make DESTDIR="$pkgdir/" install
}
md5sums=('13b3c76dae57051d7764de18dbd46f6a')

md5sums=('9b578caca83e375020c485d9a2e06af1')
md5sums=('9b578caca83e375020c485d9a2e06af1')
md5sums=('9b578caca83e375020c485d9a2e06af1')
md5sums=('9b578caca83e375020c485d9a2e06af1')
md5sums=('9b578caca83e375020c485d9a2e06af1')
md5sums=('9b578caca83e375020c485d9a2e06af1')
