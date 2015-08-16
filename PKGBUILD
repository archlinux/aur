# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-zukitwo
pkgver=20150815
pkgrel=2
pkgdesc="Zukitwo style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-zukitwo"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-zukitwo/archive/master.zip")
md5sums=('b61b7491510a2edd277fab5aa4907759')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/zukitwo/"
  cp -r ${srcdir}/fluxbox-style-zukitwo-master/* "${pkgdir}/usr/share/fluxbox/styles/zukitwo/"
}
