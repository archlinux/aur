# Maintainer: Massimo Pavoni (damax) <aur at massimopavoni dot dev>

pkgname=ttf-uiua386
pkgver=0.19.1
pkgrel=1
pkgdesc="Uiua font with language glyphs, inspired by APL386"
arch=(any)
url="https://www.uiua.org/"
license=('MIT')
source=(
  "https://github.com/uiua-lang/uiua/raw/$pkgver/src/assets/Uiua386.ttf"
)
sha256sums=(
  "bb18d2ea15b35d0c40d84d209f3a116cdb878c1d75de43fe8109f9d72ab81ed5"
)

package() {
  install -Dm644 "$srcdir/Uiua386.ttf" "$pkgdir/usr/share/fonts/TTF/Uiua386.ttf"
}
