
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=contemporary-widgets-gtk
pkgver=1.0
pkgrel=0
pkgdesc="Contemporary Widget Theme for GTK"
arch=("x86_64")
url="https://github.com/vicr123/contemporary-theme"
license=('GPL3')
depends=('gtk3')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/contemporary-theme#branch=gtk3')
md5sums=('SKIP')

build() {
#	cd "$pkgname-$pkgver"
#	qmake
#	make
echo "Hi"
}

package() {
	mkdir -p "$pkgdir/usr/share/themes/Contemporary"
	cp -r "$pkgname-$pkgver/"* "$pkgdir/usr/share/themes/Contemporary"
}
