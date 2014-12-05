# Maintainer: James An <james@jamesan.ca>

_pkgname=bencodepy
pkgname=python-${_pkgname}
pkgver=0.9.4
pkgrel=1
pkgdesc='A small Python 3 library for encoding and decoding Bencode data'
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}/${_pkgver}"
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.zip")
md5sums=('9f769b69deb7ae1b38e448e52b9598f6')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
