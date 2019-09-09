# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=pyvmomi
pkgname=(python-pyvmomi python2-pyvmomi)
pkgver=6.7.3
pkgrel=1
pkgdesc="VMware vSphere API Python Bindings"
url="https://pypi.python.org/pypi/pyvmomi/"
license=('Apache')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/vmware/pyvmomi/archive/$pkgver.tar.gz")
sha256sums=('f8fb1a230e914f913a1288a784267606e9f7672143e15584453e191918275f35')

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
