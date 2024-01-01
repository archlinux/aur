# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com>

_name=tslearn
pkgname=python-${_name,,}
pkgver=0.6.3
pkgrel=1
pkgdesc='A machine learning toolkit dedicated to time-series data'
arch=('any')
url="https://github.com/tslearn-team/tslearn"
license=('BSD-2-Clause')
depends=('python' 'python-numpy' 'python-scipy' 'python-scikit-learn' 'python-numba' 'python-joblib' 'python-tensorflow')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('18c3b1984b4be2af0e7579c0b914633f2220bba2b6610c11861c4563272e9169')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
