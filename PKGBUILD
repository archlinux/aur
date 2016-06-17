pkgbase=python-pycmus
pkgname=('python-pycmus' 'python2-pycmus')
pkgver=0.0.3
pkgrel=1
pkgdesc="A python library cmus remote library"
arch=('any')
url='https://pypi.python.org/pypi/pycmus'
license=('GPL3')
source=("https://pypi.python.org/packages/7c/d2/14a5c9b9968c4cbf9482272a29069e9e557facc49b5b8a4990ee011c8dfe/pycmus-0.0.3.tar.gz")
md5sums=('822290873ce6f1cef6458bd57fbd985a')
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
