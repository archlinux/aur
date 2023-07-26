# Maintainer: knedl1k <knedl1k at duck dot com>
# Contributor: Jan Oliver Oelerich <jan.oliver.oelerich@physik.uni-marburg.de>

pkgname=latex-template-pss
pkgver=2
pkgrel=1
pkgdesc="LaTeX template for the physica status solidi journal"
arch=('any')
url="https://www.wiley-vch.de/publish/en/journals/alphabeticIndex/2133/?jURL=http://www.wiley-vch.de:80/vch/journals/2133/2133_authors.html"
license=()
groups=()
depends=('texlive-basic')
makedepends=('unzip')
optdepends=()
backup=()
install=texlive.install
options=()
source=(https://www.wiley-vch.de/vch/journals/2133/public/pss_template_latex.zip)
md5sums=('570b8eb99f55e4c01aa397dd49745d35')


package(){
  cd ${srcdir}/PSS_latex
  install -m 0644 -D readme.txt ${pkgdir}/usr/share/texmf-dist/tex/latex/pss/readme.txt
  install -m 0644 -D wiley2sp.cls ${pkgdir}/usr/share/texmf-dist/tex/latex/pss/wiley2sp.cls
  install -m 0644 -D w2sp-pss.clo ${pkgdir}/usr/share/texmf-dist/tex/latex/pss/w2sp-pss.clo
  install -m 0644 -D pss.bst ${pkgdir}/usr/share/texmf-dist/bibtex/bst/pss/pss.bst
  install -m 0644 -D caption.sty ${pkgdir}/usr/share/texmf-dist/bibtex/bst/pss/caption.sty
  install -m 0644 -D caption3.sty ${pkgdir}/usr/share/texmf-dist/bibtex/bst/pss/caption3.sty
  install -m 0644 -D subfig.sty ${pkgdir}/usr/share/texmf-dist/bibtex/bst/pss/subfig.sty
}
