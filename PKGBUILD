# Maintainer: Michal Janočko <michal@janocko.com>
pkgname=trak
pkgver=1.1
pkgrel=1
pkgdesc="Super-simple time tracker for your terminal"
arch=('any')
url="https://github.com/michaljanocko/trak"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("6e19421e3ae8232ea85255098b6acd53e4d293c7df2d10ecca175afbb83d795d")

package() {
	cd "$pkgname-$pkgver"

	install -Dm 755 trak "$pkgdir/usr/bin/trak"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
