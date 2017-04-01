# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributors: Andrea Scarpino <andrea@archlinux.org> - Nicolás Adamo

pkgname=pyqt-doc
pkgver=5.8.2
pkgrel=1
pkgdesc='PyQt5 Documentation.'
arch=('any')
url='http://www.riverbankcomputing.com/software/pyqt/intro'
license=('GPL')
options=('docs' '!strip')
source=("https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-${pkgver}/PyQt5_gpl-${pkgver}.tar.gz")
md5sums=('c3048e9d242f3e72fd393630da1d971a')

package() {
  install -d "${pkgdir}"/usr/share/doc/pyqt5
  cp -a ${srcdir}/PyQt5_gpl-${pkgver}/doc/html "${pkgdir}"/usr/share/doc/pyqt5
  cp -a ${srcdir}/PyQt5_gpl-${pkgver}/examples "${pkgdir}"/usr/share/doc/pyqt5
}
