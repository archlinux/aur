pkgname=or1ksim-git
pkgver=20150224
pkgrel=1
pkgdesc="OpenRISC simulator"
arch=(i686 x86_64)
#url="http://opencores.org/openrisc,or1ksim"
url="https://github.com/openrisc/or1ksim"
license=('GPL')
depends=()
makedepends=('git')
source=(git://github.com/openrisc/or1ksim)
md5sums=('SKIP')

build() {
  cd "$srcdir/or1ksim"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/or1ksim"
  make DESTDIR="$pkgdir/" install
}
