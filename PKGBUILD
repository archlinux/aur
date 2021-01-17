# Maintainer: Jeandre Le Roux <theblazehen@gmail.com>

pkgname=xmenu
pkgver=4.5.4
pkgrel=1
pkgdesc="A menu utility for X."
arch=('any')
url="https://github.com/phillbush/xmenu"
license=("Public domain")
depends=("imlib2")
provides=("xmenu")
source=("https://github.com/phillbush/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("85e7159c013d44f9a61df6b54a43ebba")

build() {
	cd "$pkgname-$pkgver"
	make
}

package () {
	cd $pkgname-$pkgver
	make PREFIX="$pkgdir/usr" install
}
