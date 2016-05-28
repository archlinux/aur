# Maintainer: bzt <unmacaque at gmail dot com>
pkgname=ndstrim
pkgver=1.0
pkgrel=1
pkgdesc="Cross Platform NDS File Trimmer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ndstrim/"
license=('GPL3')
source=(http://ndstrim.googlecode.com/files/ndstrim-1.0.tar.bz2)
sha1sums=('3561fcecb09595341edc60e07033720c33e121a7')

build() {
	cd "$srcdir/$pkgname/source"
	./build.sh
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	install -m755 "$srcdir/$pkgname/source/ndstrim" "$pkgdir/usr/bin/"
}
