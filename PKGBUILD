# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=yabar
pkgver=0.2.3
pkgrel=1
pkgdesc="Modern and lightweight status bar for X window managers"
arch=('i686' 'x86_64')
url="https://github.com/geommer/yabar"
license=('MIT')
depends=('pango' 'libconfig')
source=($pkgname-$pkgver.tar.gz::https://github.com/geommer/yabar/archive/$pkgver.tar.gz)
md5sums=('17488c341ddfb6bc9359f0feb63f7644')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
