# Maintainer: Florian Loitsch <florian@toit.io>
pkgname='jaguar-bin'
pkgver='1.2.2'
pkgrel=1
pkgdesc="Live reloading tool of Toit programs on the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/toitlang/jaguar/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('5515e923b36536176f6ac7754931c824e19dd9fc987a261b55230e46819858aa')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install jag "$pkgdir/usr/bin/jag"
}
