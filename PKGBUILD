# Maintainer: Gaeulbyul <aeiou256 at gmail dot com>

pkgname=ttf-neodgm
pkgver=1.41
pkgrel=1
pkgdesc="TrueType port of a good-old Korean bitmap font, with enhancements."
arch=('any')
url="http://dalgona.hontou.moe/neodgm/"
license=('OFL')
install=ttf-neodgm.install
source=("https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm.ttf"
        "https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm_code.ttf")
sha256sums=('a52d56369aeceda7b1def4b70c8da961ede1ab248e2b67ff967da920922df88d'
            '3a8ef6618014198f687dbb1f494b3f2463b0a52f2b19950ae9d8c71bff9c46e0')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm.ttf $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm_code.ttf $pkgdir/usr/share/fonts/TTF/
}
