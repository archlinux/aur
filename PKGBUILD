# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=wxhexeditor
pkgver=0.24
pkgrel=1
pkgdesc="A free hex editor / disk editor for Linux, Windows and MacOSX"
arch=('i686' 'x86_64')
url="http://www.wxhexeditor.org"
license=('GPL2')
makedepends=('wxgtk')
source=("https://github.com/EUA/wxHexEditor/archive/v$pkgver.tar.gz")
md5sums=('1b77bddc026e22797fd0e7a82e52cd28')

build() {
	cd "$srcdir/wxHexEditor-$pkgver"
	make
}

package() {
	cd "$srcdir/wxHexEditor-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
