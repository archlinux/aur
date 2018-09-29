
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thecalculator
pkgver=2.0
pkgrel=0
pkgdesc="Calculator"
arch=("x86_64")
url="https://github.com/vicr123/thecalculator"
license=('GPL3')
depends=('qt5-base' 'the-libs')
makedepends=('git' 'bison' 'flex' 'qt5-tools')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/thecalculator#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
