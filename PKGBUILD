# Maintainer: Majenko <matt@majenko.co.uk>
pkgname=tt2bin-git
pkgver=1.0
pkgrel=1
pkgdesc="Truth Table to Binary converter"
arch=('any')
url=https://github.com/MajenkoProjects/tt2bin
license=('BSD')

source=("git+https://github.com/MajenkoProjects/tt2bin.git")
cksums=(SKIP)

build() {
	cd "tt2bin"
	make
}

package() {
	cd "tt2bin"
	mkdir -p "$pkgdir/usr/bin/"
	install -m 755 tt2bin "$pkgdir/usr/bin/"
}
