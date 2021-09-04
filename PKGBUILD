# Maintainer: Leon Schumacher <leonsch@protonmail.com>
pkgname=weighted-choice
pkgver=1
pkgrel=2
pkgdesc="A simple tool that selects from a weighted set of indices"
arch=('x86_64')
url="https://github.com/42LoCo42/weighted-choice"
license=('GPL3')
makedepends=('zig')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1759f2409779a5fbd66fe2c930a2479af5c1a6b851bc10f7bd74eb92596f6f94')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
