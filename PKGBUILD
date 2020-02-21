# Maintainer: David Schury <dasc@posteo.de>

pkgname=battery-checker
pkgver=1.1
pkgrel=1
pkgdesc="Script determining if the laptop battery is low"
url="https://gitlab.com/daersc/battery-checker"
arch=('any')
license=('GPL3')
depends=('libnotify')
source=("https://gitlab.com/daersc/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('48659c5cb6840e1868b4bb4a16ba438f')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/$pkgname-$pkgver/check-battery $pkgdir/usr/bin
}
