# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=poe
pkgver=1.7.7
pkgrel=1
pkgdesc=".po file editor"
arch=('x86_64')
url="https://strahinja.srht.site/poe"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/poe/archive/v$pkgver.tar.gz")
md5sums=('ae4e8e98c8eaf8c5576b0eff5fdc2fee')

build() {
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e all
}

package() {
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e install
}
