# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-tangut-wenhai
pkgver=1.002
pkgrel=1
pkgdesc="BabelStone Tangut Wenhai font"
url="https://www.babelstone.co.uk/Fonts/Wenhai.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneTangutWenhai.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")
md5sums=('3d7fb66f97e5fe530504ef8736debb47'
           'f516c91719ef90db6c942f8ac6efde47')

package() {
  install -Dm644 BabelStoneTangutWenhai.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}