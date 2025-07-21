# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=circle-flags
pkgver=2.7.0
pkgrel=2
pkgdesc='A collection of circular flags in SVG format'
arch=('any')
url=https://github.com/linuxmint/circle-flags
_url="http://packages.linuxmint.com/pool/main/c/${pkgname}"
license=(GPL3)
#source=("${_url}/${pkgname}_${pkgver}.tar.xz")
source=("${_url}/${pkgname}_${pkgver}+mint1.tar.xz")
sha256sums=('2e7d286ee1ea58c84217348eca2d0e03ffdee74ab1deb9880f640ab3a604d84d')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
