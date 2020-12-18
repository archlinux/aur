# Maintainer: Jeandre Le Roux <theblazehen@gmail.com>

pkgname=xmenu
pkgver=4.4.1
pkgrel=1
pkgdesc="A menu utility for X."
arch=('any')
url="https://github.com/phillbush/xmenu"
license=("Public domain")
depends=("imlib2")
provides=("xmenu")
source=("https://github.com/phillbush/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("d133cf0b1527667cc676e088696c6945")

build() {
	cd "$pkgname-$pkgver"
	make
}

package () {
	cd $pkgname-$pkgver
	make PREFIX="$pkgdir/usr" install
}
