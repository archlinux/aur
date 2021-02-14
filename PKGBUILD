# Maintainer: Gaeulbyul <aeiou256 at gmail dot com>

pkgname=ttf-neodgm
pkgver=1.520
pkgrel=2
pkgdesc='TrueType port of a good-old Korean bitmap font, with enhancements.'
arch=('any')
url='https://neodgm.dalgona.dev/'
license=('OFL')
install=ttf-neodgm.install
source=("https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm.ttf"
        "https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm_code.ttf")
sha256sums=('d119c77522671e820f53c6f885003261477fafb7af251f77a69119fb3a0288a7'
            '4b0f13412a090737464077e47322c58e2557486be0d6359cdf334166c82a77da')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm.ttf $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm_code.ttf $pkgdir/usr/share/fonts/TTF/
}
