# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-solarized-light
pkgver=20160816
pkgrel=1
pkgdesc="Solarized Light style for Fluxbox"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/solarized-light.zip")
md5sums=('43ffc324af983796fa34007c0eb2d487')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/solarized-light"
  cp -r ${srcdir}/solarized-light/* "${pkgdir}/usr/share/fluxbox/styles/solarized-light"
}
