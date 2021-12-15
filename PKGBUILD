# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-minidump
_pkgname=minidump
pkgver=0.0.21
pkgrel=1
pkgdesc="Python library to parse and read Microsoft minidump file format"
url="https://pypi.org/project/minidump"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('83d612afb6c57727ebf38aca433b550f83f9f8c7c3b6562ad2ab97071fd85f3a')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
