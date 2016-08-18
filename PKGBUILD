# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-desktop-bin
pkgver=0.99_1471594578
pkgrel=1

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages."

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('hets-commons' 'hets-lib' 'tcl' 'tk' 'ncurses' 'cairo' 'glib2' 'gettext' 'fontconfig' 'libglade')
optdepends=('spass' 'eprover' 'darwin' 'pellet' 'isabelle')
provides=('hets-dekstop')
conflicts=('hets-dekstop')
source=('http://www.informatik.uni-bremen.de/~eugenk/aur-hets/hets-desktop-bin-0.99_1471594578-1.tar.gz')
sha256sums=('45df9d92e994f3b4e71e0e207988c594d70a5711ae082d4ebb17042214d61c2a')

package() {
  cp -R usr $pkgdir
}
