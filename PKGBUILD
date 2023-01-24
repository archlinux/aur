# Maintainer: Torben <git@letorbi.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=processing-examples
pkgver=4.1.2
pkgrel=1
arch=('any')
pkgdesc="Examples for Processing"
url='https://www.processing.org/'
license=(GPL LGPL)
source=("https://github.com/processing/processing4/releases/download/processing-$((1288+${pkgver##4.1.}))-$pkgver/processing-${pkgver}-linux-x64.tgz")
sha256sums=('da70e4127cca281908f65686442a45677bbbea6819daef5f021a35502b5e42a9')

package() {
  install -d "${pkgdir}/usr/share/processing/modes/java"
  cp -r "processing-${pkgver}/modes/java/examples" "${pkgdir}/usr/share/processing/modes/java"
}
