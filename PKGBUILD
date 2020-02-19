# Maintainer: David Schury <dasc@posteo.de>

pkgname=battery-checker
pkgver=1.0
pkgrel=1
pkgdesc="Script determining if the laptop battery is low"
url="https://gitlab.com/daersc/battery-checker"
arch=('any')
license=('GPL3')
depends=('libnotify')
source=("https://gitlab.com/daersc/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('29541ab7f031be3118509ddfa1688d51')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/$pkgname-$pkgver/check-battery $pkgdir/usr/bin
}
