# Maintainer: Shen Miren <dickeny@gmail.com>
# Contributer: Kan-Ru Chen <kanru@kanru.info>
pkgname=cconv
pkgver=0.6.2
pkgrel=1
pkgdesc="A iconv based simplified-traditional chinese conversion tool"
arch=('i686' 'x86_64')
url="http://code.google.com/p/cconv/"
license=('GPL')
depends=(glibc)
options=(!libtool)
source=(http://cconv.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha1sums=('9775f91fd5600d176552a88625aaa1f64ece09c1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

