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
md5sums=('efa93d15c70616a6617a5ff8013cd1cf')
