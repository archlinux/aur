# Maintainer: Joshua Hunt <snark 1994 at google mail dot com>
pkgname="tikz-cd"
pkgver="0.9e"
pkgrel=1
pkgdesc="A TeX package to create commutative diagrams with TikZ"
arch=(any)
url="https://www.ctan.org/tex-archive/graphics/pgf/contrib/tikz-cd"
license=('GPL')
install=(tikz-cd.install)
depends=(texlive-core)
source=("http://mirrors.ctan.org/graphics/pgf/contrib/tikz-cd/tikz-cd.sty" \
	"http://mirrors.ctan.org/graphics/pgf/contrib/tikz-cd/tikzlibrarycd.code.tex")
sha256sums=('8cb3291cae64abbf39c77879b7d9667ee795cd7e00f963b8d1c4115a96303736'
            'bb394051ed13174abf1a6facb046011eab4ce83bd8566f8d60b7663713046553')

package() {
	mkdir -p "${pkgdir}/usr/share/texmf-dist/tex/latex/tikz-cd"
	install -D -m 644 tikz-cd.sty "${pkgdir}/usr/share/texmf-dist/tex/latex/tikz-cd/tikz-cd.sty"
	install -D -m 644 tikzlibrarycd.code.tex "${pkgdir}/usr/share/texmf-dist/tex/generic/pgf/frontendlayer/tikz/libraries/tikzlibrarycd.code.tex"
}
