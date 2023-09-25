# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icinga-php-library
pkgver=0.13.0
pkgrel=1
pkgdesc="Bundle for all Icinga PHP libraries"
arch=(any)
url="https://github.com/Icinga/icinga-php-library"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icinga-php-library/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14ac7bf453e5a38d052d51b29ee6656ec8a1b252d943e88a8d7cceb27baccb6d')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/icinga-php"
	cp -rT . "$pkgdir/usr/share/icinga-php/ipl"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
