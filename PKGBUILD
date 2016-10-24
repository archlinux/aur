# Maintainer: Jeffrey E. Bedard <jefbed@gmail.com>
pkgname=jbwm
pkgver=1.50
pkgrel=1
pkgdesc="minimalist X11 window manager, based on evilwm"
arch=('x86_64' 'x86')
url="https://github.com/jefbed/jbwm"
license=('MIT')
depends=('libxau' 'libx11' 'libxext')
source=( "https://github.com/jefbed/jbwm/archive/$pkgver.tar.gz" )

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -d $pkgdir/usr/bin
	make DESTDIR="$pkgdir" install
}

md5sums=('5d6d2b43088f867fc6f3cea9c158b339')
