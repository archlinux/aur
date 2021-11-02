# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-babelstone-tibetan
pkgver=10.006
pkgrel=1
pkgdesc="BabelStone Font for Tibetan script"
url="https://www.babelstone.co.uk/Fonts/Tibetan.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneTibetan.ttf"
            "https://www.babelstone.co.uk/Fonts/Download/BabelStoneTibetanSlim.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")
md5sums=('fcd424dd31481e44fd347674593970a5'
           '4d422f942e68c3f0d7bf089109768d1b'
           'f516c91719ef90db6c942f8ac6efde47')

package() {
  install -Dm644 *.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
