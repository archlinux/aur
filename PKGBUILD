# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=pyvmomi
pkgname=(python-pyvmomi python2-pyvmomi)
pkgver=6.5.0.2017.5
pkgrel=1
pkgdesc="VMware vSphere API Python Bindings"
url="https://pypi.python.org/pypi/pyvmomi/"
license=('Apache')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/vmware/pyvmomi/archive/v$pkgver.tar.gz")
sha256sums=('6674e78750e18fe07f86a0c034bb4f056c2d865a8824e0e616202c010e3b53b0')

package_python-pyvmomi() {
  depends=('python' 'python-six')
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

package_python2-pyvmomi() {
  depends=('python2' 'python2-six')
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
