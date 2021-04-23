# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>

_pkgname='pytest-csv'
pkgname=("python-${_pkgname}")
pkgver=3.0.0
pkgrel=1
arch=('any')
license=('GPL')
pkgdesc='CSV output for pytest.'
url='https://github.com/nicoulaj/pytest-csv'
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('d7aaeaf25bbdeaa204d67f735556b99283d033d0ac2c4283d1a63df518b2db2a359178a3d0f5a9926431a776ffe0848bee42fbb7318f18170bf042abe3d64af3')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
