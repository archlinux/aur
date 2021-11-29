# Maintainer: eNV25 <env252525@gmail.com>

pkgname=tetris
pkgver=7.0.1
pkgrel=1
pkgdesc="Port of OpenBSD tetris for Linux."
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
sha256sums=('082332980179a1e129dab33ba3c62ad0890469f65494ae64fe4a1c93b81b36ff')
