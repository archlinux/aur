# Maintainer: Gaeulbyul <aeiou256 at gmail dot com>

pkgname=ttf-neodgm
pkgver=1.1.0
pkgrel=1
pkgdesc="TrueType port of a good-old Korean bitmap font, with enhancements."
arch=('any')
url="http://dalgona.hontou.moe/neodgm/"
license=('OFL')
install=ttf-neodgm.install
source=("https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm.ttf")
sha256sums=('caaa325dca0ec82244689dcca85b51fcee3f1295267d445e1c9e98b33c6d81d2')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm.ttf $pkgdir/usr/share/fonts/TTF/
}
