# Maintainer: Leon Schumacher <leonsch@protonmail.com>
pkgname=yell
pkgver=2
pkgrel=1
pkgdesc="A TCP message broadcaster"
arch=('x86_64')
url="https://github.com/42LoCo42/yell"
license=('AGPL3')
makedepends=('zig')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('232912afaa46c0306e395cba587d2514db85c8b15a348da5a094c445ef21a73b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -D yell "$pkgdir/usr/bin/yell"
}
