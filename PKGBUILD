# Original author: Josiah Schwab <jschwab at gmail dot com>

pkgname=texlive-aas_macros
pkgver=1.0
pkgrel=1
depends=('texlive-core')
pkgdesc="Journal abbreviation macros used by ADS"
url="http://doc.adsabs.harvard.edu/abs_doc/aas_macros.sty"
arch=('any')
install=texlive-aas_macros.install
source=(http://doc.adsabs.harvard.edu/abs_doc/aas_macros.sty)
sha1sums=('34e5a77cbf69f889652c45b23f1436ede40dd118')

package()
{
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/aas_macros
  cp $srcdir/aas_macros.sty $pkgdir/usr/share/texmf/tex/latex/aas_macros
}

