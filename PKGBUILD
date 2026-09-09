# Maintainer: Grant Moyer <dev@grantmoyer.com>
pkgname=openocd-esp32-bin
pkgver=0.12.0_esp32_20260831
pkgrel=1
pkgdesc='OpenOCD branch with ESP32 JTAG support'
arch=('x86_64')
url='https://github.com/espressif/openocd-esp32'
license=('GPL-2.0-or-later AND GFDL-1.2-no-invariants-or-later')
depends=('libftdi-compat' 'libusb' 'hidapi')
provides=('openocd' 'openocd-esp32')
conflicts=('openocd' 'openocd-esp32')
source=("https://github.com/espressif/openocd-esp32/releases/download/v${pkgver//_/-}/openocd-esp32-linux-amd64-${pkgver//_/-}.tar.gz")
sha256sums=('89dcf8efc32296fa5c1f1cfb0268b82a2f14ce9b9cdcf76e817c51365aee6e5a')

package() {
	cp -r "openocd-esp32" "$pkgdir/usr"
}
