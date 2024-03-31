# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-babelstone-tibetan
pkgver=10.011
pkgrel=1
pkgdesc="BabelStone Font for Tibetan script"
url="https://www.babelstone.co.uk/Fonts/Tibetan.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneTibetan.ttf"
            "https://www.babelstone.co.uk/Fonts/Download/BabelStoneTibetanSlim.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")
sha256sums=('6791BAB3919DFB16DE9223817B40E3786FD567427A77790ECB17B4EFE66FA667'
           'E5D86891D81FC052434EA1F03A7353354AECEE6F10373DD4A9F34C7CA23EBE1C'
           'D2B1B6E4E9201832E94E6F9231B6C32488CB76EA30C4EF82CA3FAC35EC2F0B66')

package() {
  install -Dm644 *.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
