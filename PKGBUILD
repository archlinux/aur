# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-zukitwo
pkgver=20160816
pkgrel=1
pkgdesc="Zukitwo style for Fluxbox"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/zukitwo.zip")
md5sums=('d064116d3fb7f4897b4d65403364b4f7')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/zukitwo"
  cp -r ${srcdir}/zukitwo/* "${pkgdir}/usr/share/fluxbox/styles/zukitwo"
}
