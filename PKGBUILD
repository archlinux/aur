pkgbase=python-os-testr
pkgname=('python-os-testr' 'python2-os-testr')
pkgver=0.6.0
pkgrel=1
pkgdesc="A testr wrapper to provide additional functionality"
arch=('any')
url='https://pypi.python.org/pypi/os-testr'
license=('Apache')
source=(https://pypi.python.org/packages/source/o/os-testr/os-testr-$pkgver.tar.gz)
md5sums=('0530b0cc62621d4bd9dd8a1c06533b3a')
makedepends=('python2' 'python' 'python-setuptools' 'python2-setuptools')

package_python-os-testr() {
  depends=('python' 'python-subunit' 'python-testtools' 'python-testrepository' 'python-pbr')

  cd $srcdir/os-testr-$pkgver
  python setup.py install --root=$pkgdir
}

package_python2-os-testr() {
  depends=('python2' 'python2-subunit' 'python2-testtools' 'python2-testrepository' 'python2-pbr')

  cd $srcdir/os-testr-$pkgver
  python2 setup.py install --root=$pkgdir
}
