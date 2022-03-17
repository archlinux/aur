# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-babelstone-zanabazar
pkgver=10.002
pkgrel=1
pkgdesc="BabelStone Font for Zanabazar Square script"
url="https://www.babelstone.co.uk/Fonts/Zanabazar.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneZanabazar.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")
md5sums=('79bea5f34d05300fecbc871138998244'
           'f516c91719ef90db6c942f8ac6efde47')

package() {
  install -Dm644 BabelStoneZanabazar.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
