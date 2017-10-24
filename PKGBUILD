# Maintainer: Gaeulbyul <aeiou256 at gmail dot com>

pkgname=ttf-neodgm
pkgver=1.2.0
pkgrel=1
pkgdesc="TrueType port of a good-old Korean bitmap font, with enhancements."
arch=('any')
url="http://dalgona.hontou.moe/neodgm/"
license=('OFL')
install=ttf-neodgm.install
source=("https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm.ttf")
sha256sums=('555640c2315190b55e7ecc823bb76692cfd1bcd2b3e1a12749beb8ba70445d55')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm.ttf $pkgdir/usr/share/fonts/TTF/
}
