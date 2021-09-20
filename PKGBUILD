# Maintainer: Leon Schumacher <leonsch@protonmail.com>
pkgname=yell
pkgver=3
pkgrel=1
pkgdesc="A TCP message broadcaster"
arch=('x86_64')
url="https://github.com/42LoCo42/yell"
license=('AGPL3')
makedepends=('zig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e81be873eda0151992b538893e04671617e813a34f22eaf2394d07a19ba0dbb')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -D yell "$pkgdir/usr/bin/yell"
}
