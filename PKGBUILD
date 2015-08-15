# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-solarized-light
pkgver=20150815
pkgrel=2
pkgdesc="Solarized Light style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-solarized-light"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-solarized-light/archive/master.zip")
md5sums=('cb275804f96db4ff1f332ca459ca4442')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/solarized-light/"
  cp -r ${srcdir}/fluxbox-style-solarized-light-master/* "${pkgdir}/usr/share/fluxbox/styles/solarized-light/"
}
