# Maintainer: Florian Loitsch <florian@toit.io>
pkgname='jaguar-bin'
pkgver=1.4.5
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/toitlang/jaguar/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('2e2f7ca7951a1304ae1242d79038d6c89bea709fa624ddd652e11b569496c12c')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install jag "$pkgdir/usr/bin/jag"
}
