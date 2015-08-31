#uploaded to AUR4 by: GI_Jack <iamjacksemail@hackermail.com>

# Contributor: ras0ir <ras0ir at eventualis dot org>
# Contributor: dieghen89 <dieghen89@gmail.com>
# Contributor: Alishams Hassam <alishams.hassam@gmail.com> 
pkgname=isl3886usb-firmware
pkgver=2.13.1.0
pkgrel=2
pkgdesc="Firmware for p54usb module"
arch=('i686' 'x86_64')
url="http://wireless.kernel.org/en/users/Drivers/p54"
license=('GPL')
source=("http://daemonizer.de/prism54/prism54-fw/fw-usb/$pkgver.lm86.arm")
md5sums=('6495bbb447bce149427182b25135820b')

build() {
  mkdir -p $pkgdir/usr/lib/firmware/
  install -m644 * $pkgdir/usr/lib/firmware/isl3886usb
}

