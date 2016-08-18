# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-server-bin
pkgver=0.99_1471209385
pkgrel=1

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages."

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('custom:hets-license')
depends=('hets-commons' 'hets-lib' 'tcl' 'tk' 'ncurses' 'cairo' 'glib2' 'gettext' 'fontconfig' 'libglade')
optdepends=('spass' 'eprover' 'darwin' 'pellet' 'isabelle')
provides=('hets-server')
conflicts=('hets-server')
source=('http://www.informatik.uni-bremen.de/~eugenk/aur-hets/hets-server-bin-0.99_1471209385-1.tar.gz')
sha256sums=('f367dbdf525c80682c50b829c943d8a525294cc58f6d9f444ab035b29a32adf5')

package() {
  cp -R usr $pkgdir
}
