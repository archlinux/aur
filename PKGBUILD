# Maintainer: Filip Gralinski <filipg@amu.edu.pl>

_name=natlibpy
pkgname=python-${_name}
pkgver=1.0.0
pkgrel=1
pkgdesc="Code Nathan Arthur finds reusing often"
arch=('any')
url="https://github.com/narthur/natlibpy"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/e8/af/8628717473ea934dce7179f01153ca687aa8ef7280dd8623418f1e6977fd/${_name}-${pkgver}.tar.gz")
sha256sums=('ea03a797968d355e8d7db7caf912d982e12824d99c31fed255c932fdb7b12bae')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
