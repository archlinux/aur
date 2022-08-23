# Maintainer: Florian Loitsch <florian@toit.io>
pkgname='jaguar-bin'
pkgver=1.4.6
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
source=("https://github.com/toitlang/jaguar/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('3f1b4b446927bdef11f7ab30d5972346e82c45a9a9c90e070b8fe5264efd3da9')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install jag "$pkgdir/usr/bin/jag"
}
