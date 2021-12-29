# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=table
pkgver=0.4
pkgrel=1
pkgdesc="Command line utility to format and display CSV"
arch=('x86_64')
url="https://strahinja.srht.site/table"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/table/archive/v$pkgver.tar.gz")
md5sums=('944156ea469715a6c74af727b49ac784')

build() {
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" ./do -c
}

package() {
	cd $pkgname-v$pkgver
	PREFIX="$pkgdir/usr" ./do install
}
