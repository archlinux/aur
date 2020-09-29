# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minikerberos
_pypiname=minikerberos
pkgver=0.2.4
_file="0e/e2/8eb4c40a636bef6d8e0347b9ff60eb024c9c9cb5c7fbb2f8424fcddffb65"
pkgrel=1
pkgdesc="Kerberos manipulation library in pure Python"
url="https://pypi.org/project/minikerberos"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-asysocks')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/${_file}/minikerberos-${pkgver}.tar.gz")
sha256sums=('7865d48446ca664b1b701ba56e4828854f186ebd18e2a23ca1cf510a99aaf4f5')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
