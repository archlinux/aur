
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=tsscreenlock
pkgver=1.5
pkgrel=0
pkgdesc="Screen Locker for theShell"
arch=("x86_64")
url="https://github.com/vicr123/tsscreenlock"
license=('GPL3')
depends=('tscheckpass')
makedepends=('qtchooser' 'git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/tsscreenlock#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/lib"
	cp "$pkgname-$pkgver/tsscreenlock" "$pkgdir/usr/lib/"
}
