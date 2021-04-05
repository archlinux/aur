# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minikerberos
_pkgname=minikerberos
pkgver=0.2.10
pkgrel=1
pkgdesc="Kerberos manipulation library in pure Python"
url="https://pypi.org/project/minikerberos"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-asysocks')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('60d126b95f0e8ddb7996691082baeec4fcef20254d51bff6b849f7afe32b93f0')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
