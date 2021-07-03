# Maintainer: dllud <dllud riseup net>

pkgname=ttf-indieflower
# fc-query -f '%{fontversion[0]}\n' IndieFlower-Regular.ttf
pkgver=65602
pkgrel=1
pkgdesc="Handwriting sans-serif font with bubbly and rounded edges from Google Fonts."
url="https://fonts.google.com/specimen/Indie+Flower"
license=("OFL")
arch=("any")
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Indie%20Flower")
b2sums=("a5775199e73d62c04f02f046d51219b190fcf85fcc4499fd31e10b17bace68cc4f71e080254af52ba938f5cbccbfc830dd7c9a92c925ee47fdcd4aab6ee18e78")

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "${srcdir}/IndieFlower-Regular.ttf"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "${srcdir}/OFL.txt"
}
