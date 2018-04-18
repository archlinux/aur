# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=raspberrypi-overlays
pkgdesc="Overlays files for Raspberry Pi"
pkgver=1.20180328
pkgrel=1
arch=('any')
url="https://github.com/raspberrypi/firmware"
license=('custom')
options=(!strip)
source=("https://github.com/raspberrypi/firmware/archive/${pkgver}.zip")
sha1sums=('24c97530c3ae6a3010df3f843e59cb2349753c19')

package() {
  mkdir -p "${pkgdir}/boot"
  cp -R "${srcdir}/firmware-${pkgver}/boot/overlays" "${pkgdir}/boot"
}
