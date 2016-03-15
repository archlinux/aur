# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets
pkgver=0.99_1458042743
pkgrel=1

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages."

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('custom:hets-license')
depends=('ghc>=6.8.2' 'udrawgraph>=3.1.1' 'tcl' 'tk' 'spass' 'eprover' 'darwin' 'hets-lib' 'ncurses' 'pellet' 'cairo' 'glib2' 'gtk2' 'gettext' 'fontconfig' 'libglade')
optdepends=('isabelle')
provides=('hets')
conflicts=('hets')
sha1sums=('97562b6d4fcc2a120150a17f5d09fffa2e4a6199')

source=("http://www.informatik.uni-bremen.de/~eugenk/archlinux-aur/hets/hets-${pkgver}.tar.gz")
package() {
  cd ${srcdir}

  mkdir -p ${pkgdir}/opt/hets/
  mkdir -p ${pkgdir}/usr/bin/

  mv ${srcdir}/hets-${pkgver}/bin/hets ${pkgdir}/usr/bin/hets

  cp -r ${srcdir}/hets-${pkgver}/* ${pkgdir}/opt/hets/
}
