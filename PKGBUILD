# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-solarized-light
pkgver=20151105
pkgrel=1
pkgdesc="Solarized Light style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-solarized-light"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-solarized-light/releases/download/v1.0/fluxbox-style-solarized-light.zip")
md5sums=('e9312cbbd60fd31fd56e7399da845b47')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/solarized-light"
  cp -r ${srcdir}/fluxbox-style-solarized-light-master/solarized-light "${pkgdir}/usr/share/fluxbox/styles/"
}
