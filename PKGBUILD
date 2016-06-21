pkgbase=python-pycmus
pkgname=('python-pycmus' 'python2-pycmus')
pkgver=0.1.0
pkgrel=1
pkgdesc="A python library cmus remote library"
arch=('any')
url='https://pypi.python.org/pypi/pycmus'
license=('GPL3')
source=("https://pypi.python.org/packages/51/b6/1acde8a61463ce35039fd2401884b9c6b2f03d34100c677c2e8378d5b833/pycmus-0.1.0.tar.gz")
md5sums=('595f7a5339fbb694a3f9ada2772acd5e')
makedepends=('python2-setuptools' 'python-setuptools')

package_python-pycmus() {
  depends=('python' 'python-six' 'python-pbr')
  cd $srcdir/pycmus-$pkgver
  python setup.py install --root=$pkgdir
}
package_python2-pycmus() {
  depends=('python2' 'python2-six' 'python2-pbr')
  cd $srcdir/pycmus-$pkgver
  python2 setup.py install --root=$pkgdir
}
