# Maintainer: Florian Loitsch <florian@toit.io>
pkgname='jaguar-bin'
pkgver='1.2.5'
pkgrel=1
pkgdesc="Live reloading tool of Toit programs on the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/toitlang/jaguar/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('e5de9258b24fa49b69fcc18139ae4dd174135308ddf341103b9ca1777ec75dca')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install jag "$pkgdir/usr/bin/jag"
}
