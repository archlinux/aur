# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=pyvmomi
pkgname=(python-pyvmomi python2-pyvmomi)
pkgver=6.0.0.2016.4
pkgrel=2
pkgdesc="VMware vSphere API Python Bindings"
url="https://pypi.python.org/pypi/pyvmomi/"
license=('Apache')
arch=('i686' 'x86_64')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/vmware/pyvmomi/archive/v$pkgver.tar.gz")
sha256sums=('3c1d80703c0b4a6c2c1e9280ced64980ce36745ea641130f68f28206d42eaea6')

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
