# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-desktop-bin
pkgver=0.99_1484075143
pkgrel=1

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages."

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('hets-commons' 'hets-lib' 'tcl' 'tk' 'ncurses' 'cairo' 'glib2' 'gettext' 'fontconfig' 'libglade' 'udrawgraph')
optdepends=('spass' 'eprover' 'darwin' 'pellet' 'isabelle')
provides=('hets-dekstop')
conflicts=('hets-dekstop')
source=('http://hets.eu/downloads/hets/archlinux/x86_64/hets-desktop-bin-0.99_1484075143-1.tar.gz')
sha256sums=('adb9be6710bf3249861a4b9335aa500c6bb7e7bcb1eb12bfb891e8d019f67165')

package() {
  cp -R usr $pkgdir
}
