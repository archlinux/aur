# Contributors: Andrea Scarpino <andrea@archlinux.org> - Nicolás Adamo

pkgname=pyqt-doc
pkgver=5.4.2
pkgrel=1
pkgdesc='PyQt Documentation'
arch=('any')
url='http://www.riverbankcomputing.com/software/pyqt/intro'
license=('GPL')
options=('docs' '!strip')
source=("http://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-${pkgver}/PyQt-gpl-${pkgver}.tar.gz")
md5sums=('33936458544b69251a8f4a2308d469d3')

package() {
  install -d "${pkgdir}"/usr/share/doc/pyqt
  cp -r ${srcdir}/PyQt-gpl-${pkgver}/doc/html "${pkgdir}"/usr/share/doc/pyqt
  cp -r ${srcdir}/PyQt-gpl-${pkgver}/examples "${pkgdir}"/usr/share/doc/pyqt
}
