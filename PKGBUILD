#Maintainer GI Jack <GI_Jack@hackermail.com>

pkgname=python-neotime
_pypiname=neotime
_pypidir="0b/7e/ca368a8d8e288be1352d4e2df35da1e01f8aaffbf526695df71630bcb8a6"
pkgver=1.7.4
pkgrel=1
pkgdesc="Python classes for working with temporal data to nanosecond precision"
url="https://pypi.org/project/neotime/"
arch=('any')
license=('Apache')
depends=('python' 'python-six' 'python-pytz')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/${_pypidir}/${_pypiname}-${pkgver}.tar.gz")

sha256sums=('4e0477ba0f24e004de2fa79a3236de2bd941f20de0b5db8d976c52a86d7363eb')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
