# Maintainer: Joshua Hunt <joshua.edward.hunt@gmail.com>
pkgname="tikz-cd"
pkgver="0.9f"
pkgrel=1
pkgdesc="A TeX package to create commutative diagrams with TikZ"
arch=(any)
url="https://www.ctan.org/tex-archive/graphics/pgf/contrib/tikz-cd"
license=('GPL')
install=tikz-cd.install
depends=(texlive-core)
source=("http://mirrors.ctan.org/graphics/pgf/contrib/tikz-cd/tikz-cd.sty" \
	"http://mirrors.ctan.org/graphics/pgf/contrib/tikz-cd/tikzlibrarycd.code.tex")
sha256sums=('82b1d5e7e78a801982f9f581dccc23b3d8abe77f1cc28bcbc4f722d6353e7295'
            'e7b1ad561696b2485f7c20eb4e36ea04090633ee59cface287d70e6f409f6173')

package() {
	mkdir -p "${pkgdir}/usr/share/texmf-dist/tex/latex/tikz-cd"
	install -D -m 644 tikz-cd.sty "${pkgdir}/usr/share/texmf-dist/tex/latex/tikz-cd/tikz-cd.sty"
	install -D -m 644 tikzlibrarycd.code.tex "${pkgdir}/usr/share/texmf-dist/tex/generic/pgf/frontendlayer/tikz/libraries/tikzlibrarycd.code.tex"
}
