# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-dotum
pkgver=1.0
pkgrel=1
pkgdesc="Dotum Font"
arch=('any')
license=('OFL')
url="https://github.com/googlefonts/gulim"
source=("https://github.com/google/fonts/raw/main/ofl/dotum/Dotum-Regular.ttf")
sha256sums=('12f749ac462e547e3f4073227bb3b2b4c116062fc7546fbdadaa04e5e9f88b12')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
