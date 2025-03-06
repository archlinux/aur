# Maintainer: Shi Yanling <sylphenix@outlook.com>

pkgname=sff
pkgver=0.9
pkgrel=1
pkgdesc="Simple and fast terminal file manager"
arch=('x86_64')
license=('BSD')
url="https://codeberg.org/sylphenix/sff"
depends=('ncurses' 'file' 'glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd ${pkgname}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}
  make install DESTDIR="${pkgdir}" PREFIX=/usr
}
