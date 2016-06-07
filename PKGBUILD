# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-greybird
pkgver=20160607
pkgrel=1
pkgdesc="Greybird style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-greybird"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-greybird/archive/v0.1.zip")
md5sums=('b7265ff33ff5d7b426d5c018fd4479c7')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/greybird"
  cp -r ${srcdir}/fluxbox-style-greybird-0.1/greybird "${pkgdir}/usr/share/fluxbox/styles/"
}

