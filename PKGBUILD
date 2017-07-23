# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-serpent
_pypi_pkgname=serpent
pkgver=1.23
pkgrel=1
pkgdesc='Serialization based on ast.literal_eval'
url='https://github.com/irmen/Serpent'
arch=('any')
license=('MIT')
depends=('python')
source=("https://pypi.io/packages/source/s/serpent/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('d9d6afa51f2560cf5933dcdfd947011d')

package() {
  cd ${_pypi_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
