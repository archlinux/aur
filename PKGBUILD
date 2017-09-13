# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=jaxodraw-latex
pkgver=2008_11_19
pkgrel=1
pkgdesc="A particle physics LaTeX package for drawing Feynman diagrams."
arch=(any)
url="http://jaxodraw.sourceforge.net/"
license=('GPL2')
depends=('texlive-core')
source=(https://downloads.sourceforge.net/project/jaxodraw/axodraw4j/axodraw4j_${pkgver}/axodraw4j_${pkgver}.tar.gz)
md5sums=('12a1aef54381e0d44946324a0cbfce54')

package() {
        install -Dm644 $srcdir/axodraw4j.sty $pkgdir/usr/share/texmf/tex/latex/axodraw4j/axodraw4j.sty
}
