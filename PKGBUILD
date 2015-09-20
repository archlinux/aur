# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=fontawesome.sty
pkgver=4.4.0
pkgrel=2
pkgdesc="FontAwesome bindings for LaTeX"
url='http://www.ctan.org/pkg/fontawesome'
arch=('any')
license=('LPPL')
depends=('texlive-core' 'otf-font-awesome')
source=('http://mirrors.ctan.org/fonts/fontawesome/tex/fontawesome.sty'
        'http://mirrors.ctan.org/fonts/fontawesome/tex/fontawesomesymbols-generic.tex'
        'http://mirrors.ctan.org/fonts/fontawesome/tex/fontawesomesymbols-pdftex.tex'
        'http://mirrors.ctan.org/fonts/fontawesome/tex/fontawesomesymbols-xeluatex.tex')
md5sums=('e6a4b85730ead959e96981926c2c8ea6'
         'caeb6b3b881647c34b4edc7d58ee59d1'
         'be79a4683f4459eba32950b0914592d3'
         '1e3cc737ddbdfc2f5b04f766c2a273e1')
install=fontawesome.install

package() {
  install -Dm644 fontawesome.sty $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesome.sty
  install -m644 fontawesomesymbols-generic.tex $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesomesymbols-generic.tex
  install -m644 fontawesomesymbols-pdftex.tex $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesomesymbols-pdftex.tex
  install -m644 fontawesomesymbols-xeluatex.tex $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesomesymbols-xeluatex.tex
}
