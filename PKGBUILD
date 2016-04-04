# Maintainer: kaptoxic
# Contributor: kaptoxic
# Contributor: favonia

pkgname=mathpartir
pkgver=1.3.1
pkgrel=2
license=('GPL')
depends=('texlive-core')
pkgdesc="LaTeX package for typesetting type inference rules"
arch=('any')
url="http://cristal.inria.fr/~remy/latex/"
options=(!strip)
install=texlive.install
source=('http://cristal.inria.fr/~remy/latex/mathpartir.tgz')
md5sums=('3f670db71394a86c87042682c128c977')

package() {
  local lib="$pkgdir"/usr/share/texmf-dist/tex/latex
  local doc="$pkgdir"/usr/share/doc/mathpartir
  install -m755 -d "$lib" "$doc"
  install -m644 -t "$lib" mathpartir.sty
  install -m644 -t "$doc" mathpartir.pdf  mathpartir.tex
}
