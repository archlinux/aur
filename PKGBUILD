# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
pkgname=esp8266-rtos-sdk
pkgver=3.1.2
pkgrel=1
pkgdesc="ESP8266 RTOS SDK"
arch=('x86_64')
url="https://github.com/espressif/ESP8266_RTOS_SDK"
license=('Espressif MIT')
depends=('python3')
optdepends=('xtensa-lx106-elf-gcc-bin: Toolchain for the ESP8266')
makedepends=('git')
options=(!strip)
source=("https://github.com/espressif/ESP8266_RTOS_SDK/archive/v$pkgver.tar.gz")
sha256sums=('d9ca98acb1aa6f397f778316efbe3378834803e9360164e746a292b55a291f00')

package() {
	install -d "$pkgdir"/opt/$pkgname
	cp -af ESP8266_RTOS_SDK-$pkgver/* "$pkgdir"/opt/$pkgname
}
