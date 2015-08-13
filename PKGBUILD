# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=fontawesome.sty
pkgver=4.4.0
pkgrel=1
pkgdesc="FontAwesome bindings for LaTeX"
url='http://www.ctan.org/pkg/fontawesome'
arch=('any')
license=('LPPL')
depends=('texlive-core' 'otf-font-awesome')
source=('http://mirrors.ctan.org/fonts/fontawesome/tex/fontawesome.sty')
md5sums=('e6a4b85730ead959e96981926c2c8ea6')
install=fontawesome.install

package() {
  install -Dm644 fontawesome.sty $pkgdir/usr/share/texmf/tex/latex/fontawesome/fontawesome.sty
}
