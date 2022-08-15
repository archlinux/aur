# Maintainer: Florian Loitsch <florian@toit.io>
pkgname='jaguar-bin'
pkgver=1.4.3
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/toitlang/jaguar/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('f26aef8762ab02c49e4f564db96fab51ef3a8c00a2224ddfecb84793d62296db')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install jag "$pkgdir/usr/bin/jag"
}
