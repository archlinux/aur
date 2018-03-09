# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thesafe
pkgver=1.0
pkgrel=0
pkgdesc="Bup Frontend"
arch=("x86_64")
url="https://github.com/vicr123/thesafe"
license=('GPL3')
depends=('bup' 'qt5-base' 'the-libs')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/thesafe.git')
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
