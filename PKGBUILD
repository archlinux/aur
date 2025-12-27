# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icinga-php-thirdparty
pkgver=0.14.0
pkgrel=1
pkgdesc="Bundle for all 3rd party PHP libraries used by Icinga Web products"
arch=(any)
url="https://github.com/Icinga/icinga-php-thirdparty"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icinga-php-thirdparty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d101cbef0b07aefe2c58e4016beed884a8da28083b78550123681952f548fd5')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/icinga-php"
	cp -rT . "$pkgdir/usr/share/icinga-php/vendor"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
