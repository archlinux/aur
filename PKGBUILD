# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=python-runtest
_name=runtest
pkgver=2.3.2
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
provides=(python-runtest)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py2.py3-none-any.whl
)
sha256sums=("eee450556ca51aa7b94c289181d53cfa8ca67f362d6f1b5a5a0acd5dbbc5fb9b")
package ()
{
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ${_name/-/_}-$pkgver-py2.py3-none-any.whl
}

