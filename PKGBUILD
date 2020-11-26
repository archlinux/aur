# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-clearbit
_pkgname=clearbit
pkgver=0.1.7
pkgrel=2
pkgdesc="A Python API client to https://clearbit.com"
arch=('any')
url="https://pypi.org/project/clearbit/"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f1d5b854a9b0e8d6644bad2594f9e65ab756ffb0c6c34db15ecfc1e9179bb883')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
