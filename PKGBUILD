# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=pyvmomi
pkgname=(python-pyvmomi python2-pyvmomi)
pkgver=6.7.1
pkgrel=1
pkgdesc="VMware vSphere API Python Bindings"
url="https://pypi.python.org/pypi/pyvmomi/"
license=('Apache')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/vmware/pyvmomi/archive/v$pkgver.tar.gz")
sha256sums=('5640e047acf48af3c4fcf1caa286865aa91d38c43457a749376b49fbfbd7902a')

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
