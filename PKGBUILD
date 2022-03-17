# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-babelstone-roman
pkgver=14.001
pkgrel=1
pkgdesc="BabelStone Font for Latin script"
url="https://www.babelstone.co.uk/Fonts/Roman.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneRoman.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")
md5sums=('fce23951dd7a2e68bfdab8d06a90d8f7'
           'f516c91719ef90db6c942f8ac6efde47')

package() {
  install -Dm644 BabelStoneRoman.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
