# Maintainer: Torben <git@letorbi.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=processing-examples
pkgver=4.2
_build=1292
pkgrel=1
arch=('any')
pkgdesc="Examples for Processing"
url='https://www.processing.org/'
license=(GPL LGPL)
source=("https://github.com/processing/processing4/releases/download/processing-${_build}-${pkgver}/processing-${pkgver}-linux-x64.tgz")
sha256sums=('8465313ef2e9bc566f248bc812691db73eadcff0b68a6e595eacaf68489282d7')

package() {
  install -d "${pkgdir}/usr/share/processing/modes/java"
  cp -r "processing-${pkgver}/modes/java/examples" "${pkgdir}/usr/share/processing/modes/java"
}
