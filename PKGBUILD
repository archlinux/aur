# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: https://wiki.qt.io/Qt_Build_Suite
#
# For improvements/fixes to this package, please send a pull request:
# http://code.qt.io/cgit/qt-labs/qbs.git/

pkgname=qtc
pkgver=0.1
pkgrel=1
pkgdesc='Convenience script for qtcreator usage'
arch=('x86_64' 'i686')
url='https://github.com/sirspudd/scripts'
license=('LGPL')
source=("https://raw.githubusercontent.com/sirspudd/scripts/master/qtc")
sha256sums=('SKIP')

package() {
  cd ${srcdir}

  local installdir=${pkgdir}/usr/bin

  mkdir -p ${installdir}

  chmod +x qtc
  cp qtc ${installdir} 
}
