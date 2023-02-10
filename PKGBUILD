# Maintainer: Torben <git@letorbi.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=processing-examples
pkgver=4.1.3
pkgrel=1
arch=('any')
pkgdesc="Examples for Processing"
url='https://www.processing.org/'
license=(GPL LGPL)
source=("https://github.com/processing/processing4/releases/download/processing-$((1288+${pkgver##4.1.}))-$pkgver/processing-${pkgver}-linux-x64.tgz")
sha256sums=('c9dfd6989414b119eef21e535ebcd488de8f8fe868fe5a83fb2397a81fc6785e')

package() {
  install -d "${pkgdir}/usr/share/processing/modes/java"
  cp -r "processing-${pkgver}/modes/java/examples" "${pkgdir}/usr/share/processing/modes/java"
}
