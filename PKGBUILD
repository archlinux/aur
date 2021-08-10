#Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=python-quadpy
_name=quadpy
pkgver=0.16.8
pkgrel=4
pkgdesc='Numerical integration (quadrature, cubature) in Python'
arch=(any)
license=(GPL)
url="https://github.com/nschloe/quadpy"
depends=(python)
makedepends=(python-build python-pip git-lfs)
replaces=()
conflicts=(python-quadpy)
provides=(python-quadpy)
source=(
  https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py3-none-any.whl
)
sha256sums=(
  4e3872ba00e7a8e9ac97be95babee583821a0e142eddad9ceb63beaed1832138
)
md5sums=(
)
validpgpkeys=()

package ()
{
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ${pkgname#"python-"}-$pkgver-py3-none-any.whl
}


# vim: set ts=2 sw=2 et:

