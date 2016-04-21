# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-petname
pkgname=('python-petname' 'python2-petname')
pkgname=python-petname
pkgver=1.12
pkgrel=1
epoch=1
pkgdesc="Generate human-readable, random object names."
arch=(any)
url="https://pypi.python.org/pypi/petname"
license=('apache')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/48/d7/a276a49c3527c1f4962869bb99f2b160003fccdd96a13fcb0e8c20d13356/petname-${pkgver}.tar.gz")
sha256sums=('5555129677425950efccb297c4e1681e759ccd48621121f710aa12a18bf2732d')

package_python2-petname() {
  depends=('python2')
  pkgdesc="Generate human-readable, random object names. (python2 version)"
  
  cd "${srcdir}/petname-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

package_python-petname() {
  depends=('python')
  pkgdesc="Generate human-readable, random object names. (python3 version)"

  cd "${srcdir}/petname-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
