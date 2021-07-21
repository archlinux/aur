# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-babelstone-tibetan
pkgver=10.005
pkgrel=1
pkgdesc="BabelStone Font for Tibetan script"
url="https://www.babelstone.co.uk/Fonts/Tibetan.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneTibetan.ttf"
            "https://www.babelstone.co.uk/Fonts/Download/BabelStoneTibetanSlim.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")
md5sums=('d01817805b1ce1c7e7db92b66e0eb33d'
           'd54f750fcf136e64e256f6d2f025344a'
           'f516c91719ef90db6c942f8ac6efde47')

package() {
  install -Dm644 *.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}