# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=dtree
pkgver=0.2
pkgrel=1
pkgdesc="Command line program to draw trees"
arch=('x86_64')
url="https://strahinja.srht.site/dtree"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/dtree/archive/v$pkgver.tar.gz")
md5sums=('d2541a8792bf94d56350a24e2ac875f2')

build() {
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e all
}

package() {
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e install
}
