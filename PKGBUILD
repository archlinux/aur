# Maintainer: Florian Loitsch <florian@toit.io>
pkgname='jaguar-bin'
pkgver=1.4.7
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/toitlang/jaguar/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('4f82f45e16d67659c29ddcd45d932c5217ab51aab5c4f056d23531be382a5d1e')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install jag "$pkgdir/usr/bin/jag"
}
