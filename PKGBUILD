# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-batangche
pkgver=1.0
pkgrel=1
pkgdesc="batangche Font"
arch=('any')
license=('OFL')
url="https://github.com/googlefonts/batang"
source=("https://github.com/google/fonts/raw/main/ofl/batangche/BatangChe-Regular.ttf")
sha256sums=('34aff823e0d9b86e7b7cb6913612e06638812a1d9af061272510b4cbf9d4c6ba')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
