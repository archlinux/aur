# Maintainer: Tim Reddehase <robustus@rightsrestricted.com>

pkgname=hets
pkgver=0.99_1441029199
pkgrel=2

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages, thus providing a tool for heterogeneous specifications. Logic translations are first-class citizens."

url="http://www.informatik.uni-bremen.de/agbkb/forschung/formal_methods/CoFI/hets/index_e.htm"
arch=('x86_64')
license='custom:hets-license'
depends=('ghc' 'udrawgraph' 'tcl' 'tk' 'spass' 'ncurses' 'pellet' 'cairo' 'glib2' 'gtk2' 'gettext' 'fontconfig' 'libglade' 'darwin' 'eprover')
optdepends=('isabelle')
provides=('hets')
conflicts=('hets')
sha1sums=('ec09b17e0016245a4487263fb1e2c0ca07affd56')
source=("http://ontohub.rightsrestricted.com/hets/binaries/hets-${pkgver}.tar.gz")
package() {
  cd ${srcdir}

  mkdir -p ${pkgdir}/opt/hets/
  mkdir -p ${pkgdir}/usr/bin/

  mv ${srcdir}/hets-${pkgver}/bin/hets ${pkgdir}/usr/bin/hets

  cp -r ${srcdir}/hets-${pkgver}/* ${pkgdir}/opt/hets/
}
