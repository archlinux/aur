# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-zukitwo
pkgver=20150815
pkgrel=3
pkgdesc="Zukitwo style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-zukitwo"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-zukitwo/archive/master.zip")
md5sums=('a2183ea2a0f6c4af9c5f5c887c7411c5')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/zukitwo/"
  cp -r ${srcdir}/fluxbox-style-zukitwo-master/* "${pkgdir}/usr/share/fluxbox/styles/zukitwo/"
}
