# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-pywinctl"
_name="PyWinCtl"
pkgver=0.4.1
pkgrel=2
pkgdesc="Cross-Platform module to get info on and control windows on screen"
arch=('any')
url="https://pypi.org/project/pywinctl/"
license=('Apache 2.0')
provides=(python-pywinctl)
depends=(
  python-typing_extensions
  # AUR dependencies
  python-xlib python-ewmh python-pywinbox python-pymonct
)
optdepends=()
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$_name-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('4d875e22969e1c6239d8c73156193630aaab876366167b8d97716f956384b089')

package() {
  python -m installer --prefix="/usr" --destdir="${pkgdir}" *.whl
}
