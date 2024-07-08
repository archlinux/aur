# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-gungsuhche
pkgver=1.0
pkgrel=1
pkgdesc="gungsuhche Font"
arch=('any')
license=('OFL')
url="https://github.com/googlefonts/batang"
source=("https://github.com/google/fonts/raw/main/ofl/gungsuhche/GungsuhChe-Regular.ttf")
sha256sums=('ad7744ead7cb467fa12ffc565d1ba864a1a2f972c1bea1e3208062c369982c64')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
