# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: Josiah Schwab <jschwab at gmail dot com>

pkgname=texlive-aas_macros
pkgver=1.0
pkgrel=3
depends=('texlive-core')
pkgdesc="Journal abbreviation macros used by ADS"
url="https://ui.adsabs.harvard.edu/help/actions/journal-macros"
arch=('any')
install=texlive-aas_macros.install
source=(https://adsabs.harvard.edu/abs_doc/aas_macros.sty)
sha256sums=('5f67d3f37c666685a19c4e4f3722fdac9adb95b97c12b4470ad73e64805f54ce')

package()
{
    mkdir -p $pkgdir/usr/share/texmf/tex/latex/aas_macros
    cp $srcdir/aas_macros.sty $pkgdir/usr/share/texmf/tex/latex/aas_macros
}

