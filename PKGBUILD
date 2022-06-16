# Maintainer: Florian Loitsch <florian@toit.io>
pkgname='jaguar-bin'
pkgver='1.2.3'
pkgrel=1
pkgdesc="Live reloading tool of Toit programs on the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/toitlang/jaguar/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('18d3fbed03d05ed0d3ca0c3e5a0f72551100e486de23b60231fc1696f6eb9a5d')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install jag "$pkgdir/usr/bin/jag"
}
