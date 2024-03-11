# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=poe
pkgver=1.7.6
pkgrel=1
pkgdesc=".po file editor"
arch=('x86_64')
url="https://strahinja.srht.site/poe"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/poe/archive/v$pkgver.tar.gz")
md5sums=('0244a6c33817386d62ef9de19a28fd07')

build() {
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e all
}

package() {
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e install
}
