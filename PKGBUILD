# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=raspberrypi-overlays
pkgdesc="Overlays files for Raspberry Pi"
pkgver=1.20180619
pkgrel=1
arch=('any')
url="https://github.com/raspberrypi/firmware"
license=('custom')
options=(!strip)
source=("https://github.com/raspberrypi/firmware/archive/${pkgver}.zip")
sha1sums=('1be26af4605d66355f07fb48ff69c412285b328d')

package() {
  mkdir -p "${pkgdir}/boot"
  cp -R "${srcdir}/firmware-${pkgver}/boot/overlays" "${pkgdir}/boot"
}
