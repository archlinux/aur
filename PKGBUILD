# Maintainer: Florian Loitsch <florian@toit.io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname='jaguar-bin'
pkgver=1.16.0
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
provides=('jaguar')
conflicts=('jaguar')
source=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('108a0e7bba71f340a6ff223204f8a880b62b7e0eb2bc5de3f674c66be76de936')

package() {
	install -D jag -t "$pkgdir/usr/bin/"
}
