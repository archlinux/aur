# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-babelstone-roman
pkgver=16.000
pkgrel=1
pkgdesc="BabelStone Font for Latin script"
url="https://www.babelstone.co.uk/Fonts/Roman.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneRoman.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")

package() {
  install -Dm644 BabelStoneRoman.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('ffa5663ef462ac7510587cb1bd93ca1d2173567006c0a19a654c48c28cce8a6a'
            'd2b1b6e4e9201832e94e6f9231b6c32488cb76ea30c4ef82ca3fac35ec2f0b66')
