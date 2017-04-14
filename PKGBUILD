
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ts-bugreport
pkgver=1.0
pkgrel=0
pkgdesc="Bug reporter for the* apps"
arch=("x86_64")
url="https://github.com/vicr123/ts-polkitagent"
license=('GPL3')
depends=('qt5-base' 'the-libs')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/ts-bugreport#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/ts-bugreport" "$pkgdir/usr/bin/ts-bugreport"
}
