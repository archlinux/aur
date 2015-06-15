# Maintainer: n17ikh <n17ikh@gmail.com>
# Contributor: ras0ir <ras0ir at eventualis dot org>
# Contributor: dieghen89 <dieghen89@gmail.com>
pkgname=isl3887usb-firmware
pkgver=2.13.25.0
pkgrel=6
pkgdesc="Firmware for p54usb module"
arch=('any')
url="http://wireless.kernel.org/en/users/Drivers/p54"
license=('GPL')
source=("https://daemonizer.de/prism54/prism54-fw/fw-usb/$pkgver.lm87.arm")
md5sums=('39be687c87544b892e7a8ffe7ffd9371')

package() {
  install -Dm644 * $pkgdir/usr/lib/firmware/isl3887usb
}

