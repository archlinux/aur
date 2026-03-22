# Maintainer: Gaeulbyul <gaeulbyul at duck dot com>

pkgname=ttf-neodgm
pkgver=1.601
pkgrel=1
pkgdesc='TrueType port of a good-old Korean bitmap font, with enhancements.'
arch=('any')
url='https://neodgm.dalgona.dev/'
license=('OFL')
source=("https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm.ttf"
        "https://github.com/Dalgona/neodgm/releases/download/v${pkgver}/neodgm_code.ttf")
sha256sums=('77305267996073aae07bad9313dad2e306a4128e55bfafbed4c41558fee57b4d'
            '0d19cda34cba2c68137d4328820b743141279f8533b5624521f7b325e270a265')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm.ttf $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm_code.ttf $pkgdir/usr/share/fonts/TTF/
}
