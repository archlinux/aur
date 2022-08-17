# Maintainer: Thibaud Kehler <thibaud dot kehler at gmx dot net>
# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=python-aesedb
_pkgname=aesedb
pkgver=0.0.5
pkgrel=1
pkgdesc="Asynchronous parser for JET."
url="https://github.com/skelsec/aesedb"
arch=('any')
license=('MIT')
depends=('python' 'python-unicrypto' 'python-aiowinreg' 'python-tqdm' 'python-colorama' 'python-pycryptodomex')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('da6e15c6a4c3f73bd4a59d4ef3f481a6b0331b8bd45f8cf72ed84ca4fe4773c8')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
