pkgbase=python-os-testr
pkgname=('python-os-testr' 'python2-os-testr')
pkgver=0.8.0
pkgrel=1
pkgdesc="A testr wrapper to provide additional functionality"
arch=('any')
url='https://pypi.python.org/pypi/os-testr'
license=('Apache')
source=(https://pypi.python.org/packages/26/93/fc660b2170c9f49a6d1855d14233596d6000be16c270f3b9ad9550923ed1/os-testr-0.8.0.tar.gz)
md5sums=('4d5a04d8c9a4ae8972eb0d653323f1ed')
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
