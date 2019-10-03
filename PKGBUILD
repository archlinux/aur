# Maintainer: Gaeulbyul <aeiou256 at gmail dot com>

pkgname=ttf-neodgm
pkgver=1.40
pkgrel=1
pkgdesc="TrueType port of a good-old Korean bitmap font, with enhancements."
arch=('any')
url="http://dalgona.hontou.moe/neodgm/"
license=('OFL')
install=ttf-neodgm.install
source=("https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm.ttf"
        "https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm_code.ttf")
sha256sums=('e6a50ae85e9cfccce9a03d2db86e245df8586b2baa5fa11b5112690e665952b8'
            '57788cfd4f69de7f84d8b3191635747efe2d7beb1512093ce9cfe5ddb150be3a')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm.ttf $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm_code.ttf $pkgdir/usr/share/fonts/TTF/
}
