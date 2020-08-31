# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pypykatz
_pypiname=pypykatz
pkgver=0.3.12
pkgrel=1
pkgdesc="Partial Mimikatz implementation in pure Python."
url="https://pypi.org/project/pypykatz/"
arch=('any')
license=('MIT')
depends=('python' 'python-minidump' 'python-minikerberos' 'python-winsspi' 'python-msldap' 'python-aiowinreg')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/ee/c8/1f405de42e52b2fc06aed437ae02ce6e711605e755e304727b8917188c0f/pypykatz-${pkgver}.tar.gz")
sha256sums=('b63b19ec6ee8448bbcf7003e6ad1f9d7a2784fd8cee54aebcc5f717792a43200')


package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
