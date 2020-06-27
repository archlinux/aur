# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pypykatz
_pypiname=pypykatz
pkgver=0.3.9
pkgrel=1
pkgdesc="Partial Mimikatz implementation in pure Python."
url="https://pypi.org/project/pypykatz/"
arch=('any')
license=('MIT')
depends=('python' 'python-minidump' 'python-minikerberos' 'python-winsspi' 'python-msldap' 'python-aiowinreg')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/75/69/94eda8fa0ed711e395ae62e05bd7b416111b55bb298d0d4cf29aaacc406e/pypykatz-${pkgver}.tar.gz")
sha256sums=('6429db4c6587ef449331852fc31fd1cc3d7313dcbfb1ec3fca1f1290ee5e8cfb')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
