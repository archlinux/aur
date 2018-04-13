# Maintainer: Christoph Haag <haagch+aur@frickel.club>

pkgname=vive-udev
pkgver=1
pkgrel=5
pkgdesc="Udev rule for the Vive for the group \"plugdev\""
arch=('any')
url="https://github.com/lubosz/OSVR-Vive-Libre/"
license=('custom')
source=('83-vive.rules')
sha256sums=('c6245311e9764e3364739d13d2833d7a04328d554013e8e623fb4188496154bb')
install='vive-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/83-vive.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
