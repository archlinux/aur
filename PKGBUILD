# Maintainer: Gaeulbyul <aeiou256 at gmail dot com>

pkgname=ttf-neodgm
pkgver=1.600
pkgrel=1
pkgdesc='TrueType port of a good-old Korean bitmap font, with enhancements.'
arch=('any')
url='https://neodgm.dalgona.dev/'
license=('OFL')
source=("https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm.ttf"
        "https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm_code.ttf")
sha256sums=('d61b60eccb731f8ca9c7da582e4a05a94db66b570471809950aa9a7261b941d6'
            '3d58bf707f06bcebefb57355197efe31a89cd20d48a9cb5bb6e2e4758d830b23')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm.ttf $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm_code.ttf $pkgdir/usr/share/fonts/TTF/
}
