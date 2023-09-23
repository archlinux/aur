# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=circle-flags
pkgver=2.6.2
pkgrel=1
pkgdesc='A collection of circular flags in SVG format'
arch=('any')
url="http://packages.linuxmint.com/pool/main/c/${pkgname}"
license=(GPL3)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('4d4e3f5f439381f8e90b401950f1dada4645e4468b33c787bbf61b727d9b99cd')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
