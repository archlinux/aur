# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theframe
pkgver=1.0
pkgrel=0
pkgdesc="Animation Tool"
arch=("x86_64")
url="https://github.com/vicr123/theframe"
license=('GPL3')
depends=('qt5-base' 'the-libs' 'qt5-svg' 'ffmpeg')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/theFrame/archive/v1.0.tar.gz")
sha256sums=('4c27200f3736dacee9cfe27b6cfabfbaddc27a2b696954d596b9b48cd33bbfdd')

build() {
	cd "theFrame-$pkgver"
	qmake
	make
}

package() {
	cd "theFrame-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
