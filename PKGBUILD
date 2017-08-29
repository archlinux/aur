# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ts-startsession
pkgver=1.0
pkgrel=1
pkgdesc="theShell Session Manager"
arch=("x86_64")
url="https://github.com/vicr123/ts-startsession"
license=('GPL3')
depends=('qt5-base' 'contemporary-widgets-gtk')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/ts-startsession.git')
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
