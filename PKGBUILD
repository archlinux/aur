# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-server-bin
pkgver=0.99_1484075143
pkgrel=1

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages."

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('hets-commons' 'hets-lib' 'tcl' 'tk' 'ncurses' 'cairo' 'glib2' 'gettext' 'fontconfig' 'libglade')
optdepends=('spass' 'eprover' 'darwin' 'pellet' 'isabelle')
provides=('hets-server')
conflicts=('hets-server')
source=('http://hets.eu/downloads/hets/archlinux/x86_64/hets-server-bin-0.99_1484075143-1.tar.gz')
sha256sums=('89c79076e7bed40c776c2fc5429af4c1f28c5dae5f1a6e694fa6a3665eacfa1d')

package() {
  cp -R usr $pkgdir
}
