# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-winsspi
_pkgname=winsspi
pkgver=0.0.10
pkgrel=1
pkgdesc="Windows SSPI wrapper in pure python"
url="https://pypi.org/project/winsspi"
arch=('any')
license=('MIT')
depends=('python' 'python-minikerberos')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2f5a8d2c4b9f459144426909e26a74e550512e23b6cf9af52c2a00003c7c3fdb')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
