# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-solarized-light
pkgver=20150814
pkgrel=4
pkgdesc="Solarized Light style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-solarized-light"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-solarized-light/archive/master.zip")
md5sums=('9c0645bd804190e8d99e049b35f6e31e')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/solarized-light/"
  cp -r ${srcdir}/fluxbox-style-solarized-light-master/* "${pkgdir}/usr/share/fluxbox/styles/solarized-light/"
}
