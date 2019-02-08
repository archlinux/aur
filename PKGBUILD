# Maintainer: ouzu <ouzu att laze dott pw>
pkgname=hbs
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A command line utility that searches for files, and tells you how big it all is."
arch=("any")
url="https://github.com/LovesToCode/hbs-How-Big-Search"
license=('GPL')
makedepends=("gcc" "make")
provides=("hbs")
conflicts=("hbs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LovesToCode/hbs-How-Big-Search/archive/v$pkgver.tar.gz")
noextract=()
md5sums=("e82d63e4971406f7ceb093d56b0dc7e4")

build() {
	cd "$pkgname-How-Big-Search-$pkgver"
	make
}

package() {
	cd "$pkgname-How-Big-Search-$pkgver"
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	mv $pkgname $pkgdir/usr/bin/
}
