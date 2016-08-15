# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-hellbent
pkgver=20160816
pkgrel=1
pkgdesc="Hellbent style for Fluxbox"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/hellbent.zip")
md5sums=('d88a22daa224fe81ade422f1de5c0e8b')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/hellbent/"
  cp -r ${srcdir}/hellbent/* "${pkgdir}/usr/share/fluxbox/styles/hellbent"
}
