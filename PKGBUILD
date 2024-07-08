# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-gulimche
pkgver=1.0
pkgrel=1
pkgdesc="gulimche Font"
arch=('any')
license=('OFL')
url="https://github.com/googlefonts/gulim"
source=("https://github.com/google/fonts/raw/main/ofl/gulimche/GulimChe-Regular.ttf")
sha256sums=('aba838ffa7d1bc8e95107f643bb0486434ca424edf020e5a5e9b32295029de6c')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
