# Maintainer: Bailey Kasin <baileykasin@gmail.com>
# Contributer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=pyvmomi
pkgname=python2-pyvmomi
pkgver=8.0.1.0.2
pkgrel=1
pkgdesc="VMware vSphere API Python Bindings"
url="https://pypi.python.org/pypi/pyvmomi/"
license=('Apache')
arch=('any')
makedepends=('python2-setuptools')
source=("https://github.com/vmware/pyvmomi/archive/v$pkgver.tar.gz")
sha256sums=('662daca80a1c20d37ee0b1185855cf8131daded7fa6ab4e776a822b22a7cb84b')

package() {
  depends=('python2' 'python2-six' 'python2-requests')
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
