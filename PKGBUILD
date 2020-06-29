# Maintainer: Jeandre Le Roux <theblazehen@gmail.com>

pkgname=xmenu
pkgver=3.1.1
pkgrel=1
pkgdesc="A menu utility for X."
arch=('any')
url="https://github.com/phillbush/xmenu"
license=("Public domain")
depends=("imlib2")
provides=("xmenu")
source=("https://github.com/phillbush/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("45950759735546d1722b9c1d9dd54fe7")

build() {
	cd "$pkgname-$pkgver"
	make
}

package () {
	cd $pkgname-$pkgver
	make PREFIX="$pkgdir/usr" install
}
