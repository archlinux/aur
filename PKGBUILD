# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-zukitwo
pkgver=20150815
pkgrel=1
pkgdesc="Zukitwo style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-zukitwo"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-zukitwo/archive/master.zip")
md5sums=('f34cfaab090cb02a1c73d6770e1bd52f')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/zukitwo/"
  cp -r ${srcdir}/fluxbox-style-zukitwo-master/* "${pkgdir}/usr/share/fluxbox/styles/zukitwo/"
}
