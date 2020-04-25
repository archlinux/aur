
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=contemporary-widgets
pkgver=1.7
pkgrel=0
pkgdesc="Contemporary Widget Theme"
arch=("x86_64")
url="https://github.com/vicr123/contemporary-theme"
license=('GPL3')
depends=('qt5-base' 'the-libs')
makedepends=('git')
source=('https://github.com/vicr123/contemporary-theme/archive/v1.7.tar.gz')
sha256sums=('b1ebd8832e2f3d3335c9d48db68b0dda2594f317aadcd6a24e09ab4e8ec1c3e4')

build() {
	cd "contemporary-theme-$pkgver"
	qmake
	make
}

package() {
	cd "contemporary-theme-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
