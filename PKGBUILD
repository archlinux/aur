# Maintainer: wilke

_basename=usbip
pkgname=${_basename}-runit
pkgver=20240707
pkgrel=0
pkgdesc='Runit service script for USB/IP'
arch=('any')
url='https://usbip.sourceforge.net/'
license=('GPL')
depends=("${_basename}" 'runit')
source=("${_basename}d.run")
sha256sums=('b6f3b8319000ec283c8e4c6361e0c9c672001c98aa4151d4f83381f56b2d9eb1')

package() {
  install -Dm755 "${srcdir}/${_basename}d.run" "${pkgdir}/etc/runit/sv/${_basename}d/run"
}
