# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-babelstone-tibetan
pkgver=10.010
pkgrel=1
pkgdesc="BabelStone Font for Tibetan script"
url="https://www.babelstone.co.uk/Fonts/Tibetan.html"
arch=(any)
license=(OFL)
source=("https://www.babelstone.co.uk/Fonts/Download/BabelStoneTibetan.ttf"
            "https://www.babelstone.co.uk/Fonts/Download/BabelStoneTibetanSlim.ttf"
            "https://www.babelstone.co.uk/Fonts/BabelStoneOFL.txt")
sha256sums=('ACF0AD1D08403708E71C0CE441703E8954784180D74D6B90CBEA846C20847F63'
           '8F516F5FC455C82C7EF6BE185B90FD2DB567FC5765EE7026B0483107407189DA'
           'D2B1B6E4E9201832E94E6F9231B6C32488CB76EA30C4EF82CA3FAC35EC2F0B66')

package() {
  install -Dm644 *.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 BabelStoneOFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
