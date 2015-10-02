# Contributor: favonia
# Maintainer: kaptoxic

pkgname=mathpartir
pkgver=1.3
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="LaTeX package for typesetting type inference rules"
arch=('any')
url="http://cristal.inria.fr/~remy/latex/"
options=(!strip)
install=texlive.install
source=('http://cristal.inria.fr/~remy/latex/mathpartir.tgz')
md5sums=('aa2b95890d49f74c1babb60da2f7e84c')

package() {
  local lib="$pkgdir"/usr/share/texmf-dist/tex/latex
  local doc="$pkgdir"/usr/share/doc/mathpartir
  install -m755 -d "$lib" "$doc"
  install -m644 -t "$lib" mathpartir.sty
  install -m644 -t "$doc" mathpartir.dvi  mathpartir.pdf  mathpartir.ps.gz  mathpartir.tex
}
