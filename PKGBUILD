# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=python-parselglossy
_name=parselglossy
pkgver=0.7.0
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
sha256sums=("d245a9e83f31d3dbd17886269ae17cdd2bafb5bc8d5389aaf73fe96f52bd8e83")
package ()
{
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ${_name/-/_}-$pkgver-py2.py3-none-any.whl
}

