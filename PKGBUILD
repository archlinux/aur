# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icinga-php-library
pkgver=1.2.1
pkgrel=1
pkgdesc="Bundle for all Icinga PHP libraries"
arch=(any)
url="https://github.com/Icinga/icinga-php-library"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icinga-php-library/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b994465e66ce7237fc7485c2beda9af7cd4c8b4452b42aedde33dacede9a3440')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/icinga-php"
	cp -rT . "$pkgdir/usr/share/icinga-php/ipl"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
