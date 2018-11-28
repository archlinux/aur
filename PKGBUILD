# $Id$
# Maintainer: Chee Sing Lee <cheesinglee@gmail.com>

pkgname=ttf-tangut-yinchuan
pkgver=11.001
pkgrel=1
pkgdesc="BabelStone Font for Unicode Tangut Script characters"
url="http://www.babelstone.co.uk/Fonts/Yinchuan.html"
arch=(any)
license=(custom)
_tarname=source-code-pro-${_relver//\//-}
source=("http://babelstone.co.uk/Fonts/9974/TangutYinchuan.ttf" "LICENSE.txt")
sha256sums=('41dfd9f89f1647bd73f7d3fc1570be12a421f6d5fea1ce15029136d55f6a0ef1'
            'd407eeb3117961f7af03a662b50dfa421c8cd2118114d3c3799640ae98e63596')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -t "$pkgdir/usr/share/fonts/TTF" -m644 TangutYinchuan.ttf
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}