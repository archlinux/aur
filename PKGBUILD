# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minikerberos
_pkgname=minikerberos
pkgver=0.2.4
pkgrel=1
pkgdesc="Kerberos manipulation library in pure Python"
url="https://pypi.org/project/minikerberos"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-asysocks')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('7865d48446ca664b1b701ba56e4828854f186ebd18e2a23ca1cf510a99aaf4f5')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
