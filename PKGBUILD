# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theheartbeat
pkgver=1.0
pkgrel=0
pkgdesc="System Monitor"
arch=("x86_64")
url="https://github.com/vicr123/theheartbeat"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'qt5-x11extras' 'the-libs')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::'https://github.com/vicr123/theHeartbeat/archive/v1.0.tar.gz')
md5sums=('SKIP')
sha256sums=('89a8837864d03d3764fb2c4a8be63cd1f03a04e94ff20b6e3e9b2a9251c3cb06')

build() {
	cd "theHeartbeat-$pkgver"
	qmake
	make
}

package() {
	cd "theHeartbeat-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
