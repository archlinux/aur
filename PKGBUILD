# Maintainer: Tristelune  <tristelune at archlinux dot info>

pkgname=gtkspellmm
pkgver=3.0.3
pkgrel=4
pkgdesc="C++ binding for the gtkspell library"
arch=('i686' 'x86_64')
url="http://gtkspell.sourceforge.net/"
license=('GPL2')
depends=('gtkspell3' 'gtkmm3')
source=("http://sourceforge.net/projects/gtkspell/files/gtkspellmm/gtkspellmm-3.0.3.tar.gz")
md5sums=('2d316a62946cd2fcf1a3b8d5a30099f9')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
