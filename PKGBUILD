# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=fontawesome.sty
pkgver=4.6.3.1
pkgrel=1
pkgdesc="FontAwesome bindings for LaTeX"
url='http://www.ctan.org/pkg/fontawesome'
arch=('any')
license=('LPPL')
depends=('texlive-core' 'otf-font-awesome')
source=('http://mirrors.ctan.org/fonts/fontawesome/tex/fontawesome.sty'
        'http://mirrors.ctan.org/fonts/fontawesome/tex/fontawesomesymbols-generic.tex'
        'http://mirrors.ctan.org/fonts/fontawesome/tex/fontawesomesymbols-pdftex.tex'
        'http://mirrors.ctan.org/fonts/fontawesome/tex/fontawesomesymbols-xeluatex.tex')
md5sums=('ee97743276dc242c78f33fd622e260ea'
         '40b369fd6c8364bdcc88401c4c1db5bf'
         'f7ffa71c62c5257edd5542253d4cea15'
         '7166bfdff927bad3f81e302543d76c90')
install=fontawesome.install

package() {
  install -Dm644 fontawesome.sty $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesome.sty
  install -m644 fontawesomesymbols-generic.tex $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesomesymbols-generic.tex
  install -m644 fontawesomesymbols-pdftex.tex $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesomesymbols-pdftex.tex
  install -m644 fontawesomesymbols-xeluatex.tex $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesomesymbols-xeluatex.tex
}
