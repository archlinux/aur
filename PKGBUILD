# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minidump
_pkgname=minidump
pkgver=0.0.17
pkgrel=1
pkgdesc="Python library to parse and read Microsoft minidump file format"
url="https://pypi.org/project/minidump"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9e53d6f374ebdda79cd6d4981e07194f077ec9d375d92e963702bb81dc1d6ad6')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
