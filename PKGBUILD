# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributors: Andrea Scarpino <andrea@archlinux.org> - Nicolás Adamo

pkgname=pyqt-doc
pkgver=5.7
pkgrel=1
pkgdesc='PyQt5 Documentation'
arch=('any')
url='http://www.riverbankcomputing.com/software/pyqt/intro'
license=('GPL')
options=('docs' '!strip')
source=("http://sourceforge.net/projects/pyqt/files/PyQt5/PyQt5-${pkgver}/PyQt5_gpl-${pkgver}.tar.gz")
md5sums=('e3dc21f31fd714659f0688e1eb31bacf')

package() {
  install -d "${pkgdir}"/usr/share/doc/pyqt5
  cp -a ${srcdir}/PyQt5_gpl-${pkgver}/doc/html "${pkgdir}"/usr/share/doc/pyqt5
  cp -a ${srcdir}/PyQt5_gpl-${pkgver}/examples "${pkgdir}"/usr/share/doc/pyqt5
}
