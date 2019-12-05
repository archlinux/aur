
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=libtdesktopenvironment
pkgver=1.0
pkgrel=0
pkgdesc="Common libraries for desktop integration for the- apps"
arch=("x86_64")
url="https://github.com/vicr123/libtdesktopenvironment"
license=('GPL3')
depends=('the-libs' 'qt5-base')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"git+https://github.com/vicr123/libtdesktopenvironment.git")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
