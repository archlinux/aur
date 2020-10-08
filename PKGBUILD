# Maintainer: Gaeulbyul <aeiou256 at gmail dot com>

pkgname=ttf-neodgm
pkgver=1.510
pkgrel=2
pkgdesc='TrueType port of a good-old Korean bitmap font, with enhancements.'
arch=('any')
url='https://neodgm.dalgona.dev/'
license=('OFL')
install=ttf-neodgm.install
source=("https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm.ttf"
        "https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm_code.ttf")
sha256sums=('16f5ccff456d2a4e1baec5315e263a177c2a2dbfae265a01084f6b7f9a532a44'
            '9a7465b01f006e3b4720a594e114a2985e7aba8694a54ce752baa76dbb677fc6')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm.ttf $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm_code.ttf $pkgdir/usr/share/fonts/TTF/
}
