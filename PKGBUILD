# Maintainer: Jameson Pugh <imntrealgmail.com>

pkgbase=python-dbusmock
pkgname=python-dbusmock
pkgname=('python-dbusmock' 'python2-dbusmock')
pkgver=0.16.6
pkgrel=1
pkgdesc="create mock objects on D-Bus"
arch=('i686' 'x86_64')
url="https://github.com/martinpitt/python-dbusmock/"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/martinpitt/${pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('ee3bb9f62adbc28afa0d92ce9b855d69af29ea153acf06060556a3d8a037e400')

package_python2-dbusmock() { 
  depends=('python2')
  pkgdesc="create mock objects on D-Bus (python2 version)"
  cd "${srcdir}/${pkgbase}-${pkgver}"
  
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

package_python-dbusmock() { 
  depends=('python')
  pkgdesc="create mock objects on D-Bus (python3 version)"
  cd "${srcdir}/${pkgbase}-${pkgver}"
  
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
