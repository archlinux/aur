# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-babelstone-irk-bitig
pkgver=1.01
pkgrel=1
pkgdesc="BabelStone Font for Old Turkic characters used in the Irk Bitig"
url="https://www.babelstone.co.uk/Fonts/IrkBitig.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneIrkBitig.ttf"
            "https://www.babelstone.co.uk/Fonts/Download/BabelStoneIrkBitigColour.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")
md5sums=('c2e425b4f41d2a5cb2ef91597fba17cc'
            'e7d2edfa83e6dde4381399c7cd74c01c'
           'f516c91719ef90db6c942f8ac6efde47')

package() {
  install -Dm644 *.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}