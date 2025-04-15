# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=circle-flags
pkgver=2.7.0
pkgrel=1
pkgdesc='A collection of circular flags in SVG format'
arch=('any')
url=https://github.com/linuxmint/circle-flags
_url="http://packages.linuxmint.com/pool/main/c/${pkgname}"
license=(GPL3)
source=("${_url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('41206d62f7e14a9917c4f551ebf88f21434a3bfb709ecd074077cbc6057506f6')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
