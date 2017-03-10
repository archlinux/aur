# Original author: Josiah Schwab <jschwab at gmail dot com>

pkgname=texlive-aas_macros
pkgver=1.0
pkgrel=2
depends=('texlive-core')
pkgdesc="Journal abbreviation macros used by ADS"
url="http://doc.adsabs.harvard.edu/abs_doc/aas_macros.sty"
arch=('any')
install=texlive-aas_macros.install
source=(http://doc.adsabs.harvard.edu/abs_doc/aas_macros.sty)
sha1sums=('247c552534aaa55605789b3243ea0ade0838bc2c')

package()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/aas_macros
  cp $srcdir/aas_macros.sty $pkgdir/usr/share/texmf/tex/latex/aas_macros
}

