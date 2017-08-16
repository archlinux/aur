# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=minisphere
pkgver=4.8.1
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('i686' 'x86_64')
url="https://github.com/fatcerberus/minisphere"
license=('BSD')
depends=('allegro5-git' 'libmng')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('4ee89e104cf77b70069d158156ae5fe1f8051fc109322f1eb6a5ecb40a1117b0')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
