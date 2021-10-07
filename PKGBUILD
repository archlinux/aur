# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=poe
pkgver=v1.3.3
pkgrel=1
pkgdesc=".po file editor"
arch=('x86_64')
url="https://strahinja.srht.site/poe"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/poe/archive/$pkgver.tar.gz")
md5sums=('f4cd5ec3aa9e7fdf3ee6a40c3daa1b78')

build() {
	cd $pkgname-$pkgver
	./do -c
}

package() {
	cd $pkgname-$pkgver
	PREFIX="$pkgdir/usr" ./do install
}
