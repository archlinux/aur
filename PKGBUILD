# Maintainer: Torben <git@letorbi.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=processing-examples
pkgver=4.0.2
pkgrel=1
arch=(any)
pkgdesc="Examples for Processing"
url='https://www.processing.org/'
license=(GPL LGPL)
source=("https://github.com/processing/processing4/releases/download/processing-$((1285+${pkgver##4.0.}))-$pkgver/processing-$pkgver-linux-x64.tgz")
sha256sums=('5f9100c21cc27d18ad9fe2b9b68002ce504d4c88af52be2de6923848a9761b3c')

package() {
  install -d "$pkgdir/usr/share/processing/modes/java"
  cp -r "processing-$pkgver/modes/java/examples" "$pkgdir/usr/share/processing/modes/java"
}
