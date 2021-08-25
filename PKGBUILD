# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-babelstone-irk-bitig
pkgver=1.02
pkgrel=1
pkgdesc="BabelStone Font for Old Turkic characters used in the Irk Bitig"
url="https://www.babelstone.co.uk/Fonts/IrkBitig.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneIrkBitig.ttf"
            "https://www.babelstone.co.uk/Fonts/Download/BabelStoneIrkBitigColour.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")
md5sums=('a42958e954a57b1b3a1b49d6bb2a66b1'
            '22114aebb70a23951166239d332066c9'
           'f516c91719ef90db6c942f8ac6efde47')

package() {
  install -Dm644 *.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}