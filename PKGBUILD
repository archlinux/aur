# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Maintainer: Manuel Hüsers <aur@huesers.de>
# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=iso-flag-png
_pkgname=flags
pkgver=1.0.4
pkgrel=1
pkgdesc='ISO country flags in PNG format'
arch=('any')
groups=('cinnamon')
url="https://github.com/linuxmint/flags"
_url="http://packages.linuxmint.com/pool/main/f/${_pkgname}"
license=(GPL3)
source=("${_url}/${_pkgname}_${pkgver}.tar.xz")
sha256sums=('594f22f076d8e34ca5730d3a4cb5e76d6dc2828b633cd2ea090fc0e0c5786993')

package() {
  cd "${srcdir}"/"${_pkgname}"
  cp -r usr "${pkgdir}"
}
