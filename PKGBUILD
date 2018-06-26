# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=raspberrypi-overlays
pkgdesc="Overlays files for Raspberry Pi"
pkgver=1.20180417
pkgrel=1
arch=('any')
url="https://github.com/raspberrypi/firmware"
license=('custom')
options=(!strip)
source=("https://github.com/raspberrypi/firmware/archive/${pkgver}.zip")
sha1sums=('a21ec4d34ee34025161a99a9b93a9b925f01a9b7')

package() {
  mkdir -p "${pkgdir}/boot"
  cp -R "${srcdir}/firmware-${pkgver}/boot/overlays" "${pkgdir}/boot"
}
