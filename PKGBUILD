# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-greybird
pkgver=20160816
pkgrel=1
pkgdesc="Greybird style for Fluxbox"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/greybird.zip")
md5sums=('73bda08b8660a6779a71ebc3314752f7')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/greybird"
  cp -r ${srcdir}/greybird/* "${pkgdir}/usr/share/fluxbox/styles/greybird"
}

