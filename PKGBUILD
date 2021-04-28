# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minikerberos
_pkgname=minikerberos
pkgver=0.2.11
pkgrel=1
pkgdesc="Kerberos manipulation library in pure Python"
url="https://pypi.org/project/minikerberos"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-asysocks')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('382f829e4e3b185ccad50683103c67b5156b6a4a45881b8d7a533f479b7f0146')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
