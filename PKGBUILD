
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=tsscreenlock
pkgver=2.0
pkgrel=0
pkgdesc="Screen Locker for theShell"
arch=("x86_64")
url="https://github.com/vicr123/tsscreenlock"
license=('GPL3')
depends=('tscheckpass' 'qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'qt5-svg')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/tsscreenlock#branch=master')
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
