# Maintainer: Johan Malm <jgm323 at gmail dot com>
pkgname=jgmenu
pkgver=0.8
pkgrel=1
pkgdesc="Small X11 menu intended to be used with openbox and tint2"
arch=('i686' 'x86_64')
url="http://www.github.com/johanmalm/jgmenu"
license=('GPL2')
depends=('libx11' 'cairo' 'pango' 'libxinerama' 'librsvg' 'libxml2' 'glib2' 'menu-cache')
source=("http://www.github.com/johanmalm/jgmenu/archive/v0.8.tar.gz")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install
}
