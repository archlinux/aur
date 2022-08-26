# Maintainer: Florian Loitsch <florian@toit.io>
pkgname='jaguar-bin'
pkgver=1.4.8
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/toitlang/jaguar/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('8329cc8b44835f2acc0930413faa8baa29e946f92619159ad0b69c33ccca6ffb')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install jag "$pkgdir/usr/bin/jag"
}
