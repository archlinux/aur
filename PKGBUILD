# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=libtwebservices
pkgver=0.1
pkgrel=1
pkgdesc="Common libraries for the- apps to communicate with web APIs"
arch=("x86_64")
url="https://github.com/vicr123/libtwebservices"
license=('GPL3')
depends=('the-libs' 'qt5-base')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/libtwebservices/archive/v0.1.tar.gz")
sha256sums=('de7802ad57db37fbbffbefe55559b8888294ac5f5fc9774290a56c0a2409a5c9')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
