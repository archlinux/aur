# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-elegant-brit
pkgver=20160816
pkgrel=1
pkgdesc="Elegant Brit style for Fluxbox"
url="https://github.com/corebob/fluxbox-styles-corebob"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-styles-corebob/releases/download/v1.1/elegant-brit.zip")
md5sums=('2c6d21282c060e1171148f02d5032e26')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/Elegant Brit/"
  cp -r ${srcdir}/elegant-brit/* "${pkgdir}/usr/share/fluxbox/styles/Elegant Brit/"
}
