# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=table
pkgver=v0.3.2
pkgrel=1
pkgdesc="Command line utility to format and display CSV"
arch=('x86_64')
url="https://strahinja.srht.site/table"
license=('GPL3')
depends=('gcc' 'gzip')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/table/archive/$pkgver.tar.gz")
md5sums=('0c69067fcc2234f1aaee7b9e1ee9338f')

build() {
	cd $pkgname-$pkgver
	PREFIX="$pkgdir/usr" ./do -c
}

package() {
	cd $pkgname-$pkgver
	PREFIX="$pkgdir/usr" ./do install
}
