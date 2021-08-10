# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=python-runtest
_name=runtest
pkgver=2.2.2
pkgrel=1
epoch=
pkgdesc="Numerically tolerant end-to-end test library for research software."
arch=("x86_64")
url="https://runtest.readthedocs.io"
license=("Mozilla Public License version 2.0")
groups=()
depends=(python)
makedepends=()
checkdepends=()
optdepends=()
provides=(python-parselglossy)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py2.py3-none-any.whl
)
sha256sums=("cc1d255767eeefce66420e4c616dd1cd8120d6c51ee83c2b15921ba1040784bc")
package ()
{
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ${_name/-/_}-$pkgver-py2.py3-none-any.whl
}

