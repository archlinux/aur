# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=yabar
pkgver=0.1.0
pkgrel=2
pkgdesc="Modern and lightweight status bar for X window managers"
arch=('i686' 'x86_64')
url="https://github.com/geommer/yabar"
license=('unknown')
depends=('pango' 'libconfig')
source=($pkgname-$pkgver.tar.gz::https://github.com/geommer/yabar/archive/$pkgver.tar.gz)
md5sums=('d84c0e9107f9f3f7099efaf5ff14223d')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
