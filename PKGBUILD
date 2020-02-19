# Maintainer: David Schury <dasc@posteo.de>

pkgname=reboot-checker
pkgver=1.0
pkgrel=1
pkgdesc="Script determining if a reboot of the system is required"
url="https://gitlab.com/daersc/reboot-checker"
arch=('any')
license=('GPL3')
depends=('libnotify')
source=("https://gitlab.com/daersc/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('50879923f512a9aed4ef0ddf33a6dacc')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/$pkgname-$pkgver/check-reboot $pkgdir/usr/bin
}
