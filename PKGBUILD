# Maintainer: Dag Robole <dag.robole@gmail.com>
pkgname=fluxbox-style-numix
pkgver=20160709
pkgrel=1
pkgdesc="Numix style for Fluxbox"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/archive/v1.0.zip")
md5sums=('742c8c97f793a6e52791eee65c775695')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/numix"
  cp -r ${srcdir}/fluxbox-styles-corebob-1.0/numix/* "${pkgdir}/usr/share/fluxbox/styles/numix"
}
