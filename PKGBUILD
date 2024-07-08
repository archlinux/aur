# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-batang
pkgver=1.0
pkgrel=1
pkgdesc="batang Font"
arch=('any')
license=('OFL')
url="https://github.com/googlefonts/batang"
source=("https://github.com/google/fonts/raw/main/ofl/batang/Batang-Regular.ttf")
sha256sums=('0929031e799b2feadda22208c58f503515e6f8fa2eaba75acd2e6847d73fc54b')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
