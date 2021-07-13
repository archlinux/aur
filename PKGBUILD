# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icinga-php-thirdparty
pkgver=0.10.0
pkgrel=1
pkgdesc="Bundle for all Icinga PHP libraries"
arch=(any)
url="https://github.com/Icinga/icinga-php-thirdparty"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icinga-php-thirdparty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40dfdc42dfc94f4c39a511b2dbadc8eb083d3362de27c216d8cb9aa48d812566')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/icinga-php"
	cp -rT . "$pkgdir/usr/share/icinga-php/vendor"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
