# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=poe
pkgver=1.3.4
pkgrel=6
pkgdesc=".po file editor"
arch=('x86_64')
url="https://strahinja.srht.site/poe"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/poe/archive/v$pkgver.tar.gz")
md5sums=('b79d8703819ab6b5367e43101f27c755')

build() {
	cd $srcdir
	PREFIX="$pkgdir/usr" ./do -c
}

package() {
	cd $srcdir
	PREFIX="$pkgdir/usr" ./do install
}
