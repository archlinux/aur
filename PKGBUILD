# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-dotumche
pkgver=1.0
pkgrel=1
pkgdesc="dotumche Font"
arch=('any')
license=('OFL')
url="https://github.com/googlefonts/gulim"
source=("https://github.com/google/fonts/raw/main/ofl/dotumche/DotumChe-Regular.ttf")
sha256sums=('c2c030ca896d46ff28dae17663e9fe22ab2fc6e6518c96d75e15ca8fb441bd2f')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
