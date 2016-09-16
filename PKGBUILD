# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=minisphere
pkgver=4.2.0
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('i686' 'x86_64')
url="https://github.com/fatcerberus/minisphere"
license=('BSD')
depends=('allegro' 'libmng')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('33fd7f65341b3194d941050dfd7113ff10a30d4fc7e5e8c195ea6db3ca76f405')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
