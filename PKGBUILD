# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=slweb
pkgver=v0.4
pkgrel=3
pkgdesc="Simple static website generator"
arch=('x86_64')
url="https://strahinja.srht.site/slweb"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/slweb/archive/$pkgver.tar.gz")
md5sums=('619be0b9752bf4844049270350b42bbe')

build() {
	cd $pkgname-$pkgver
	PREFIX="$pkgdir/usr" ./do -c
}

package() {
	cd $pkgname-$pkgver
	PREFIX="$pkgdir/usr" ./do install
}
