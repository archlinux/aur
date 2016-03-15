# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=yabar
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern and lightweight status bar for X window managers"
arch=('i686' 'x86_64')
url="https://github.com/geommer/yabar"
license=('unknown')
depends=('pango' 'libconfig')
provides=()
conflicts=()
source=($pkgname-$pkgver.tar.gz::https://github.com/geommer/yabar/archive/$pkgver.tar.gz)
md5sums=('b05be823ad9670cf9657120022eba1e4')

build() {
	cd $pkgname-$pkgver

	make
}

package() {
	cd $pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
