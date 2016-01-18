# Maintainer: Emanuel Evans <mail@emanuel.industries>

_pyver=python2
_pybase=pydora
pkgname="${_pyver}-${_pybase}"
pkgver=1.6.5
pkgrel=1
pkgdesc="Python Client for Pandora"
md5sums=('c8f2a682027a735d4cc088730e20eb65')

arch=('any')
url="https://github.com/mcrute/pydora"
license=('MIT')
depends=('mpg123' "${_pyver}-crypto>=2.6.1" "${_pyver}-requests>=2")
makedepends=("${_pyver}" "${_pyver}-setuptools")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mcrute/pydora/archive/release-${pkgver}.tar.gz")

package() {
  cd "${_pybase}-release-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
