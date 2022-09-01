# Maintainer: Florian Loitsch <florian@toit.io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname='jaguar-bin'
pkgver=1.5.1
pkgrel=2
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
provides=('jaguar')
conflicts=('jaguar')
source=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('d9f555d6ebb8ebdf3557885f1b62cda7a64405adc8b2bfbaaec0a317f3c09988')

package() {
	install -D jag -t "$pkgdir/usr/bin/"
}
