# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-msldap
_pypiname=msldap
pkgver=0.3.9
pkgrel=1
pkgdesc="Python library to play with MS LDAP"
url="https://pypi.org/project/msldap/"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-winsspi' 'python-minikerberos' 'python-asysocks' 'python-tqdm' 'python-winacl' 'python-prompt_toolkit')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/e0/a8/199c06eb5be28e6a6939e8d3bfcfb8d98b96e2193f03575431f66d4bfc48/msldap-${pkgver}.tar.gz")
sha256sums=('ef1536a07cb6bf9e16d7cde2b675dadbf16529040fad0f7c426247b4ec1eff21')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
