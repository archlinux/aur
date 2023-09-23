# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=iso-flag-png
_pkgname=flags
pkgver=1.0.2
pkgrel=2
pkgdesc='ISO country flags in PNG format'
arch=('any')
groups=('cinnamon')
url="http://packages.linuxmint.com/pool/main/f/${_pkgname}"
license=(GPL3)
source=("${url}/${_pkgname}_${pkgver}.tar.xz")
sha256sums=('4726333387e5795d49a2a54f7ffbbdb5b50f47b6aa20533a78b6eded347ca57c')

package() {
  cd "${srcdir}"/"${_pkgname}"
  cp -r usr "${pkgdir}"
}
