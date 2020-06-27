# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pywerview
_pypiname=pywerview
_pypidir="8b/ca/fc13415e41427f5bc925ccbe80361af2bdf4c6f21c9683e28c12d0703f72"
pkgver=0.2.0
pkgrel=1
pkgdesc="A package resource and symbol loading helper library, for Python"
url="https://pypi.org/project/pywerview/"
arch=('any')
license=('GPLv3')
depends=('python' 'impacket' 'python-pyopenssl' 'python-pyasn1' 'python-pycryptodome'
'python-pyopenssl' 'python-beautifulsoup4')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/${_pypidir}/${_pypiname}-${pkgver}.tar.gz")

sha256sums=('9b254fe6911071484a83eea3bd2e25b2436773efc255bac74c0abaa1400132b8')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
