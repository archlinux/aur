# Maintainer: Theo <theo0x0 at outlook dot com>

pkgname=mkfsufs
pkgver=1.0
pkgrel=1
pkgdesc="Utility to format a UFS partition"
license=("MIT")
source=("https://github.com/theo0x0/mkfsufs/archive/refs/tags/$pkgver.tar.gz")
arch=("any")
sha256sums=("SKIP")
build () {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
