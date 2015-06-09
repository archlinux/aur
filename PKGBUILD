# Maintainer: Chris Trotman <chris@trotman.io>
pkgname=hid_listen
pkgver=1.01
pkgrel=1
pkgdesc="prints out debugging information from usb hid devices."
url="http://www.pjrc.com/teensy/hid_listen.html"
arch=('x86_64' 'i686')
license=('GPL3')

source=("http://www.pjrc.com/teensy/${pkgname}_${pkgver}.zip")
md5sums=('fcc94f8248f5642f1fc9747e0f280569')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp "hid_listen" "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
