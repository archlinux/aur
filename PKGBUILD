# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pypsrp
_pypiname=pypsrp
pkgver=0.4.0
pkgrel=1
pkgdesc="Python PowerShell Remoting Protocol Client Library"
url="https://pypi.org/project/pypsrp/"
arch=('any')
license=('MIT')
depends=('python' 'python-six' 'python-cryptography' 'python-requests' 'python-ntlm-auth')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/f7/73/e116b8f1a5a2580d920bce5b1e3ad846b999ed68001f964d227647261f3d/pypsrp-${pkgver}.tar.gz")
sha256sums=('64b5bdd725a9744c821483b05ecd266f6417f4c6e90ee961a08838480f7d025e')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
