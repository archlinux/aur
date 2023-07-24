# Maintainer: dllud <dllud riseup net>

pkgname=ttf-indieflower
# fc-query -f '%{fontversion[0]}\n' IndieFlower-Regular.ttf
pkgver=65602
pkgrel=2
pkgdesc="Handwriting sans-serif font with bubbly and rounded edges from Google Fonts."
url="https://fonts.google.com/specimen/Indie+Flower"
license=("OFL")
arch=("any")
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Indie%20Flower")
b2sums=("137410f8ede833df099aaa673762e81132c60d51fa086c5505089cee8a18e5e13c222c3324c782b8ef5d6f9ba81fc2f6ba4f2605f4f1f0542ebe01eadcc454d9")

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "${srcdir}/IndieFlower-Regular.ttf"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "${srcdir}/OFL.txt"
}
