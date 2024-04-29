# Maintainer: dllud <dllud riseup net>

pkgname=ttf-indieflower
# https://github.com/google/fonts/commit/48e30c13625133283f79042e86693a5d04c6bfa0
pkgver=2.000
pkgrel=1
pkgdesc="Handwriting sans-serif font with bubbly and rounded edges from Google Fonts."
url="https://fonts.google.com/specimen/Indie+Flower"
license=("OFL-1.1")
arch=("any")
source=("$pkgname-$pkgver.tar.gz::https://github.com/googlefonts/indieflower/archive/refs/heads/main.tar.gz")
b2sums=("5e21a805eec309b23dede52d359e97412d6610c2b12c62cee62df783128de085ec69779115d946df0b9f0a82718591cce3ef0acdb147c380a71896b63992a397")

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "${srcdir}/indieflower-main/fonts/IndieFlower-Regular.ttf"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "${srcdir}/indieflower-main/OFL.txt"
}
