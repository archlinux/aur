# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=raspberrypi-overlays
pkgdesc="Overlays files for Raspberry Pi"
pkgver=1.20180817
pkgrel=1
arch=('any')
url="https://github.com/raspberrypi/firmware"
license=('custom')
options=(!strip)
source=("https://github.com/raspberrypi/firmware/archive/${pkgver}.zip")
sha1sums=('4d21e5e89cdc0016e3e0e3f46be2592daec05b98')

package() {
  mkdir -p "${pkgdir}/boot"
  cp -R "${srcdir}/firmware-${pkgver}/boot/overlays" "${pkgdir}/boot"
}
