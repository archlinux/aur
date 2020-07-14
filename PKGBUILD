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
sha256sums=('0f37dba2524acab9a7e813f0229d607801f4ec442b4fadf6ff7681c3647f167b')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
