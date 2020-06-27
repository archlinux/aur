# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-msldap
_pypiname=msldap
pkgver=0.3.9
pkgrel=1
pkgdesc="Python library to play with MS LDAP"
url="https://pypi.org/project/msldap/"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-winsspi' 'python-minikerberos' 'python-asysocks' 'python-tqdm')
# needs winacl, prompt-toolkit
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/e0/a8/199c06eb5be28e6a6939e8d3bfcfb8d98b96e2193f03575431f66d4bfc48/msldap-${pkgver}.tar.gz")
sha256sums=('a2ad9c0f6d70f6e0e0d1f54b8582054c62d8a09f346b5ccaf55da68628ca10e1')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
