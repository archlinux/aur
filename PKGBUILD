# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-solarized-light
pkgver=20150816
pkgrel=3
pkgdesc="Solarized Light style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-solarized-light"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-solarized-light/archive/master.zip")
md5sums=('a3ede014254a4b04c9571abb074eae6a')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/solarized-light/"
  cp -r ${srcdir}/fluxbox-style-solarized-light-master/* "${pkgdir}/usr/share/fluxbox/styles/solarized-light/"
}
