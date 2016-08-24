# Maintainer: Joshua Merrell <joshuamerrell@gmail.com>
pkgname=minisphere
pkgver=4.1.1
pkgrel=2
pkgdesc="A fast, lightweight implementation of the Sphere game engine"
arch=('i686' 'x86_64')
url="https://github.com/fatcerberus/minisphere"
license=('BSD')
depends=('allegro' 'libmng')
source=('https://github.com/fatcerberus/$pkgname/archive/v$pkgver.tar.gz')
sha256sum=('9dba81d5df2887ea853f2366dd12e116ee55128215094d3117d3b5f048ea35f2')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
