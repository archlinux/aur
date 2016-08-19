# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-server-bin
pkgver=0.99_1471594578
pkgrel=1

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages."

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('hets-commons' 'hets-lib' 'tcl' 'tk' 'ncurses' 'cairo' 'glib2' 'gettext' 'fontconfig' 'libglade')
optdepends=('spass' 'eprover' 'darwin' 'pellet' 'isabelle')
provides=('hets-server')
conflicts=('hets-server')
source=('http://www.informatik.uni-bremen.de/~eugenk/aur-hets/hets-server-bin-0.99_1471594578-1.tar.gz')
sha256sums=('4b31de9961804712e3fbcad55244d5b151ddad817524e06588615688de15dcfb')

package() {
  cp -R usr $pkgdir
}
