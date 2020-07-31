# Maintainer: Gaeulbyul <aeiou256 at gmail dot com>

pkgname=ttf-neodgm
pkgver=1.50
pkgrel=2
pkgdesc='TrueType port of a good-old Korean bitmap font, with enhancements.'
arch=('any')
url='https://neodgm.dalgona.dev/'
license=('OFL')
install=ttf-neodgm.install
source=("https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm.ttf"
        "https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm_code.ttf")
sha256sums=('67765532d17afe0c5b81bd0f6109e0d2619ba2f15c860f3e8cc9b561287a5b28'
            '08982324e81355aca5cc0b40edad9520ccacab4457dd40b45847d6d62cdefcb0')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm.ttf $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm_code.ttf $pkgdir/usr/share/fonts/TTF/
}
