# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ts-kbd
pkgver=0.2
pkgrel=0
pkgdesc="Touchscreen keyboard"
arch=("x86_64")
url="https://github.com/vicr123/ts-kbd"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'libxtst' 'qt5-x11extras' 'qt5-multimedia' 'the-libs')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/ts-kbd.git')
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
