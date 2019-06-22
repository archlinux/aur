# Maintainer: Gaeulbyul <aeiou256 at gmail dot com>

pkgname=ttf-neodgm
pkgver=1.3.0
pkgrel=1
pkgdesc="TrueType port of a good-old Korean bitmap font, with enhancements."
arch=('any')
url="http://dalgona.hontou.moe/neodgm/"
license=('OFL')
install=ttf-neodgm.install
source=("https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm.ttf")
sha256sums=('fb4344511dec62d6519319142520d11faaee538b9212aa4a6b9dbf399e91eabe')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm.ttf $pkgdir/usr/share/fonts/TTF/
}
