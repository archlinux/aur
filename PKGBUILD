# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pypsrp
_pkgname=pypsrp
pkgver=0.7.0
pkgrel=1
pkgdesc="Python PowerShell Remoting Protocol Client Library"
url="https://pypi.org/project/pypsrp/"
arch=('any')
license=('MIT')
depends=('python' 'python-six' 'python-cryptography' 'python-requests'
	 'python-pyspnego' 'python-gssapi')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d7144ad7c798a4dcded20a71c712d63eb4bfb32debe62f3a98f01481384a5558')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
