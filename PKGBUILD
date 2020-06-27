# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-winsspi
_pypiname=winsspi
pkgver=0.0.9
pkgrel=1
pkgdesc="Windows SSPI wrapper in pure python"
url="https://pypi.org/project/winsspi"
arch=('any')
license=('MIT')
depends=('python' 'python-minikerberos')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/bc/dc/ec5d16880452aca0c86b92aa7828255f7808d3aaf92b69b34d8182659d2a/winsspi-${pkgver}.tar.gz")
sha256sums=('a2ad9c0f6d70f6e0e0d1f54b8582054c62d8a09f346b5ccaf55da68628ca10e1')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
