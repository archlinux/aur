# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minidump
_pkgname=minidump
pkgver=0.0.18
pkgrel=1
pkgdesc="Python library to parse and read Microsoft minidump file format"
url="https://pypi.org/project/minidump"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b9fe0a65cf42d60591807bb8b6d9357e92f6a46f2851befdbaf08894722d07ff')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
