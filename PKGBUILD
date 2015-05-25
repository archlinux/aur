# Maintainer: Michał Szymański <smiszym at gmail dot com>
# Contributor: Felix Hanley <felix@seconddrawer.com.au>

pkgname=boolstuff
pkgver=0.1.15
pkgrel=1
pkgdesc="A C++ library that supports a few operations on boolean expression binary trees"
arch=('i686' 'x86_64')
url="http://perso.b2b2c.ca/sarrazip/dev/boolstuff.html"
license=('GPL')
depends=('gcc-libs')
source=(http://perso.b2b2c.ca/sarrazip/dev/$pkgname-$pkgver.tar.gz)
md5sums=('fc8397d732f696d9f5e371bab2fb2c14')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --localstatedir=/var
  make
}

package() {
  cd $pkgname-$pkgver
  make prefix=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
