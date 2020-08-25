# Maintainer: Jeandre Le Roux <theblazehen@gmail.com>

pkgname=xmenu
pkgver=4.3.1
pkgrel=1
pkgdesc="A menu utility for X."
arch=('any')
url="https://github.com/phillbush/xmenu"
license=("Public domain")
depends=("imlib2")
provides=("xmenu")
source=("https://github.com/phillbush/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("6b69e22f596bafdaec527ddd1da6dd7a")

build() {
	cd "$pkgname-$pkgver"
	make
}

package () {
	cd $pkgname-$pkgver
	make PREFIX="$pkgdir/usr" install
}
