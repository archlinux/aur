# Maintainer: bzt <unmacaque at gmail dot com>
pkgname=ndstrim
pkgver=1.27.5
pkgrel=1
pkgdesc="Cross Platform NDS File Trimmer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ndstrim/"
license=('GPL3')
source=(https://github.com/stefansundin/ndstrim/releases/download/downloads/ndstrim-1.27.5.tar.bz2)
sha1sums=('14f1b15820f6ba601834b88a888453dea7468c3f')

build() {
	cd "$srcdir/$pkgname-$pkgver/src"
	./build.sh
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	install -m755 "$srcdir/$pkgname-$pkgver/src/ndstrim" "$pkgdir/usr/bin/"
}


