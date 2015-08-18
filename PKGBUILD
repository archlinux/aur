# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-hellbent
pkgver=20150818
pkgrel=1
pkgdesc="Hellbent style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-hellbent"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-hellbent/archive/master.zip")
md5sums=('36ea04b497d0664e8ab3e0ed4a59592b')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/hellbent/"
  cp -r ${srcdir}/fluxbox-style-hellbent-master/* "${pkgdir}/usr/share/fluxbox/styles/"
}
