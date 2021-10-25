# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=poe
pkgver=1.3.6
pkgrel=1
pkgdesc=".po file editor"
arch=('x86_64')
url="https://strahinja.srht.site/poe"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/poe/archive/v$pkgver.tar.gz")
md5sums=('a191ea69ee5044508dda8aa0ae416ccf')

build() {
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" ./do -c
}

package() {
	cd $pkgname-v$pkgver
	PREFIX="$pkgdir/usr" ./do install
}
