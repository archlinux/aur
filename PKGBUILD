# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icinga-php-library
pkgver=0.19.2
pkgrel=1
pkgdesc="Bundle for all Icinga PHP libraries"
arch=(any)
url="https://github.com/Icinga/icinga-php-library"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icinga-php-library/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('050e503db0705522bf9ef2f072332df3e8a91d27b834d10e6fef3aeb7f04e340')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/icinga-php"
	cp -rT . "$pkgdir/usr/share/icinga-php/ipl"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
