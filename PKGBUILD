# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-pymonctl"
_name="PyMonCtl"
pkgver=0.92
pkgrel=2
pkgdesc="Cross-Platform module which provides a set of features to get info on and control monitors/screens/displays."
arch=('any')
url="https://pypi.org/project/pymonctl/"
license=('BSD-3-Clause license')
provides=(python-pywmonctl)
depends=(
  python-typing_extensions
  # AUR dependencies
  python-xlib python-ewmhlib
)
optdepends=()
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$_name-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('2495d8dab78f9a7dbce37e74543e60b8bd404a35c3108935697dda7768611b5a')

package() {
  python -m installer --prefix="/usr" --destdir="${pkgdir}" *.whl
}
