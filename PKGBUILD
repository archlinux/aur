# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Laurent Meunier <laurent@deltalima.net>
pkgname=exiflow
pkgver=0.4.5
pkgrel=1
pkgdesc="Exiflow is a set of tools (command line and GUI) to provide a complete digital photo workflow for Unixes."
arch=('any')
url="http://exiflow.sourceforge.net/"
license=('GPL')
depends=(perl-exiftool pygtk)
source=(http://downloads.sourceforge.net/project/exiflow/exiflow/${pkgver}/Exiflow-${pkgver}.tar.gz)
sha256sums=('36eeced2de5a726aef572c42e9b71aca2d957ea51c72b5e56720eec736b29320')

package() {
  cd ${srcdir}

  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 ${srcdir}/usr/bin/{exiassign,exiconvert,exigate,exigui,exiimport,exiperson,exirename} "${pkgdir}/usr/bin"

  install -m755 -d "${pkgdir}/usr/share/exiflow/exiflow"
  cp ${srcdir}/usr/share/exiflow/exiflow/* "${pkgdir}/usr/share/exiflow/exiflow"
}

# vim:set ts=2 sw=2 et:A
