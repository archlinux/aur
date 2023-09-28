# Maintainer: Bailey Kasin <baileykasin@gmail.com>
# Contributer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=pyvmomi
pkgname=python-pyvmomi
pkgver=8.0.2.0
pkgrel=1
pkgdesc="VMware vSphere API Python Bindings"
url="https://pypi.python.org/pypi/pyvmomi/"
license=('Apache')
arch=('any')
makedepends=('python-setuptools')
source=("https://github.com/vmware/pyvmomi/archive/v$pkgver.tar.gz")
sha256sums=('f2a3105875a36c385254ea9dcd5b7e171c8584fdad5ae81ccb40e18635d2d87c')

package() {
  depends=('python' 'python-six' 'python-requests')
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
