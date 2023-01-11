# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=python-parselglossy
_name=parselglossy
pkgver=0.8.1
pkgrel=1
epoch=
pkgdesc="Generic input parsing library, speaking in tongues."
arch=("x86_64")
url="https://parselglossy.readthedocs.io"
license=("MIT")
groups=()
depends=(python)
makedepends=(python-flit)
checkdepends=()
optdepends=()
provides=(python-parselglossy)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
validpgpkeys=()
source=(
  https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py2.py3-none-any.whl
)
sha256sums=("9d0978c51b1177fc4fe314d92bf096277ed520b93ea1b5cac84ca70b9b15baab")
package ()
{
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ${_name/-/_}-$pkgver-py2.py3-none-any.whl
}

