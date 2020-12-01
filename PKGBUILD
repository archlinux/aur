# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pypsrp
_pkgname=pypsrp
pkgver=0.5.0
pkgrel=1
pkgdesc="Python PowerShell Remoting Protocol Client Library"
url="https://pypi.org/project/pypsrp/"
arch=('any')
license=('MIT')
depends=('python' 'python-six' 'python-cryptography' 'python-requests' 'python-ntlm-auth')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e4d13c84a5a150c75ec5bc8653059fa78e8421172049e0496d1df89ca24d9a6d')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
