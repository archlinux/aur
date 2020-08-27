# Maintainer: Frederic Van Assche <frederic@fredericva.com>
pkgname=esp8266-nonos-sdk
pkgver=3.0.4
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
sha256sums=('3bfb8ea34724c91b80481882c080ed04225cfeff7b8c92b7b21120496297ae1b')

package() {
	install -d "$pkgdir"/opt/$pkgname
	cp -af ESP8266_NONOS_SDK-$pkgver/* "$pkgdir"/opt/$pkgname
}
