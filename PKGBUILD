# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minikerberos
_pkgname=minikerberos
pkgver=0.2.14
pkgrel=1
pkgdesc="Kerberos manipulation library in pure Python"
url="https://pypi.org/project/minikerberos"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-asysocks')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('30d0fbaf81a4c7d46710c80497ad905c562bd4d125a22850d87794f61ca1b31f')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
