# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-serpent
_pypi_pkgname=serpent
pkgver=1.19
pkgrel=1
pkgdesc='Serialization based on ast.literal_eval'
url='https://github.com/irmen/Serpent'
arch=('any')
license=('MIT')
depends=('python')
source=("https://pypi.io/packages/source/s/serpent/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('cdef596f727cb6b4176c89769d2d41ee')

package() {
  cd ${_pypi_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
