# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pypykatz
_pkgname=pypykatz
pkgver=0.3.15
pkgrel=1
pkgdesc="Partial Mimikatz implementation in pure Python."
url="https://pypi.org/project/pypykatz/"
arch=('any')
license=('MIT')
depends=('python' 'python-minidump' 'python-minikerberos' 'python-winsspi' 'python-msldap' 'python-aiowinreg')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('718618aabf115d06136007fb4cd6bf3baf98ffc004c5bd90baf8d0cd9546d0e5')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
