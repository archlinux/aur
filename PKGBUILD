# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-aiosmb
_pkgname=aiosmb
pkgver=0.2.41
pkgrel=1
pkgdesc="Partial Mimikatz implementation in pure Python."
url="https://pypi.org/project/pypykatz/"
arch=('any')
license=('MIT')
depends=('python' 'python-minikerberos' 'python-winsspi' 'python-asysocks' 'python-prompt_toolkit' 'python-winacl' 'python-six' 'python-tqdm' 'python-colorama')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8622cba05b30874ae6e5fe53b1a5fecf244390e232cc65d53b433927977f82d4')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
