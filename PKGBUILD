# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=pyvmomi
pkgname=(python-pyvmomi python2-pyvmomi)
pkgver=7.0.1
pkgrel=2
pkgdesc="VMware vSphere API Python Bindings"
url="https://pypi.python.org/pypi/pyvmomi/"
license=('Apache')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/vmware/pyvmomi/archive/v$pkgver.tar.gz")
sha256sums=('602a8895ae4e2d0549574317439f4721fa4b1e2912bf1b42e00347cd477e36c9')

package_python-pyvmomi() {
  depends=('python' 'python-six' 'python-requests')
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

package_python2-pyvmomi() {
  depends=('python2' 'python2-six' 'python2-requests')
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
