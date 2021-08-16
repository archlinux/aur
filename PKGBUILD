# Maintainer: Leon Schumacher <leonsch@protonmail.com>
pkgname=yell
pkgver=1
pkgrel=1
pkgdesc="A TCP message broadcaster"
arch=('x86_64')
url="https://github.com/42LoCo42/yell"
license=('AGPL3')
makedepends=('zig')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('75389e6c03135c54a9a0df4fcd70a9df59f62b6f01f823f56764c74a059ce182')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -D yell "$pkgdir/usr/bin/yell"
}
