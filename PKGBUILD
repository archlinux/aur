# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-ewmhlib"
_name="EWMHlib"
pkgver=0.2
pkgrel=1
pkgdesc="Extended Window Manager Hints implementation in Python 3 which allows to easily query and control Window Managers which follow these standards"
arch=('any')
url="https://pypi.org/project/ewmhlib/"
license=('BSD-3-Clause license')
provides=(python-ewmhlib)
depends=(
  python-typing_extensions
  python-xlib
)
optdepends=()
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$_name-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('f5b07d8cfd4c7734462ee744c32d490f2f3233fa7ab354240069344208d2f6f5')

package() {
  python -m installer --prefix="/usr" --destdir="${pkgdir}" *.whl
}
