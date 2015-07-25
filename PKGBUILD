# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=fontawesome.sty
pkgver=4.3.0
pkgrel=1
pkgdesc="FontAwesome bindings for LaTeX"
url='http://www.ctan.org/pkg/fontawesome'
arch=('any')
license=('LPPL')
depends=('texlive-core' 'otf-font-awesome')
source=('http://mirrors.ctan.org/fonts/fontawesome/fontawesome.sty')
md5sums=('6870c1829c91e39fcc6bce077af550a5')
install=fontawesome.install

package() {
  install -Dm644 fontawesome.sty $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesome.sty
}
