# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minikerberos
_pypiname=minikerberos
pkgver=0.2.3
pkgrel=1
pkgdesc="Kerberos manipulation library in pure Python"
url="https://pypi.org/project/minikerberos"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-asysocks')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/ab/47/293556d2425c944d79a51565904de5268582d761114372453d36f2de6a78/minikerberos-${pkgver}.tar.gz")
sha256sums=('fc9394ad27a57bb0d4b23989c550181f3f37b7d0ac6e4187a0246779b7dc7295')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
