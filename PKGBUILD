# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-babelstone-marchen
pkgver=9.001
pkgrel=1
pkgdesc="BabelStone Font for sMar-chen script"
url="https://www.babelstone.co.uk/Fonts/IrkBitig.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneMarchen.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")
md5sums=('5854acecdca7d787f968fa0b6563379f'
           'f516c91719ef90db6c942f8ac6efde47')

package() {
  install -Dm644 BabelStoneMarchen.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}