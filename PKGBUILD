# Contributor: favonia

pkgname=mathpartir
pkgver=1.2
pkgrel=4
license=('GPL')
depends=('texlive-core')
pkgdesc="LaTeX package for typesetting type inference rules"
arch=('any')
url="http://cristal.inria.fr/~remy/latex/"
options=(!strip)
install=texlive.install
source=('http://cristal.inria.fr/~remy/latex/mathpartir.tgz')
md5sums=('02f5556a17778c4bd79aa7d4e1962ba4')

package() {
  local lib="$pkgdir"/usr/share/texmf-dist/tex/latex
  local doc="$pkgdir"/usr/share/doc/mathpartir
  install -m755 -d "$lib" "$doc"
  install -m644 -t "$lib" mathpartir.sty
  install -m644 -t "$doc" mathpartir.dvi  mathpartir.pdf  mathpartir.ps.gz  mathpartir.tex
}
