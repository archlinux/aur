pkgname=osvr-udev
pkgver=1
pkgrel=1
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
md5sums=('f00401b8ff27dafe06c41f887be39f36')
