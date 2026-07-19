# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=openocd-esp32-bin
pkgver=0.12.0_esp32_20260703
pkgrel=1
pkgdesc='OpenOCD branch with ESP32 JTAG support'
arch=('x86_64')
url='https://github.com/espressif/openocd-esp32'
license=('GPL-2.0-or-later AND GFDL-1.2-no-invariants-or-later')
depends=('libftdi-compat' 'libusb' 'hidapi')
provides=('openocd' 'openocd-esp32')
conflicts=('openocd' 'openocd-esp32')
source=("https://github.com/espressif/openocd-esp32/releases/download/v${pkgver//_/-}/openocd-esp32-linux-amd64-${pkgver//_/-}.tar.gz")
sha256sums=('4b71d1b4d8e4025029466e780161262a04137348b68e965c15250dbeebef03ce')

package() {
	cp -r "openocd-esp32" "$pkgdir/usr"
}
