# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minikerberos
_pkgname=minikerberos
pkgver=0.2.20
pkgrel=1
pkgdesc="Kerberos manipulation library in pure Python"
url="https://pypi.org/project/minikerberos"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-asysocks' 'python-oscrypto')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('789f802263fa1882f701b123f6eec048b45cd731bf1b528870005daf07402047')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
