# Maintainer: moviuro <moviuro.aur@popho.be>

pkgname=ttf-goldmansans
# No "official" pkgver, we take the most recent date from all files in the
# archive: bsdtar tvf [...]
pkgver=2021.09.17
pkgrel=1
pkgdesc="Goldman Sans is a clean, modern sans-serif typeface designed for dense data-rich environments."
arch=('any')
url="https://design.gs.com/foundation/typography/goldman-sans"
license=('custom')
source=('https://design.gs.com/GoldmanSans.zip')
sha512sums=('6cdc4199ce89ba2977913d419ba833af8b12f531d53bf4f73aeacdedbeb1b9eaa6d39f57bc86697ec106a7d0cf9c93f34afab0adcd29a2c6ad7ad183a69e41a8')

package() {
  find "$srcdir/GoldmanSans/" -name '*.ttf' | xargs install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "$srcdir/GoldmanSans/License_GoldmanSans.pdf" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
