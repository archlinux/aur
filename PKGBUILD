# Maintainer: Tristelune  <tristelune at archlinux dot info>

pkgname=gtkspellmm
pkgver=3.0.5
pkgrel=2
pkgdesc="C++ binding for the gtkspell library"
arch=('i686' 'x86_64')
url="http://gtkspell.sourceforge.net/"
license=('GPL2')
depends=('gtkspell3' 'gtkmm3')
source=("http://sourceforge.net/projects/gtkspell/files/gtkspellmm/${pkgname}-${pkgver}.tar.xz")
md5sums=('abaf93ff39eec716d056edfc1ff8490b')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
