# Maintainer: Frederic Van Assche <frederic@fredericva.com>
pkgname=esp8266-nonos-sdk
pkgver=3.0
pkgrel=1
pkgdesc="ESP8266 nonOS SDK"
arch=('x86_64')
url="https://github.com/espressif/ESP8266_NONOS_SDK"
license=('Espressif MIT')
depends=('python2')
optdepends=('xtensa-lx106-elf-gcc-bin: Toolchain for the ESP8266')
makedepends=('git')
options=(!strip)
source=("https://github.com/espressif/ESP8266_NONOS_SDK/archive/v$pkgver.tar.gz")
sha256sums=('b2c99cb95afc17474123dfc2f79d835543294c4fdf1aa3829d67f73d81fb2bc2')

package() {
	install -d "$pkgdir"/opt/$pkgname
	cp -af ESP8266_NONOS_SDK-$pkgver/* "$pkgdir"/opt/$pkgname
}
