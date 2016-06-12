# Maintainer: Johan Malm <jgm323 at gmail dot com>
pkgname=jgmenu
pkgver=0.2.2
pkgrel=1
pkgdesc="Small X11 menu intended to be used with openbox and tint2"
arch=('i686' 'x86_64')
url="http://www.github.com/johanmalm/jgmenu"
license=('GPL2')
depends=('libx11' 'cairo' 'pango' 'libxinerama')
source=("http://www.github.com/johanmalm/jgmenu/archive/v0.2.2.tar.gz")
md5sums=('558a00599a173ff98af949b927742a00')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install
}
