# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=minisphere
pkgver=4.4.0
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('i686' 'x86_64')
url="https://github.com/fatcerberus/minisphere"
license=('BSD')
depends=('allegro5-git' 'libmng')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('d0b9bd99af057dec41275806db7d531a14ff7cd6b8c4d2c6ffed95b07c0319b8')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
