pkgname=osvr-udev
pkgver=1
pkgrel=2
pkgdesc="Udev rule for the OSVR HDK"
arch=('any')
url="http://osvr.org"
license=('custom')
source=('83-osvr.rules')
install='osvr-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/83-osvr.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
md5sums=('4a4f2b00f30db9f5acf5b0b50bc3fc05')
