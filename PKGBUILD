# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=minisphere
pkgver=5.6.3
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('i686' 'x86_64')
url="https://github.com/fatcerberus/sphere"
license=('BSD')
depends=('allegro' 'libmng' 'libChakraCore.so')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('09b573552ed7f1410e432043ed75f75aa6909486ed5cadc8d5799dc1dac9a85e')

build() {
  cd sphere-$pkgver
  make
}

package() {
  cd "sphere-$pkgver"
  make DESTDIR="$pkgdir" install
}
