pkgbase=python-pycmus
_name=pycmus
pkgname=('python-pycmus' 'python2-pycmus')
pkgver=0.1.1
pkgrel=1
pkgdesc="A python library cmus remote library"
arch=('any')
url='https://pypi.python.org/pypi/pycmus'
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('5a4f49fd78ca641d77a3c426741c9558770075f34e89cc0b687d92878a89708c')
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
