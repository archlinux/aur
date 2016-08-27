# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-server-bin
pkgver=0.99_1472225208
pkgrel=1

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages."

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('hets-commons' 'hets-lib' 'tcl' 'tk' 'ncurses' 'cairo' 'glib2' 'gettext' 'fontconfig' 'libglade')
optdepends=('spass' 'eprover' 'darwin' 'pellet' 'isabelle')
provides=('hets-server')
conflicts=('hets-server')
source=('http://www.informatik.uni-bremen.de/~eugenk/aur-hets/hets-server-bin-0.99_1472225208-1.tar.gz')
sha256sums=('4076ed79c9868f010fb40bd5e5a5265d4830465b8810055f56f88c03bc6cc8fb')

package() {
  cp -R usr $pkgdir
}
