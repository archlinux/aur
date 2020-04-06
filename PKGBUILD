# $Id$
# Maintainer: Chee Sing Lee <cheesinglee@gmail.com>

pkgname=ttf-tangut-yinchuan
pkgver=13.000
pkgrel=1
pkgdesc="BabelStone Font for Unicode Tangut Script characters"
url="http://www.babelstone.co.uk/Fonts/Yinchuan.html"
arch=(any)
license=(custom)
_tarname=source-code-pro-${_relver//\//-}
source=("http://babelstone.co.uk/Fonts/Download/TangutYinchuan.ttf" "LICENSE.txt")
sha256sums=('817cb6f8e461c54ee62bdeb0247e2c41a1c86601e90356b7f59718dc4f53d63e'
            'd407eeb3117961f7af03a662b50dfa421c8cd2118114d3c3799640ae98e63596')


package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -t "$pkgdir/usr/share/fonts/TTF" -m644 TangutYinchuan.ttf
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}