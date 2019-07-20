# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asset
_pypiname=asset
pkgver=0.6.12
pkgrel=1
pkgdesc="A package resource and symbol loading helper library, for Python"
url="https://pypi.org/project/passwordmeter/"
arch=('any')
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/47/f6/3fd40111e48cf242211c65976b9c3a1729450803adad67de5dcbb8419bad/asset-${pkgver}.tar.gz")
sha256sums=('addb25dbdbfa820c667e246f9c09122401df21cd9e94db919c72f8f04fc972eb')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
