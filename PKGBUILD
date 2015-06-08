# $Id$
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=4ti2
pkgver=1.6.5
pkgrel=1
pkgdesc="A software package for algebraic, geometric and combinatorial problems on linear spaces"
arch=('i686' 'x86_64')
url="http://www.4ti2.de/"
license=('GPL')
depends=('glpk' 'gmp')
source=("http://www.4ti2.de/version_$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('289d50cf7932488adc24c9c308bbafcf')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}

