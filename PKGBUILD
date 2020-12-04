#uploaded to AUR4 by: GI_Jack <iamjacksemail@hackermail.com>

# Contributor: ras0ir <ras0ir at eventualis dot org>
# Contributor: dieghen89 <dieghen89@gmail.com>
# Contributor: Alishams Hassam <alishams.hassam@gmail.com> 
pkgname=isl3886usb-firmware
pkgver=2.13.1.0
pkgrel=4
pkgdesc="Firmware for p54usb module"
arch=('any')
url="http://wireless.kernel.org/en/users/Drivers/p54"
license=('GPL')
source=("http://daemonizer.de/prism54/prism54-fw/fw-usb/$pkgver.lm86.arm")
sha256sums=('40c4a2bc94b0af65d81cf6467b2e22fe029d55827ba100ff17c4974a2a377d0e')

package() {
  mkdir -p $pkgdir/usr/lib/firmware/
  install -m644 * $pkgdir/usr/lib/firmware/isl3886usb
}

