# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=ttf-gungsuh
pkgver=1.0
pkgrel=1
pkgdesc="gungsuh Font"
arch=('any')
license=('OFL')
url="https://github.com/googlefonts/batang"
source=("https://github.com/google/fonts/raw/main/ofl/gungsuh/Gungsuh-Regular.ttf")
sha256sums=('e0887c3b3a92f0ebc604cbd5e94ad6d0dad4ed3ffa624f6bae9a95f2d4d06735')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
