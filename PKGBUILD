# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icinga-php-thirdparty
pkgver=0.13.1
pkgrel=1
pkgdesc="Bundle for all 3rd party PHP libraries used by Icinga Web products"
arch=(any)
url="https://github.com/Icinga/icinga-php-thirdparty"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icinga-php-thirdparty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86a51b35bf22aa6a5f184320f5f96e3a9599510c303a048e71b9b2b6ce42975c')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/icinga-php"
	cp -rT . "$pkgdir/usr/share/icinga-php/vendor"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
