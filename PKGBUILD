# Maintainer: Frolleks <frolleks@hotmail.com>
pkgname=sfetch
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple system fetch CLI tool written in Shell"
arch=(any)
url="https://github.com/Frolleks/sfetch"
license=('ISC')
source=("https://github.com/Frolleks/sfetch/archive/v1.2.1.tar.gz")
md5sums=('SKIP')
sha256sums=('64ff502ab4b5a84c59be28eb73801f631e3004f5b2c00a9dff858319c4d08a09')
validpgpkeys=(AAF8BD286F970B69)

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	sudo make install
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
