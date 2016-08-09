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
md5sums=('ad16496aade0325f2b9270b773acc4ea')
