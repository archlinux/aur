# Maintainer: Dag Robole <dag.robole@gmail.com>
pkgname=fluxbox-style-numix
pkgver=20160820
pkgrel=2
pkgdesc="Numix style for Fluxbox"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/numix5.zip")
md5sums=('7f13dcea292525c81ba14ae10081b18b')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/numix"
  cp -r ${srcdir}/numix/* "${pkgdir}/usr/share/fluxbox/styles/numix"
}
