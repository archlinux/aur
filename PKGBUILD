# Contributor: Jan Oliver Oelerich <jan.oliver.oelerich@physik.uni-marburg.de>

pkgname=latex-template-pss
pkgver=1
pkgrel=1
pkgdesc="LaTeX template for the physica status solidi journal"
arch=('any')
url="http://www.wiley-vch.de/publish/en/journals/alphabeticIndex/2133/?jURL=http://www.wiley-vch.de:80/vch/journals/2133/2133_authors.html"
license=('')
groups=()
depends=('texlive-core')
makedepends=('unzip')
optdepends=()
backup=()
install=texlive.install
options=()
source=(http://www.wiley-vch.de/vch/journals/2133/public/pss_template_latex.zip)
md5sums=('a1e5820088aa0417f12ce085fd07caa4')


build() {
  cd ${srcdir}/pss_template_latex
  install -m 0644 -D readme.txt ${pkgdir}/usr/share/texmf-dist/tex/latex/pss/readme.txt
  install -m 0644 -D wiley2sp.cls ${pkgdir}/usr/share/texmf-dist/tex/latex/pss/wiley2sp.cls
  install -m 0644 -D w2sp-pss.clo ${pkgdir}/usr/share/texmf-dist/tex/latex/pss/w2sp-pss.clo
  install -m 0644 -D w-greek.sty ${pkgdir}/usr/share/texmf-dist/tex/latex/pss/w-greek.sty
  install -m 0644 -D pss.bst ${pkgdir}/usr/share/texmf-dist/bibtex/bst/pss/pss.bst
}
