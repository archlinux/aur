# Maintainer: Bailey Kasin <baileykasin@gmail.com>
# Contributer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=pyvmomi
pkgname=python-pyvmomi
pkgver=8.0.3.0.1
pkgrel=1
pkgdesc="VMware vSphere API Python Bindings"
url="https://pypi.python.org/pypi/pyvmomi/"
license=('Apache')
arch=('any')
makedepends=('python-setuptools')
source=("https://github.com/vmware/pyvmomi/archive/v$pkgver.tar.gz")
sha256sums=('4ed2ff75b60612a23da6e16d7b46d8bc030a82e0f01eebdfcb8973a67c30df9a')

package() {
  depends=('python' 'python-six' 'python-requests')
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
