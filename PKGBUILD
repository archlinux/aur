# Contributor: knedl1k <knedl1k at duck dot com>
# Contributor: Jan Oliver Oelerich <jan.oliver.oelerich@physik.uni-marburg.de>

pkgname=latex-template-pss
pkgver=2
pkgrel=2
pkgdesc="LaTeX template for the physica status solidi journal"
arch=('any')
url="https://www.wiley-vch.de/en/shop/journals/212"
license=('unknown')
depends=('texlive-latexrecommended' 'texlive-fontsrecommended')
source=("https://www.wiley-vch.de/vch/journals/2133/public/pss_template_latex.zip")
sha256sums=('70660a55990eeb9c9d12deca1319020d80642c43cfdee5fd09b8a077c478f9a2')

package(){
  cd PSS_latex
  install -Dm644 -t "${pkgdir}/usr/share/texmf-dist/tex/latex/pss" wiley2sp.cls w2sp-pss.clo
  install -Dm644 -t "${pkgdir}/usr/share/texmf-dist/bibtex/bst/pss" pss.bst
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" readme.txt \
                     pss_demo.pdf pss_demo.tex pss_demo.bib \
                     empty2h.eps empty2h.pdf empty2w.eps empty2w.pdf
}
