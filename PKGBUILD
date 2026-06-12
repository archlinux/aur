# Maintainer: eNV25 <env252525@gmail.com>

pkgname=tetris
pkgver=7.9.0
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
sha256sums=('dcf9b0b5c102aece28e509c393600f1f1d060b709069c3d8bf6baac443fc8f4e')
