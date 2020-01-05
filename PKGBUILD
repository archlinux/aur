# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=minisphere
pkgver=5.4.1
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('i686' 'x86_64')
url="https://github.com/fatcerberus/minisphere"
license=('BSD')
depends=('allegro' 'libmng' 'libChakraCore.so')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('SKIP')

build() {
  cd miniSphere-$pkgver
  make
}

package() {
  cd "miniSphere-$pkgver"
  make DESTDIR="$pkgdir" install
}
