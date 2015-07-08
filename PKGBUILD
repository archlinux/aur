# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=fontawesome.sty
pkgver=3.1.1
pkgrel=2
pkgdesc="FontAwesome bindings for LaTeX"
url='http://www.ctan.org/pkg/fontawesome'
arch=('any')
license=('LPPL')
depends=('texlive-core' 'otf-font-awesome')
source=('http://mirrors.ctan.org/fonts/fontawesome/fontawesome.sty')
md5sums=('b2d0a4e61a3e0d6f34415fd6e81c74d3')
install=fontawesome.install

package() {
  install -Dm644 fontawesome.sty $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesome.sty
}
