# Maintainer: Christoph Haag <haagch+aur@frickel.club>

pkgname=vive-udev
pkgver=1
pkgrel=3
pkgdesc="Udev rule for the Vive for the group \"plugdev\""
arch=('any')
url="https://github.com/lubosz/OSVR-Vive-Libre/"
license=('custom')
source=('https://raw.githubusercontent.com/lubosz/OSVR-Vive-Libre/master/config/83-vive.rules')
sha256sums=('SKIP')
install='vive-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/83-vive.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
