# $Id$
# Maintainer: Chee Sing Lee <cheesinglee@gmail.com>

pkgname=ttf-tangut-yinchuan
pkgver=14.001
pkgrel=1
pkgdesc="BabelStone Font for Unicode Tangut Script characters"
url="http://www.babelstone.co.uk/Fonts/Yinchuan.html"
arch=(any)
license=(custom)
_tarname=source-code-pro-${_relver//\//-}
source=("http://babelstone.co.uk/Fonts/Download/TangutYinchuan.ttf" "LICENSE.txt")
sha256sums=('a2b2f835544e941bc13f150d0d06b72653f7d3b6224e7bafa32192c701808c62'
            'd407eeb3117961f7af03a662b50dfa421c8cd2118114d3c3799640ae98e63596')


package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -t "$pkgdir/usr/share/fonts/TTF" -m644 TangutYinchuan.ttf
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}