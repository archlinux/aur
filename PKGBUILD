# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-desktop-bin
pkgver=0.99_1472225208
pkgrel=1

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages."

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('hets-commons' 'hets-lib' 'tcl' 'tk' 'ncurses' 'cairo' 'glib2' 'gettext' 'fontconfig' 'libglade' 'udrawgraph')
optdepends=('spass' 'eprover' 'darwin' 'pellet' 'isabelle')
provides=('hets-dekstop')
conflicts=('hets-dekstop')
source=('http://www.informatik.uni-bremen.de/~eugenk/aur-hets/hets-desktop-bin-0.99_1472225208-1.tar.gz')
sha256sums=('c8538ae471f3a7d6f1dcca1f905dc604c4bc69511487e7b8445dedfa1a1665dc')

package() {
  cp -R usr $pkgdir
}
