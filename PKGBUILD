# Maintainer: M0Rf30

pkgname=pyqt4topyqt5
pkgver=12112013
pkgrel=2
pkgdesc="A tool to help to convert an application PyQt4 to PyQt5"
arch=('i686' 'x86_64')
url="http://oqapy.eu"
license=('LGPL')
source=("http://oqapy.eu/releases/$pkgname.tar.gz"
	'pyqt4topyqt5.sh')
 
package() {
  cd ${srcdir}/$pkgname*
  
  install -m755 -d ${pkgdir}/usr/lib/python3.3/
  cp *.py ${pkgdir}/usr/lib/python3.3/
  install -D -m644 ${srcdir}/pyqt4topyqt5.sh ${pkgdir}/usr/bin/pyqt4topyqt5
  chmod +x ${pkgdir}/usr/bin/pyqt4topyqt5
}

md5sums=('dd76a5a290bc3244fd4187c4075b9064'
         '1828862eb80db72059b1375ca3060286')
