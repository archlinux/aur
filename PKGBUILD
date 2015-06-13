# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vadorz
pkgver=40
pkgrel=1
pkgdesc="An addicting ncurses space-invaders game."
arch=('i686' 'x86_64')
url="http://code.google.com/p/vadorz"
license=('BSD')
depends=('ncurses')
source=(http://vadorz.googlecode.com/files/vadorz$pkgver.tar.gz)
md5sums=('fb96fe182c95c97888db45d99d920cd6')

build() {
	gcc vadorz.c -O2 -lncurses -o vadorz
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	install -m755 vadorz "$pkgdir/usr/bin/"
}
