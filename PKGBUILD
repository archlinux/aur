# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-server
pkgver=0.99_1458061461
pkgrel=1

pkgdesc="A parsing, static analysis and proof management tool incorporating various provers and different specification languages."

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('custom:hets-license')
depends=('ghc>=6.8.2' 'tcl' 'tk' 'spass' 'eprover' 'darwin' 'hets-lib' 'ncurses' 'pellet' 'cairo' 'glib2' 'gettext' 'fontconfig' 'libglade')
optdepends=('isabelle')
provides=('hets-server')
conflicts=('hets-server')
sha1sums=('1a3d46b726fd851a8c20c871becdf7d4a780c026')

source=("http://www.informatik.uni-bremen.de/~eugenk/archlinux-aur/$pkgname/${pkgname}-${pkgver}.tar.gz")
package() {
  cd ${srcdir}

  mkdir -p ${pkgdir}/opt/${pkgname}/
  mkdir -p ${pkgdir}/usr/bin/

  mv ${srcdir}/${pkgname}-${pkgver}/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}/
}
