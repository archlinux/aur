# Maintainer: eNV25 <env252525@gmail.com>

pkgname=tetris
pkgver=7.1.0
pkgrel=1
pkgdesc="Linux port of the OpenBSD version"
arch=(x86_64)
url="https://github.com/eNV25/tetris"
license=('BSD')
depends=('ncurses' 'libbsd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

# sums
sha256sums=('956ac2c613ec381f7a077f6b0897ec04465269644b8c338cce7e92fdc205071a')
