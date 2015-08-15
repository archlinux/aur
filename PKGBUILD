# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-solarized-light
pkgver=20150815
pkgrel=1
pkgdesc="Solarized Light style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-solarized-light"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-solarized-light/archive/master.zip")
md5sums=('4b93b15da43beec8b6694f549fff2b5a')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/solarized-light/"
  cp -r ${srcdir}/fluxbox-style-solarized-light-master/* "${pkgdir}/usr/share/fluxbox/styles/solarized-light/"
}
