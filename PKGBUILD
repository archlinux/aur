# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icinga-php-library
pkgver=0.16.1
pkgrel=1
pkgdesc="Bundle for all Icinga PHP libraries"
arch=(any)
url="https://github.com/Icinga/icinga-php-library"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icinga-php-library/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8da32e239bbcdcb26bd62e00029eb4cc2d6429210354856eda61d7a8ad7b7dff')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/icinga-php"
	cp -rT . "$pkgdir/usr/share/icinga-php/ipl"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
