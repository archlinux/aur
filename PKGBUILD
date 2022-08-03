# Maintainer: Florian Loitsch <florian@toit.io>
pkgname='jaguar-bin'
pkgver='1.4.1'
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/toitlang/jaguar/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('2f0521a84bfc7886f4886e7dee962f4948bad67e505b50d729496bbe8b782ca9')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install jag "$pkgdir/usr/bin/jag"
}
