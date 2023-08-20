# Maintainer: Torben <git@letorbi.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=processing-examples
pkgver=4.3
_build=1293
pkgrel=1
arch=('any')
pkgdesc="Examples for Processing"
url='https://www.processing.org/'
license=(GPL LGPL)
source=("https://github.com/processing/processing4/releases/download/processing-${_build}-${pkgver}/processing-${pkgver}-linux-x64.tgz")
sha256sums=('3f655b3076158148e7ca9ac94a380d35b925436a5829e9d653715a3146ef3e33')

package() {
  install -d "${pkgdir}/usr/share/processing/modes/java"
  cp -r "processing-${pkgver}/modes/java/examples" "${pkgdir}/usr/share/processing/modes/java"
}
