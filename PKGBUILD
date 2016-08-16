# Maintainer: Dag Robole <dag.robole@gmail.com>
pkgname=fluxbox-style-numix
pkgver=20160816
pkgrel=3
pkgdesc="Numix style for Fluxbox"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/numix2.zip")
md5sums=('f863260ee3d2bf1b67d58191819e368f')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/numix"
  cp -r ${srcdir}/numix/* "${pkgdir}/usr/share/fluxbox/styles/numix"
}
