# Maintainer: dllud <dllud riseup net>

pkgname=ttf-indieflower
# https://github.com/google/fonts/commit/48e30c13625133283f79042e86693a5d04c6bfa0
pkgver=2.000
pkgrel=2
pkgdesc="Handwriting sans-serif font with bubbly and rounded edges from Google Fonts."
url="https://fonts.google.com/specimen/Indie+Flower"
license=("OFL-1.1")
arch=("any")
source=("$pkgname-$pkgver.tar.gz::https://github.com/googlefonts/indieflower/archive/refs/heads/main.tar.gz")
b2sums=("b142980255c9c4400bbaab8a84ed973ec28453f26260a3922c990adab1f42f01fdf7cb680227d9964fdfc40edf05e07f711b275c41ae046957557ad73e6edb74")

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "${srcdir}/indieflower-main/fonts/IndieFlower-Regular.ttf"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "${srcdir}/indieflower-main/OFL.txt"
}
