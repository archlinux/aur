# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theheartbeat
pkgver=1.1
pkgrel=0
pkgdesc="System Monitor"
arch=("x86_64")
url="https://github.com/vicr123/theheartbeat"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'qt5-x11extras' 'the-libs')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::'https://github.com/vicr123/theHeartbeat/archive/v1.1.tar.gz')
md5sums=('SKIP')
sha256sums=('f5a1792d15dd275fd12a6f496f9c7557e190ed96c8b92a9c5bbb3e469d3c3ec0')

build() {
	cd "theHeartbeat-$pkgver"
	qmake
	make
}

package() {
	cd "theHeartbeat-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
