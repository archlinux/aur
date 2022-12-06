# Maintainer: Florian Meinicke <aur at fmeinicke dot xyz>

pkgname=pgf-umlcd
pkgver=0.3
pkgrel=1
pkgdesc="Some LaTeX macros for UML Class Diagrams"
url="https://www.ctan.org/pkg/pgf-umlcd"
license=('GPL3')
arch=('any')
depends=('texlive-core')
install=${pkgname}.install
source=("https://github.com/pgf-tikz/pgf-umlcd/raw/master/tex/latex/pgf-umlcd/pgf-umlcd.sty" "https://github.com/pgf-tikz/pgf-umlcd/raw/master/tex/latex/pgf-umlcd/tikzlibraryumlcd.code.tex")
sha1sums=('63989b6a628cd7e01fdf2c24d3907bd4d919d0aa' 'ab1651510a6b391843a8cc32796cb63bbcb47aa0')

package() {
  install -Dm644 "${srcdir}/${pkgname}.sty" "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}/${pkgname}.sty"
  install -Dm644 "${srcdir}/tikzlibraryumlcd.code.tex" "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}/tikzlibraryumlcd.code.tex"
}
