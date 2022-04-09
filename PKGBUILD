# Maintainer:  coolmule0 <coolmule0@hotmail.co.uk>

pkgname=tts-tengwar-sindarin
pkgver=1.0
pkgrel=1
pkgdesc="The Tengwar Sindarin TTF font family (Tolkien Elvish), by Daniel Smith. Fantasy generic font family"
license=("custom")
arch=(any)
url="https://fontsly.com/dingbats/runes-elvish/tengwar_sindarin"
source=(
  "https://fontsly.com/download/3781"
)
sha256sums=(
  6e35fd4c9770ddca6dfe82a72ecc15a3ce44c93816a43da88fec62396b337836
)
package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "SINDAR.TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "SINDARA.TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "SINDCAP1.TTF"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "SINDCAP2.TTF"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" "TengwarHelp.pdf"
}
