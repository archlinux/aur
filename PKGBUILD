# Maintainer: Charles L <charliehogger31@gmail.com>

pkgname=tinyvm
pkgver=1.0
pkgrel=1
pkgdesc="A tiny ANSI C VM"
arch=('x86_64')
url="https://github.com/jakogut/tinyvm"
license=('MIT')
source=("https://github.com/jakogut/tinyvm/archive/v${pkgver}.tar.gz")
md5sums=("904749aed050703a6996909869074597")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp ./tinyvm "$pkgdir/usr/bin/"
}
