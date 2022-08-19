# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-msldap
_pkgname=msldap
pkgver=0.3.40
pkgrel=1
pkgdesc="Python library to play with MS LDAP"
url="https://pypi.org/project/msldap/"
arch=('any')
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-winsspi' 'python-minikerberos' 'python-asysocks' 'python-tqdm' 'python-winacl' 'python-prompt_toolkit')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e2c22a6e396b4d7d65d73863ed44612120e8e2570ff895b5421ddf6a350085bb')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
