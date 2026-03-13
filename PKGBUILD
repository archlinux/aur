# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=openocd-esp32-bin
pkgver=0.12.0_esp32_20260304
pkgrel=1
pkgdesc='OpenOCD branch with ESP32 JTAG support'
arch=('x86_64')
url='https://github.com/espressif/openocd-esp32'
license=('GPL-2.0-or-later AND GFDL-1.2-no-invariants-or-later')
depends=('libftdi-compat' 'libusb' 'hidapi')
provides=('openocd' 'openocd-esp32')
conflicts=('openocd' 'openocd-esp32')
source=("https://github.com/espressif/openocd-esp32/releases/download/v${pkgver//_/-}/openocd-esp32-linux-amd64-${pkgver//_/-}.tar.gz")
sha256sums=('dbd7ecf751431c70628176fbf1ce404c3ff28027e91b66bda7f834a2d5ff5b81')

package() {
	cp -r "openocd-esp32" "$pkgdir/usr"
}
