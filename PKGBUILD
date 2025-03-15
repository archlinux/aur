# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-pywinbox"
_name="PyWinBox"
pkgver=0.7
pkgrel=2
pkgdesc="Cross-Platform and multi-monitor toolkit to handle rectangular areas and windows box"
arch=('any')
url="https://pypi.org/project/pywinbox/"
license=('BSD-3-Clause license')
provides=(python-pywinbox)
depends=(
  python-typing_extensions
  # AUR dependencies
  python-xlib python-ewmhlib
)
optdepends=()
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$_name-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('8b2506a8dd7afa0a910b368762adfac885274132ef9151b0c81b0d2c6ffd6f83')

package() {
  python -m installer --prefix="/usr" --destdir="${pkgdir}" *.whl
}
