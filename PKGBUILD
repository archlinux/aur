
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thecalculator
pkgver=2.2
pkgrel=0
pkgdesc="Calculator"
arch=("x86_64")
url="https://github.com/vicr123/thecalculator"
license=('GPL3')
depends=('qt5-base' 'the-libs')
makedepends=('bison' 'flex' 'qt5-tools')
source=("$pkgname-$pkgver"::'https://github.com/vicr123/thecalculator/archive/v2.2.tar.gz')
sha256sums=('913ff3ae453dda137205d89cf6a334a224745a5f2961402afabbf0bec5df4678')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
