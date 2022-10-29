# Maintainer: Torben <git@letorbi.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=processing-examples
pkgver=4.0.1
pkgrel=1
arch=(any)
pkgdesc="Examples for Processing"
url='https://www.processing.org/'
license=(GPL LGPL)
source=("https://github.com/processing/processing4/releases/download/processing-$((1285+${pkgver##4.0.}))-$pkgver/processing-$pkgver-linux-x64.tgz")
sha256sums=('e9067c0b39511c85c1a58b3f59dd33918509ecb824657584e9660ad337fe0136')

package() {
  install -d "$pkgdir/usr/share/processing/modes/java"
  cp -r "processing-$pkgver/modes/java/examples" "$pkgdir/usr/share/processing/modes/java"
}
