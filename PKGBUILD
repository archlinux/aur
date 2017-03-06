# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=minisphere
pkgver=4.5.4
pkgrel=1
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('i686' 'x86_64')
url="https://github.com/fatcerberus/minisphere"
license=('BSD')
depends=('allegro5-git' 'libmng')
source=(https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('f7775cb1fa28de7de0984e9dab9df178d10dcce752f9cce4a208c1a6825aaf8c')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
