# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pypykatz
_pkgname=pypykatz
pkgver=0.5.0
pkgrel=1
pkgdesc="Partial Mimikatz implementation in pure Python."
url="https://pypi.org/project/pypykatz/"
arch=('any')
license=('MIT')
depends=('python' 'python-minidump' 'python-minikerberos' 'python-msldap' 'python-aiowinreg' 'python-aiosmb')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d69f2fe108b430da8c529704ad69f1bde62ee1de0de4150108306cc35c57f7a2')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
