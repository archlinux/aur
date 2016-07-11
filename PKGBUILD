# Maintainer: Tristelune  <tristelune at archlinux dot info>

pkgname=gtkspellmm
pkgver=3.0.4
pkgrel=1
pkgdesc="C++ binding for the gtkspell library"
arch=('i686' 'x86_64')
url="http://gtkspell.sourceforge.net/"
license=('GPL2')
depends=('gtkspell3' 'gtkmm3')
source=("http://sourceforge.net/projects/gtkspell/files/gtkspellmm/${pkgname}-${pkgver}.tar.gz")
md5sums=('e3ae1f74627f36180fd922fb053456b4')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
