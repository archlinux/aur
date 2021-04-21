# Maintainer: Jeandre Le Roux <theblazehen@gmail.com>
# Co-Maintainer: jzbor <zborof at posteo dot de>

pkgname=xmenu
pkgver=4.5.5
pkgrel=2
pkgdesc="A menu utility for X."
arch=('any')
url="https://github.com/phillbush/xmenu"
license=("Public domain")
depends=("imlib2")
makedepends=(libxft libxinerama)
provides=("xmenu")
source=("https://github.com/phillbush/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("cb544095915c4e3217766609be6cbafc")

build() {
	cd "$pkgname-$pkgver"
	make
}

package () {
	cd $pkgname-$pkgver
	make PREFIX="$pkgdir/usr" install
}
