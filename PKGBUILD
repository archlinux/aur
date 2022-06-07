# Maintainer: Florian Loitsch <florian@toit.io>
pkgname='jaguar-bin'
pkgver='1.1.3'
pkgrel=1
pkgdesc="Live reloading tool of Toit programs on the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/toitlang/jaguar/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('a336cd1388a8ff136e4f5db70b81ce562ffb75e9a0114d1e51ef47616cd5b695')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install jag "$pkgdir/usr/bin/jag"
}
