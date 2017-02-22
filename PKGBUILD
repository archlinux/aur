# Maintainer: Christoph Haag <haagch+aur@frickel.club>

pkgname=vive-udev
pkgver=1
pkgrel=4
pkgdesc="Udev rule for the Vive for the group \"plugdev\""
arch=('any')
url="https://github.com/lubosz/OSVR-Vive-Libre/"
license=('custom')
source=('83-vive.rules')
sha256sums=('d7e20ae0001153eeddbff8e9815de774a5167251d26387b9011888876f3cf263')
install='vive-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/83-vive.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
