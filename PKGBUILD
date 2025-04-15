# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Maintainer: Manuel Hüsers <aur@huesers.de>
# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=iso-flag-png
_pkgname=flags
pkgver=1.0.3
pkgrel=1
pkgdesc='ISO country flags in PNG format'
arch=('any')
groups=('cinnamon')
url="https://github.com/linuxmint/flags"
_url="http://packages.linuxmint.com/pool/main/f/${_pkgname}"
license=(GPL3)
source=("${_url}/${_pkgname}_${pkgver}.tar.xz")
sha256sums=('071b4a9665c1ce4f741f79c7e3ca4dea52c18864f24b05e7740c8358f34d4d67')

package() {
  cd "${srcdir}"/"${_pkgname}"
  cp -r usr "${pkgdir}"
}
