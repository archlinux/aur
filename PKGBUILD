# Maintainer: Florian Loitsch <florian@toit.io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname='jaguar-bin'
pkgver=1.24.1
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
provides=('jaguar')
conflicts=('jaguar')
source=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('4bbae0476466e8c0c390c02c5945d4a0f9562f1d63e6b542970400d88e0c7347')

package() {
	install -D jag -t "$pkgdir/usr/bin/"
}
